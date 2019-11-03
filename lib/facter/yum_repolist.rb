# frozen_string_literal: true

# Yum_repolist.rb

Facter.add('yum_repolist') do
  confine osfamily: 'RedHat'
  setcode 'yum repolist -d0 | grep -ve "repo id" | awk "{print \$1}" | sed s/^!//g'
end
