# issue_net.rb

Facter.add('issue_net') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue.net'
end
