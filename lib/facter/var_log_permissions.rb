# frozen_string_literal: true

# var_log_permissions.rb
# Custom fact that contains all files in /var/log that wrong permissions.

Facter.add('var_log_permissions') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/var_log_permissions.sh'
end
