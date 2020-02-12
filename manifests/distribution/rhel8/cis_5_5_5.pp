# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_5_5 {
  include secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive
}
