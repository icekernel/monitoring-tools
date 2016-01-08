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

To build things you use `make` you choose a playbook to run (eg. `bootstrap`)
and execute it against a **rack** by prepending the playbook with `@rack`.

To build in the development rack (vagrant) use:

    make site@dev

To build in live rack use:

    make site@live

###Pro-tip!

To define a rack you need to create an inventory in the `./inventory/`
directory. Use one of the existing ones as an example, then add to the
`Makefile` a line that will point to that inventory. Which should let you
target things like this:

    make site@us-central
    make shutdown@global

Of course, you'll have to implement these...

If you encounter difficulties please post them to the [issue tracker](http://github.com/icekernel/example-ops/issues/). Note
that this is only tested on Linux and not support for Mac or Windows will be
provided.
