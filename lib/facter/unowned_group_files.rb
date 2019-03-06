# frozen_string_literal: true

# unowned_group_files.#!/usr/bin/env ruby -wKU
# This custom fact contains all files that are not owned by groups listed in the system

Facter.add('unowned_group_files') do
  setcode "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup"
end
