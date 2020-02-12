# @api private
#
class secure_linux_cis::distribution::rhel7::cis_5_2_7 {
  include secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled
}
