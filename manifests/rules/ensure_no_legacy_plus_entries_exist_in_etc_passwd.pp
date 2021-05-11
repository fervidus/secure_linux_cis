# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_no_legacy_plus_entries_exist_in_etc_passwd
class secure_linux_cis::rules::ensure_no_legacy_plus_entries_exist_in_etc_passwd {
  file_line { 'remove_legacy_plus_passwd':
    ensure            => absent,
    path              => '/etc/passwd',
    match             => '^\+:',
    match_for_absence => true,
  }
}
