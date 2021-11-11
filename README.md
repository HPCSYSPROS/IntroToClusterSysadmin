# IntroToClusterSysadmin
Information for the Intro to Cluster System Administration for Non-Sysadmins class

# Outline

## General Documentation
* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/part-basic_system_configuration
* https://xcat-docs.readthedocs.io/en/stable/guides/install-guides/yum/index.html

## First part
* Briefly cover first 3 layers of the OSI networking model
  * https://www.practicalnetworking.net/series/packet-traveling/key-players
  * https://www.practicalnetworking.net/series/packet-traveling/osi-model/
  * Physical layer: ethernet
  * Data Link Layer: MAC addresses
  * Network Layer: IP
    * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/ch-configure_host_names
    * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_ifcg_files
    * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_ip_commands
* xCAT management node install
  * https://xcat-docs.readthedocs.io/en/stable/guides/install-guides/yum/prepare_mgmt_node.html
  * https://xcat-docs.readthedocs.io/en/stable/guides/install-guides/yum/automatic_install.html
  * https://xcat-docs.readthedocs.io/en/stable/guides/get-started/quick_start.html
* DHCP
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/ch-dhcp_servers
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-dhcp-configuring-server
  * xCAT: makedhcp
* DNS
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-bind#sec-bind-namedconf
  * xCAT: makedns
* /etc/hosts files
  * xCAT: makehosts

## Second part:
* PXE (tftp/kernel/initrd)
  * admin:/tftpboot/pxelinux.cfg
  * admin:/tftpboot/xcat/osimage/{osimagename}
    * lsdef -t osimage
* Stateless vs. Stateful installations
  * copycds
  * https://xcat-docs.readthedocs.io/en/stable/
  * Stateful - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskful/index.html
    * Software repos/unattended installations (kickstart)
  * Stateless - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskless/index.html
    * genimage {osimagename}
    * packimage {osimagename}
* ssh keys/parallel shell
  * remoteshell postscript
  * xdsh
## Third part
* User management (passwd/shadow/group files/LDAP)
  * syncfiles postscript
* Shared file system (NFS/NTP)
  * postinstall scripts
* Firewalls (iptables)
* Resource manager (SLURM) 
  * https://slurm.schedmd.com/quickstart.html
  * OpenHPC Community: https://openhpc.community
  * Install Recipes: https://github.com/openhpc/ohpc/wiki/2.X
  * otherpkgs
## More Resources
* Linux Cluster Institute: http://www.linuxclustersinstitute.org/workshops/archive/ 

# Contents

This repo contains an example xCAT dump from a working cluster, and a copy
of the /install directory with relevant changes to config files. The 
/post/install/otherpkgs/x86_86centos7.9/ 
repository has been replicated via 'touch', so that a list of rpms is 
available but without the space useage.
The ntp_nfs.txt and slurm_install.txt documents describe detailed steps taken to
configure those services on the example cluster.
