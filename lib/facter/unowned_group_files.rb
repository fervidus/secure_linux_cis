# frozen_string_literal: true

# unowned_group_files.#!/usr/bin/env ruby -wKU
# This custom fact contains all files that are not owned by groups listed in the system

Facter.add('unowned_group_files') do
  confine kernel: 'Linux'
  setcode '/usr/share/cis_scripts/ensure_no_ungrouped.sh'
end
