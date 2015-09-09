# if local.mak exists, include it
ifneq ("$(wildcard local.mk)","")
include local.mk
endif

.PHONY: all

ANSIBLE=ansible-playbook
FLAGS=--ask-sudo-pass
DEBUG=-vvvv

DEV_CONNECT_FLAGS=--private-key=./keys/vagrant

ANSIBLE_VAGRANT_CONFIG=./ans_vagrant.cfg
DEV_ENV_SET=ANSIBLE_CONFIG=$(ANSIBLE_VAGRANT_CONFIG)

all: vagrant site@dev

basebox:
	cd vagrant/boxcutter/ubuntu && make virtualbox/ubuntu1404 && vagrant box add --name icekernel/trusty64 box/virtualbox/ubuntu1404-nocm-2.0.2.box

vagrant: basebox
	cd vagrant/dev/ && vagrant up

reload:
	cd vagrant/dev/ && vagrant reload

halt:
	cd vagrant/dev/ && vagrant halt

destroy:
	cd vagrant/dev/ && vagrant destroy

%@dev: vagrant
	$(DEV_ENV_SET) $(ANSIBLE) -i ./inventory/dev/ ./playbooks/$*.yml $(DEV_CONNECT_FLAGS) $(DEV_FLAGS) $(DEBUG)

%@local:
	$(ANSIBLE) -i ./inventory/local ./playbooks/$*.yml --ask-sudo-pass $(DEBUG)

%@live:
	$(ANSIBLE) -i ./inventory/live/ ./playbooks/$*.yml $(DEBUG)
