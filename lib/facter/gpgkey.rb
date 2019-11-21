# frozen_string_literal: true

# gpgkey.rb

Facter.add('gpgkey') do
  confine osfamily:  'RedHat'
  setcode "rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\\n'"
end
