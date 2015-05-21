# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/eval-win7x86-enterprise"
  config.vm.communicator = :winrm
  config.vm.synced_folder ".", "/vagrant", type: "winrm"
end
