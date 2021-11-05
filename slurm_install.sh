#For the headnode:
yum install -y https://github.com/openhpc/ohpc/releases/download/v1.3.GA/ohpc-release-1.3-1.el7.x86_64.rpm

yum install -y ohpc-slurm-server lmod-ohpc createrepo

#Grab local copies of these packages for the compute node images
# These will be pointed end up in 'otherpkgdir' as in lsdef -t osimage centos7.9-x86_64-netboot-compute
mkdir -p /install/post/otherpkgs/centos7.9/x86_64
wget http://build.openhpc.community/dist/1.3.9/OpenHPC-1.3.9.CentOS_7.x86_64.tar

yumdownloader --resolve ohpc-slurm-client lmod-ohpc ohpc-base munge-devel-ohpc munge-libs-ohpc munge-ohpc

createrepo .

chdef -t osimage centos7.9-x86_64-netboot-compute otherpkglist=/install/custom/netboot/centos7.9/x86_64/compute/otherpkgs.pkglist 

#Next, edit slurm.conf to include all our compute nodes!
# define ma1,ma2 at the bottom
# rename the controlmachine
# create a simple partition...
# Add to syncfiles
echo "/etc/slurm/slurm.conf -> /etc/slurm/slurm.conf" >> /install/custom/syncfiles/all.synclist
echo "/etc/munge/munge.key -> /etc/munge/munge.key" >> /install/custom/syncfiles/all.synclist


# Grab the slurm rpms for otherpkgs list; define that for compute images

#Then, modify compute image to include ohpc-slurm-client

mkdir -p /install/custom/netboot/centos7.9/x86_64/compute/

cat<<EOF >>/install/custom/netboot/centos7.9/x86_64/compute/otherpkgs.pkglist
ohpc-slurm-client
lmod-ohpc
ohpc-base
EOF

packimage centos7.9-x86_64-netboot-compute

