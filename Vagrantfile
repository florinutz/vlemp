Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "192.168.77.77"

  config.vm.synced_folder "project", "/vagrant", type: "nfs", id: "project"

  config.vm.provision :shell do |shell|
    shell.inline = "
        ( puppet module list | grep puppetlabs-mysql ) || ( mkdir -p /etc/puppet/modules; puppet module install puppetlabs/mysql );
        ( puppet module list | grep willdurand-composer ) || ( puppet module install willdurand/composer );
        ( puppet module list | grep willdurand-nodejs ) || ( puppet module install willdurand/nodejs )
    "
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.hostname = "project.pro"
  config.hostsupdater.aliases = ["www.project.pro"]

end