# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_2_12 {
  include secure_linux_cis::rules::ensure_samba_is_not_enabled
}
