# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_5_3 {
  include secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less
}
