Monitoring-tools
===========

This is set of different monitoring tools which help to monitor your environments

Installation
------------

In order to use this platform repository you must follow a few steps:

- clone [this very git repository](https://github.com/icekernel/monitoring-tools)
- Make sure you have updated the submodules: git submodule update --init --recursive
- install the following:
  - [packer.io](https://packer.io)
  - [vagrant](https://www.vagrantup.com/)
  - virtualbox: `sudo apt-get install virtualbox`
  - ansible: `sudo pip install ansible`
  - vagrant plugin: `vagrant plugin install vagrant-vbguest`


VMs
---

We use the [boxcutter](https://github.com/boxcutter) ubuntu vm to build our own
virtualbox images for use with vagrant. These virtual machines are located in
the `vagrant/` folder. The virtual machines are used for development and
testing purposes.

Features
--------

To build in the development rack (vagrant) use:

    make site@dev HOSTNAME=monitoring.icekernel.com DISK_SIZE=4000 RAM=1024
    
HOSTNAME, DISK_SIZE (In MB), RAM (in MB) you can change to any you want.

In result you should get these tools:

http://monitoring.icekernel.com/icinga 
  - Login `icingaadmin`, 
  - passwd `icingaadmin`,
http://monitoring.icekernel.com/influx,
http://monitoring.icekernel.com/grafana

