# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_19 {
  include secure_linux_cis::rules::ensure_SSH_MaxSessions_is_set_to_4_or_less
}
