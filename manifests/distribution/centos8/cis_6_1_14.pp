# @api private
#
class secure_linux_cis::distribution::centos8::cis_6_1_14 {
  include secure_linux_cis::rules::audit_SGID_executables
}
