# This fact returns any AppArmor status that needs to be fixed (Debian9 cis 1.6.2.2)

Facter.add('apparmorcomplain') do
  confine osfamily: 'Debian'
  setcode 'apparmor_status | egrep "^(0 profiles are loaded.|[1-9][0-9]* processes are unconfined)"'
end
