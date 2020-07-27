# frozen_string_literal: true

# unowned_files.rb
# This custom fact contains all files that are not owned by users listed in the system

Facter.add('unowned_user_files') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/ensure_no_unowned.sh'
end
