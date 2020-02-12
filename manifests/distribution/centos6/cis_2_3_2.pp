# @api private
#
class secure_linux_cis::distribution::centos6::cis_2_3_2 {
  include secure_linux_cis::rules::ensure_rsh_client_is_not_installed
}
