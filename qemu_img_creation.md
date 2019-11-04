for creating server image for qemu used following steps.
  first check qemu is installed or not. if not install it.
   apt-get install qemu

1. first create image file using this command.

  qemu-img create u.img 5G

2. after above step run this command and compplete installation process.
   
  qemu-system-x86_64 -hda userver.img -cdrom ubuntu-16.04.3-server-amd64.iso -m 1024 -enable-kvm

3. follows installation steps and complete the installation.

4.image are ready to run.
  for run:
 
 qemu-system-x86_64 -hda userver.img -m 1024 -enable-kvm




