Facter.add('is_crypto_policy_future') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: '8'

  setcode do
    File.open('/etc/crypto-policies/config').each do |i|
      return true if i =~ %r{^\s*(FUTURE|FIPS)\s*(\s+#.*)?$}i # Skip localhost
    end

    false
  end
end
