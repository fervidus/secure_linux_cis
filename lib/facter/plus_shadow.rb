# plus_shadow.rb
# Contains "+" entries in /etc/shadow

Facter.add('plus_shadow') do
  setcode "grep '^\\+:' /etc/shadow"
end
