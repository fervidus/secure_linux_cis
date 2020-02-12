# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_2_4 {
  include secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated
}
