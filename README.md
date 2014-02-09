Ruby Developer VM
=================

Virtualbox based virtual machine with Ubuntu 13.10 with a complete RubyOnRails/Ruby development environment.
The VM is localised for a german audience.

Login with user "vagrant" and password "vagrant".

The MySQL-Root user is "root". The password is "vagrant".


Building the basebox with packer
--------------------------------

You can build the base box with the provided packer template.
```bash
$ cd packer-template/ubuntu_1310/
$ packer build template.json 
```

Now we do have a prepared base box named `ubuntu1310.box`.  
To use the base box, we should add it to our vagrant box repository.
```bash
$ vagrant box add ubuntu1310_new ./ubuntu1310.box
```


Building the Ubuntu box with vagrant
------------------------------------

Afterwards use the Vagrantfile with the base box to install the rest of the VM.

```bash
$ cd vagrant/ubuntu_1310/
$ vagrant plugin install vagrant-berkshelf
$ bundle
$ berks
$ vagrant up
```

Tested with packer 0.5.1, vagrant 1.4.3, virtual box 4.3.6 on Mac OSX 10.9.1. Created an Ubuntu 13.10 box.