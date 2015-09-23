# -*- mode: ruby; -*-

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

$num_instances = 1
$instance_name_prefix = "q"
$vm_gui = false # alternative: "gui"
$vm_memory = 1024
$vm_cpus = 1

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # NFS sharing performs significantly better
  config.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"
  config.vm.synced_folder "../", "/qntfy", :nfs => true

  # Global VM config
  config.vm.provider :virtualbox do |vb, override|
    vb.gui = $vm_gui
    vb.memory = $vm_memory
    vb.cpus = $vm_cpus
 
    # Disable audio
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]

    # Network adapters are virtual: https://www.virtualbox.org/manual/ch06.html
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
  end

  # Instance specific VM config
  (1..$num_instances).each do |i|
    config.vm.define vm_name = "%s-%02d" % [$instance_name_prefix, i] do |config|
      # Set hostname to boombox-N
      config.vm.hostname = vm_name

      # Static IPs counting up from 33.33.33.10
      ip = "33.33.33.#{i+10}"
      config.vm.network :private_network, ip: ip

      # Remove the next 4 lines for a "stdin: is not a tty" error
      config.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
      end

      # Put our .profile in place
      config.vm.provision :shell, :inline => "echo -e \"\n### Vagrant \n. /vagrant/env/dot-profile\" >> /home/vagrant/.profile"

      # Update and upgrade the machine to latest packages
      config.vm.provision :shell, :inline => "/vagrant/installers/provision.sh"
    end
  end
      
end
