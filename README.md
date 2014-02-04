Ruby Developer VM
=================

Virtualbox based virtual machine with Ubuntu 13.10 with a complete RubyOnRails/Ruby development environment.
The VM is localised for a german audience.

Login with user "vagrant" and password "vagrant".

The MySQL-Root user is "root". The password is "vagrant".

You can build the base box with the provided packer template.
Afterwards use the Vagrantfile with the base box to install the rest of the VM.

`$ vagrant plugin install vagrant-berkshelf`

`$ bundle`

`$ vagrant up`

Tested with virtual box 4.3.6 and Ubuntu 13.10.
