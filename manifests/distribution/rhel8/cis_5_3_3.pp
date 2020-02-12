# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_3_3 {
  include secure_linux_cis::rules::ensure_authselect_includes_with_faillock
}
