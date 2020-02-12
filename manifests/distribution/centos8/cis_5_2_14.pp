# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_14 {
  include secure_linux_cis::rules::ensure_SSH_LoginGraceTime_is_set_to_one_minute_or_less
}
