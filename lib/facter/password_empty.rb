# frozen_string_literal: true

# password_empty.rb

Facter.add('password_empty') do
  confine kernel: 'Linux'
  setcode "cat /etc/shadow | awk -F: \'($2 == \"\" ) { print $1 \" does not have a password \"}\'"
end
