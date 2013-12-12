# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntuRaring64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "~/Workspace/Apps", "/Apps", :owner=> 'vagrant', :group=>'www-data', :extra => 'dmode=775,fmode=775'
  config.vm.provision :shell, :inline => "echo \"Europe/Paris\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # avoid "stdin: is not a tty" mesg. See http://goo.gl/Zjs8VT
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

 # Use VBoxManage to change memory:
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "init.pp"
  end
end
