# This fact returns true if root has a password

require 'shadow'

Facter.add('rootpw') do
  confine osfamily: 'Debian'
  setcode do
    rootpw = Shadow::Passwd.getspnam('root').sp_pwdp
    true unless rootpw =~ %r{[*\!]}
  end
end
