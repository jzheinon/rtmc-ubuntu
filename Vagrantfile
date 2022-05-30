Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/impish64"

#  config.vm.network "private_network", ip: "192.168.33.109"
  config.vm.hostname = "rtmc-ubuntu.local"

  # Manage host
  if !Vagrant.has_plugin?('vagrant-vbguest')
    puts '[WARNING] vagrant-vbguest  is not installed. Installation is recommended for easy management of guest additions for e.g. shared folders between guest and host environments.  Please run `vagrant plugin install vagrant-vbguest`' 
  end
  if !Vagrant.has_plugin?('vagrant-reload')
    puts '[WARNING] vagrant-reload is not installed. It is needed for provisioning. Please run `vagrant plugin install vagrant-reload`'
  end

  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     vb.gui = true
     vb.name = 'rtmc-ubuntu'
  
  # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ['modifyvm', :id, '--vram', '128']
    vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
    vb.customize ["storageattach", :id, 
                  "--storagectl", "IDE", 
                  "--port", "0", "--device", "1", 
                  "--type", "dvddrive", 
                  "--medium", "emptydrive"]  
  end

  config.vm.provision "shell",
    path: "scripts/bootstrap.sh"
  config.vm.provision :reload
  config.vm.provision "shell",
    path: "scripts/rstudio.sh"

  config.vm.post_up_message = "Your R Studio environment is ready."
end
