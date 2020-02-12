# @api private
#
class secure_linux_cis::distribution::debian8::cis_5_2_9 {
  include secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled
}
