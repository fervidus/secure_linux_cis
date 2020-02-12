# @api private
#
class secure_linux_cis::distribution::rhel6::cis_5_4_4 {
  include secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive
}
