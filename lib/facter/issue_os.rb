# issue_os.rb

Facter.add('issue_os') do
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue'
end
