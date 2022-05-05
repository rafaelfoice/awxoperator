Vagrant.configure("2") do |config|
  config.vm.box = "rafaelfoice/centosk3s"
  config.vm.box_version = "0.1.0"
  config.vm.hostname = "awxoperator"
  #config.vm.network "private_network", ip: "192.168.50.10"
  config.ssh.insert_key = false
  config.vm.boot_timeout = 1800 # 30 minutes
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6000"
    vb.cpus = 4
    vb.name = "awxoperator"
  end
  
  config.vm.provision :shell, privileged: false, path: "scripts/post_install.sh"
  config.vm.provision :shell, privileged: false, path: "scripts/awx_operator.sh"

end