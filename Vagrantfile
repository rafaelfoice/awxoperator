Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false  
  end

  config.vm.box = "centos/7"
  config.vm.box_version = "2004.01"
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.hostname = "awxoperator"
  config.vm.network "private_network", ip: "192.168.50.10"
  config.ssh.insert_key = false
  config.vm.boot_timeout = 1800 # 30 minutes

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6000"
    vb.cpus = 2
    vb.name = "awxoperator"
  end

  config.vm.provision "shell", inline: "sudo yum -y update"
  config.vm.provision :shell, path: "scripts/install_k3s.sh"
  config.vm.provision :shell, path: "scripts/install_docker.sh"
  config.vm.provision :shell, path: "scripts/install_extras.sh"
  config.vm.provision :shell, path: "scripts/start_services.sh"
  config.vm.provision :shell, privileged: false, path: "scripts/awx_operator.sh"
  config.vm.provision :shell, path: "scripts/clean_up.sh"
end