# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/stretch64"
  config.vm.network "forwarded_port", guest: 80, host: 8800
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
