Facter.add('crypto_policy_sshd') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: '8'

  setcode do
    File.open('/etc/sysconfig/sshd').each do |i|
      return true if %r{^\s*CRYPTO_POLICY=*$}i.match?(i)
    end
    false
  end
end
