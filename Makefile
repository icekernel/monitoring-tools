# if local.mak exists, include it
ifneq ("$(wildcard local.mk)","")
include local.mk
endif

.PHONY: all

export VM_HOSTNAME=${HOSTNAME}
export DISK_SIZE=${DISK_SIZE}
export RAM=${RAM}
ANSIBLE=ansible-playbook
FLAGS=--ask-sudo-pass
DEBUG=-vvvv

DEV_CONNECT_FLAGS=--private-key=~/.vagrant.d/insecure_private_key

ANSIBLE_VAGRANT_CONFIG=./ans_vagrant.cfg
DEV_ENV_SET=ANSIBLE_CONFIG=$(ANSIBLE_VAGRANT_CONFIG)

all: vagrant site@dev

key_access:
#	chmod 600 ./keys/vagrant*

hostname: key_access
#	echo "" > ./inventory/dev/hosts && echo  "10.0.1.2 ${VM_HOSTNAME}" >> /etc/hosts && echo "[monitoring_servers]" >> ./inventory/dev/hosts && echo "${VM_HOSTNAME}" >> ./inventory/dev/hosts && echo "[dev:children]" >> ./inventory/dev/hosts && echo "monitoring_servers" >> ./inventory/dev/hosts && echo "[example:children]" >> ./inventory/dev/hosts && echo "dev" >> ./inventory/dev/hosts

basebox: hostname
#	cd vagrant/boxcutter/ubuntu && make virtualbox/ubuntu1404 && vagrant box add icekernel/trusty64 box/virtualbox/ubuntu1404-nocm-2.0.2.box
#	cd vagrant/boxcutter/ubuntu && vagrant box add icekernel/trusty64 box/virtualbox/ubuntu1404-nocm-2.0.2.box

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
