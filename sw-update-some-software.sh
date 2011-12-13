### Update the package management subsystem

echo

yum update rpm yum

yum update              \
    rpmfusion-*-release \
    epel-release        \
    nux-*-release

read -p "This is a good moment to set repo priorities (if you use that yum plugin) and exclude certain packagest from important, hi-prio, repos (eg epel-release from @extras, on EL)"
