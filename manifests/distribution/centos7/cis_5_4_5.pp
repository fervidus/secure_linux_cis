# @api private
#
class secure_linux_cis::distribution::centos7::cis_5_4_5 {
  include secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less
}
