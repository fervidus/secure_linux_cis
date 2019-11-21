# frozen_string_literal: true

# issue_os.rb

Facter.add('issue_os') do
  confine kernel: 'Linux'
  setcode 'egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue'
end
