#
class secure_linux_cis::ubuntu18::cis_5_2_13 {
  include secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less
}
