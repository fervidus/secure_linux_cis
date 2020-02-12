# @api private
#
class secure_linux_cis::distribution::oracle6::cis_1_2_3 {
  include secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated
}
