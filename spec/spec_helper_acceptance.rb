require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(source: proj_root, module_name: 'secure_linux_cis')
    hosts.each do |host|
      on host, puppet('module', 'install', 'camptocamp-kmod'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppet-alternatives'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'camptocamp-postfix'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_core'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_sysctl'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'kemra102-auditd'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_pam'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-ntp'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-firewall'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_shellvar'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppet-logrotate'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-cron_core'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-augeas_core'), acceptable_exit_codes: [0, 1]
    end
  end
end
