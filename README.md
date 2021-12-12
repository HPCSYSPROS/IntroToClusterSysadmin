# IntroToClusterSysadmin
Information for the Intro to Cluster System Administration for Non-Sysadmins class

# Outline

## General Documentation
* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/part-basic_system_configuration
* https://xcat-docs.readthedocs.io/en/stable/guides/install-guides/yum/index.html

## First part - Network services
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
  * lsdef -t site {site name}
* Network setup
  * lsdef -t network
  * lsdef -t network {network name}
* DHCP
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/ch-dhcp_servers
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-dhcp-configuring-server
  * xCAT: makedhcp
  * /etc/dhcp/dhcpd.conf
  * /var/lib/dhcpd/dhcpd.leases
* DNS
  * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-bind#sec-bind-namedconf
  * xCAT: makedns
  * /var/named
* Hosts files
  * xCAT: makehosts
  * /etc/hosts
* Node definitions
  * lsdef
  * lsdef {node name} 
  * lsdef -t group {group name}
* Create node
  * nodeadd {node name} groups=vm,login,all

## Second part - Images
* PXE (tftp/kernel/initrd)
  * admin:/tftpboot/pxelinux.cfg
  * admin:/tftpboot/xcat/osimage/{osimagename}
    * lsdef -t osimage
    * lsdef -t osimage {osimage name}
* Stateless vs. Stateful installations
  * copycds
  * https://xcat-docs.readthedocs.io/en/stable/
  * Stateful - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskful/index.html
    * Software repos/unattended installations (kickstart)
    * /install/custom/ks/centos/login.centos7.tmpl
      * /install/custom/ks/centos/post.local
    * /install/custom/ks/centos/login.centos7.pkglist
  * Stateless - https://xcat-docs.readthedocs.io/en/stable/guides/admin-guides/manage_clusters/ppc64le/diskless/index.html
    * genimage {osimage name}
      * /install/netboot/centos7.9/x86_64/compute/compute.pkglist
    * Base image 
      * /install/netboot/centos7.9/x86_64/compute/rootimg
    * packimage {osimage name}
  * otherpkgs (non-OS packages)

## Third part - Node management
* ssh keys/parallel shell
  * /install/postscripts/remoteshell
  * xdsh
* User management (passwd/shadow/group files)
  * /install/postscripts/syncfiles
  * updatenode {node} -F
* Shared file system (NFS/NTP)
  * Postinstall scripts
    * /install/custom/install/centos7.9/x86_64/centos7.postinstall
* Resource manager (SLURM) 
  * https://slurm.schedmd.com/quickstart.html
  * OpenHPC Community: https://openhpc.community
  * Install Recipes: https://github.com/openhpc/ohpc/wiki/2.X
* Firewalls (iptables) best practices
  * Lockdown ssh on the login node
  * Lockdown SLURM on the resource manager node
  * Leave nodes on a private subnet
  
## More Resources
* Linux Cluster Institute: http://www.linuxclustersinstitute.org/workshops/archive/ 

# Contents

* This repo contains an example xCAT dump from a working cluster, and a copy of the /install directory with relevant changes to config files. 
* To use the xCAT config: <pre>restorexCATdb -p xCAT-dump-example</pre>
* To use the install directory: <pre>cp -rf install-example to /install</pre>
* The /install/post/install/otherpkgs/x86_86/centos7.9/ needs to be created with the <pre>copycds {CentOS 7.9 Everthing DVD.iso}</pre>
* The /install/netboot/centos7.9/x86_64/compute/ files need to be created using:<pre>
genimage centos7.9-x86_64-netboot-compute
packimage centos7.9-x86_64-netboot-compute</pre>
* The root password in the password table needs to be changed. 
  * Generate a root password hash: <pre>openssl passwd -1</pre>
  * Set root password: <pre>chtab key=system passwd.username=root passwd.password={Hash from openssl command}</pre>
* The ntp_nfs.txt and slurm_install.txt documents describe detailed steps taken to configure those services on the example cluster
* You need to create the VM machines using the info found in the xCAT vm table. See xCAT-dump-example/vm.csv
