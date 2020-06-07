Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.boot_timeout = 600
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
    ansible.compatibility_mode = "auto"
    ansible.extra_vars = {
      user: "vagrant"
    }
  end
end
