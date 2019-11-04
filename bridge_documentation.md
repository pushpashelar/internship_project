
## Create Bridge between Physical Machine and Virtual Machine:
  **This Documentation tested on Ubuntu 16.04 and ubuntu 16.04 server OS.**

 **for Physical Machine(P1) Configuration:**
  1. install bridge-utils package.
    ```bash
     sudo apt-get install bridge-utils 
    ```

 # 2. Physical Machine (P1) Interfaces:
 
    sudo echo " auto br0
         iface br0 inet static
         address 172.20.0.1
         netmask 255.255.255.0
         bridge_ports vport
         bridge_stp off
         bridge_maxwait 0
         bridge_fd 0  " >>/etc/network/interfaces

Note : br0 is a bridge instance and vport is a bridge_port

  3. edit /etc/qemu/bridge.conf file if didn't available then create it.
     
>     echo "allow br0" >>/etc/qemu/bridge.conf


#Virtual Machine Configuration :

 1. Start virtual machine(V1-1):
   qemu-system-x86_64 -hda userver3.img -m 1024 -enable-kvm

 2. install bridge-utils:
   sudo apt-get install bridge-utils

 3. after opening the Virtual Machine(V1-1) :

    echo "auto lo
    iface lo inet loopback
    # the primary network interfaces
    allow-hotplug ens3
    iface ens3 inet static
        address 172.20.0.10
        netmask 255.255.255.0 " >> /etc/network/interfaces


 4. after editing interfaces then poweroff Virtual Machine(V1-1).
 

#  On Host Machine(P1):
    ```bash
     sudo service network-manager restart
    ```

 **start Virtual Machine(V1-1) with bridge:**
```bash
 sudo qemu-system-x86_64 -hda userver.img -net nic -net bridge,br=br0  -m 1024 -enable-kvm
```
 **bridge has been created.**

##For Test  
  On Host Machine(P1):
```bash
 ifconfig
```
Output:

> br0       Link encap:Ethernet  HWaddr fe:62:79:78:b3:76 
>           inet addr:172.20.0.1  Bcast:172.20.0.255  Mask:255.255.255.0

```bash
ping 172.20.0.10
```
# On Virtual Machine(V1-1) :
```bash
 ifconfig
```
Output:

> ens3      Link encap:Ethernet  HWaddr 52:54:00:12:34:56 
>           inet addr:172.20.0.10  Bcast:172.20.0.255  Mask:255.255.255.0
  
```bash
 ping 172.20.0.1
```


