# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_1_1 {
  include secure_linux_cis::rules::ensure_auditd_is_installed
}
