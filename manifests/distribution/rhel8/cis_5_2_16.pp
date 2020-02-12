# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_2_16 {
  include secure_linux_cis::rules::ensure_ssh_pam_is_enabled
}
