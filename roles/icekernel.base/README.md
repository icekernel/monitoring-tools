icekernel.base
==============

This is the base bootstrap role for icekernel boxes.

Features
--------

- install custom roles facts in facts.d

Requirements
------------

This role should forever have no requirements.

Dependencies
------------

Role only works on Debian Family

Example Playbook
-------------------------

    - hosts: servers
      roles:
         - { role: icekernel.base }

License
-------

Apache 2.0

Author Information
------------------

Conrado Buhrer [icekernel.com](http://icekernel.com)
