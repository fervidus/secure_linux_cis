# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_7 {
  include secure_linux_cis::rules::ensure_Samba_is_not_enabled
}
