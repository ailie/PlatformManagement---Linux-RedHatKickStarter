### Adds some local repos

relCallingPath=`dirname "$0"`
callingName=`basename "$0"`

repoName="$1"
reposPool="$2"      #TODO we once had a double slash in the generated repo file, so validate and re-format this received path !

repoFile="/etc/yum.repos.d/$repoName.repo"
scratchFile="/tmp/`basename "$0"`.tmp"


if [ -n "$1" ] && [ -d "$2" ]; then

  echo -e \
  "[$repoName]"\
  '\nname=Fedora $releasever - $basearch (RPM cache)'\
  '\nbaseurl="file://'$reposPool'Fedora-$releasever-RPM-cache-$basearch"'\
  "\ncost=0"\
  "\nenabled=1"\
  "\ngpgcheck=1"\
  "\ngpgkey="\
  '\n    file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch'\
  '\n    file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch'\
  '\n    file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'\
  > "$scratchFile" && bash "$relCallingPath/cp.sh" "$scratchFile" "$repoFile"

else

  echo -e "\nWARNING: Proceeding without any locally cached repository."

fi


operatingSystem=$(grep -oE '^\w+' /etc/system-release)
argList=()
#argList=(yum-plugin-priorities)

### Add remote repositories and their pub keys. Note that RPM packages are GPG-signed, so in order to be able to properly install packages from our local cached repositories, first we have to obtain all the required public keys for those packages.

if [ "$operatingSystem" == "CentOS" ]; then
    argList+=(epel-release)
    argList+=(http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm)
    # rpmfusion doesn't yet provide a EL7 repo, as of 30 nov 2014; note that by using older rpmfusion releases (eg for EL6), dep hell may unleash on you (eg rpmfusion rpms may require old EL6 libs)
    #argList+=(http://download1.rpmfusion.org/free/el/updates/6/x86_64/rpmfusion-free-release-6-1.noarch.rpm http://download1.rpmfusion.org/nonfree/el/updates/6/x86_64/rpmfusion-nonfree-release-6-1.noarch.rpm)
elif [ "$operatingSystem" == "Fedora" ]; then
    argList+=(http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm)
    
    # yum-config-manager (part of yum-utils) may be unavailable on some minimal installs; maybe switch to 'curl' ?
    yum-config-manager --add-repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
    
else
    echo "Error: unsupported OS: $operatingSystem"
    exit 1
fi

yum -- install "${argList[@]}"
