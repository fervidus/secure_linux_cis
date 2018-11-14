# plus_passwd.rb
# Contains "+" entries in etc/passwd

Facter.add('plus_passwd') do
  setcode "grep '^\\+:' /etc/passwd"
end
