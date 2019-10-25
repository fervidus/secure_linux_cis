# frozen_string_literal: true

# motd.rb
# Ensures MOTD is properly configured

Facter.add('motd') do
  confine osfamily: ['RedHat', 'Debian']
  setcode "egrep '(\\\\v|\\\\r|\\\\m|\\\\s)' /etc/motd"
end
