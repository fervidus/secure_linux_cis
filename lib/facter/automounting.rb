# automounting.rb
# Ensures automounting is enabled

Facter.add('automounting') do
  setcode 'systemctl is-enabled autofs'
end
