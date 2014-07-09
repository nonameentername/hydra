# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-14.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.define "master" do |master|
    master.vm.network :private_network, ip: "192.168.10.100"
  end

  config.vm.define "slave1" do |slave1|
    slave1.vm.network :private_network, ip: "192.168.10.101"
  end

  config.vm.define "slave2" do |slave2|
    slave2.vm.network :private_network, ip: "192.168.10.102"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
end
