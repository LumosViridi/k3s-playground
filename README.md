# k3s-playground

## Hardware 
I run a four node K3s cluster running on Raspberry Pi 4b hardware. 

Each Pi has a 64Gb Flash drive and a high performance 32Gb SD card. 

Pod storage is on my Synology NAS which is backed up frequently to AWS S3 Glacier

✨ Fun Fact: I named my nodes after droids from Star Wars! They are R2-D2, C-3PO, BB-8 and IG-11.


## Configuration
### Setting up the Pis for K3s out of the box

Before the Pis are ready to install k3s, a few things need to be completed:

Create New Image on MicroSD card using Raspberry Pi Imager 
- Choose Raspberry Pi OS Lite (32bit)

Once Imaging is completed, put the drive into the PI and boot to ensure that the drive is working

Power off the Pi and put the drive back into laptop to do some configurations.

Navigate to boot drive on your machine and select the file **cmdline.txt**

Add the following to the end of the file:

    cgroup_memory=1 cgroup_enable=memory

And you can add this if you want to set a static ip address:

    ip=<open IP on network>::<default gateway>:<subnet mask>

Next, open the file **config.txt** and add the following to the end of the file:

    arm_64bit=1

Finally add a file called **ssh** to /Volumes/boot 

eject the drive from your laptop and move back to the raspberry pi

### Basic Configuration and Prerequisites

install vim to edit files nicely

    sudo apt-get install vim -y

rename hostname locally

    hostname ##newhostname##

rename hostname on reboot

    vim /etc/hostname

rename the hostname without requiring reboot

    vim /etc/hosts

Run raspi-config and update all local settings to US (timezone, wireless config, character format and keyboard layout.)

Check hostname is correct.

### Installing k3s

update everything 

fetches package updates

    sudo apt update

installs package updates

    sudo apt upgrade

install K3s for the Master Node 

    curl -sfL https://get.k3s.io | sh -

To install k3s on the worker node we first need the token from Master

     sudo cat /var/lib/rancher/k3s/server/token

Install K3S on the worker node

    curl -sfL https://get.k3s.io | K3S_NODE_NAME="node01" K3S_URL="https://10.66.x.x:6443" K3S_TOKEN="token from above step" sh -



## Services and Apps

#### Networking 
- MetalLB

#### Storage Configuration
- NFS CSI Driver
- SMB CSI Driver
- Longhorn 

#### Database
- mySQL

#### Monitoring and Dashboards
- kubernetes dashboard
- UpTime Kuma

#### Apps and Games
- Jellyfin
- Minecraft 

#### Coming Soon!
- Vault
- LongHorn
