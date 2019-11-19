# This fact returns true if root has a password

Facter.add('rootpw') do
  confine osfamily: 'Debian'
  setcode 'grep ^root:[*\!]: /etc/shadow'
end
