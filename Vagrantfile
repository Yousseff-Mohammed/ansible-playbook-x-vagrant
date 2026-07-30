Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"

    config.vm.provider :libvirt do |libvirt|
        libvirt.memory = 3072
        libvirt.cpus = 2
    end

    config.vm.network "private_network",ip: "192.168.200.10"

    config.vm.hostname = "xcat-master"

    config.vm.provision "shell", path: "bootstrap.sh"
end