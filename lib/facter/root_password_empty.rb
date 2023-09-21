# frozen_string_literal: true

# root_password_empty.rb

Facter.add('root_password_empty') do
  confine kernel: 'Linux'
  setcode "egrep '^root:' /etc/shadow | awk -F: \'($2 == \"\" ) { print $1 \" does not have a password \"}\'"
end
