# frozen_string_literal: true

# issue_net.rb

Facter.add('issue_net') do
  confine osfamily: ['RedHat', 'Debian']
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue.net'
end
