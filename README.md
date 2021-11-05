# IntroToClusterSysadmin
Information for the Intro to Cluster System Administration for Non-Sysadmins class

# Outline

## First part:
* briefly cover first 3 layers of the OSI networking model
* ethernet/MAC addresses/IP
* DHCP
* DNS/host files

## Second part:
* PXE (tftp/kernel/initrd)
* Stateless vs. Stateful installations
..* https://xcat-docs.readthedocs.io/en/stable/
..* Stateful - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskful/index.html
..* Stateless - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskless/index.html
* Software repos/unattended installations
* ssh keys/parallel shell

## Third part
* Firewalls (iptables)
* User management (passwd/shadow/group files/LDAP)
* Shared file system (NFS/NTP)
* Resource manager (SLURM) 
..* https://slurm.schedmd.com/quickstart.html
..* OpenHPC Community: https://openhpc.community
..* Install Recipes: https://github.com/openhpc/ohpc/wiki/2.X

# Contents

This repo contains an example xCAT dump from a working cluster, and a copy
of the /install directory with relevant changes to config files. The 
/post/install/otherpkgs/x86_86centos7.9/ 
repository has been replicated via 'touch', so that a list of rpms is 
available but without the space useage.
The ntp_nfs.txt and slurm_install.txt documents describe detailed steps taken to
configure those services on the example cluster.
