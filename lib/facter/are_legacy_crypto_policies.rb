#

LEGACY_CRYPTO_POLICIES = '/etc/crypto-policies/config'.freeze # Should always be the same

Facter.add('are_legacy_crypto_policies') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: '8'

  setcode do
    File.open(LEGACY_CRYPTO_POLICIES).each do |i|
      return true if i =~ %r{^\s*LEGACY\s*(\s+#.*)?$}i # Skip localhost
    end

    false
  end
end
