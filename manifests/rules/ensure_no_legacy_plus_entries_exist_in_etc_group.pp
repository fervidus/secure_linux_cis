# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_no_legacy_plus_entries_exist_in_etc_group {
  file_line { 'remove_legacy_plus_group':
    ensure            => absent,
    path              => '/etc/group',
    match             => '^\+:',
    match_for_absence => true,
  }
}
