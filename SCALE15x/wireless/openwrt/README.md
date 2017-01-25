# Openwrt
## Build environment
Currently we are working against `Chaos Calmer 15.05.1`. There instructions came
from: https://wiki.openwrt.org/doc/howto/obtain.firmware.generate

Install the necessary build tools against `Ubuntu 16.04`:
```bash
apt-get install subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc wget
```

As a normal user get the branch for `ar71xx` arch:
```bash
cd ~
mkdir openwrt && cd openwrt
wget https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64.tar.bz2
tar -xvjf OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64.tar.bz2
cp -R ~/SCALE_network_public/SCALE15x/wireless/openwrt/files ~/openwrt/
```

Sensitive credentials need to be added outside of git. First add ssh keys:
```bash
vim ~/openwrt/files/etc/dropbear/authorized_keys
```

Now add a root hash in place of `<ADD HASH HERE>`. `SHA512` work fine:
```bash
cat << EOF > ~/openwrt/files/etc/shadow
root:<ADD HASH HERE>:0:0:99999:7:::
daemon:*:0:0:99999:7:::
ftp:*:0:0:99999:7:::
network:*:0:0:99999:7:::
nobody:*:0:0:99999:7:::
EOF
```

Build the images against the profile which matches the hardware:
```bash
cd ~/openwrt/OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64
make image PROFILE=WNDR3700 FILES="../files/"
cd ~/OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64/bin/ar71xx/ # Images are written here
```

The differences between images are:
* The `factory.img` is for the bootloader flasher or stock software flasher
* The `sysupgrade.bin` is for flashing from within openwrt itself

### Sysupgrade
Doing the upgrade it straight forward. Make sure you put the `.img` in `/tmp`
due to it being a ramdisk:
```bash
scp openwrt-15.05.1-ar71xx-generic-wndr3700v2-squashfs-sysupgrade.bin root@<openwrt_ip>:/tmp
ssh root@<openwrt_ip>
sysupgrade /tmp/<version>.bin
```
After a reboot the firmware should be operational.

## Clean
Removes all temp build files and generated images:
```bash
make clean
```
