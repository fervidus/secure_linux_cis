# frozen_string_literal: true

# file_permission.rb
# Custom fact that contains specific installed files and the permissions they have

Facter.add('file_permission') do
  confine osfamily: 'RedHat'
  setcode 'rpm -Va --nomtime --nosize --nomd5 --nolinkto'
end
