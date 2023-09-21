Facter.add('crypto_policy_sshd') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: ['8', '9']

  setcode do
    code=false
    File.open('/etc/sysconfig/sshd').each do |i|
      if %r{^\s*CRYPTO_POLICY=.*$}i.match?(i) 
        code=true
      end
    end
    code
  end
end
