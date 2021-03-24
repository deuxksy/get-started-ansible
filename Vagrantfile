# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version = "2"

Vagrant.configure(Vagrant_API_Version) do |config|

  #ansible-node01
  config.vm.define:"ansible-node01" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node01"
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
    cfg.vm.host_name="ansible-node01"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.2.221"
    cfg.vm.network "forwarded_port", guest: 22, host: 19221, auto_correct: false, id: "ssh"
  end

  #ansible-node02
  config.vm.define:"ansible-node02" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node02"
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
    cfg.vm.host_name="ansible-node02"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.2.222"
    cfg.vm.network "forwarded_port", guest: 22, host: 19222, auto_correct: false, id: "ssh"
  end

  #ansible-server
  config.vm.define:"ansible-server" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Server"
    end
    cfg.vm.host_name="ansible-server"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.2.220"
    cfg.vm.network "forwarded_port", guest: 22, host: 19220, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "bootstrap.sh" #path 파일 전송 및 실행
    cfg.vm.provision "file", source: "Ansible_env_ready.yml", destination: "Ansible_env_ready.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_env_ready.yml" #inline 실행만
    cfg.vm.provision "shell", path: "add_ssh_auth.sh", privileged: false #privileged: false root 권한이 아닌 vagrant 권한으로 실행 하기위해서 
  end

end