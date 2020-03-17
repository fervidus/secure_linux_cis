# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_17 {
  include secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable
}
