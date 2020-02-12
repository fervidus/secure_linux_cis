# @api private
#
class secure_linux_cis::distribution::rhel8::cis_6_1_14 {
  include secure_linux_cis::rules::audit_sgid_executables
}
