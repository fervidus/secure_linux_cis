Facter.add('are_legacy_crypto_policies') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: ['8', '9']

  setcode do
    File.open('/etc/crypto-policies/config').each do |i|
      return true if %r{^\s*LEGACY\s*(\s+#.*)?$}i.match?(i) # Skip localhost
    end

    false
  end
end
