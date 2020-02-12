# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_7 {
  include secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted
}
