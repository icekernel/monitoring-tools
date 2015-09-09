Example-Ops
===========

This is just an example of a multi-site wordpress installation on a shared host.

Installation
------------

In order to use this platform repository you must follow a few steps:

- clone [this very git repository](https://github.com/icekernel/example-ops/)
- install aws cli
- install the platform’s vault password in `~/.ansible/example-vault
  (`touch ~/.ansible/example-vault` will do for now)
- install whatever ssh keys you generate and connect to github or servers and
  `ssh-add` them, for dev rack handy to `ssh-add ./keys/vagrant`
- install the following:
  - [packer.io](https://packer.io)
  - [vagrant](https://www.vagrantup.com/)
  - virtualbox: `sudo apt-get install virtualbox`
  - ansible: `sudo pip install ansible` (yeah globally)


VMs
---

We use the [boxcutter](https://github.com/boxcutter) ubuntu vm to build our own
virtualbox images for use with vagrant. These virtual machines are located in
the `vagrant/` folder. The virtual machines are used for development and
testing purposes.

Be sure to add this to `/etc/hosts`

    10.0.1.2 www.dev.example.com
    10.0.1.2 www.dev.exemplo.com

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
