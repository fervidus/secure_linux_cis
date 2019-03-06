# frozen_string_literal: true

# Yum_repolist.rb

Facter.add('yum_repolist') do
  setcode 'yum repolist'
end
