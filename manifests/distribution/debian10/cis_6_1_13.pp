# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_1_13 {
  include secure_linux_cis::rules::audit_suid_executables
}
