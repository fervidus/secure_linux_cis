# @api private
#
class secure_linux_cis::distribution::debian9::cis_5_2_17 {
  include secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less
}
