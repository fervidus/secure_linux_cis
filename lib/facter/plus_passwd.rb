# frozen_string_literal: true

# plus_passwd.rb
# Contains "+" entries in etc/passwd

Facter.add('plus_passwd') do
  confine kernel: 'Linux'
  setcode "grep '^\\+:' /etc/passwd"
end
