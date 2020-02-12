# @api private
#
class secure_linux_cis::distribution::debian9::cis_2_1_2 {
  include secure_linux_cis::rules::ensure_openbsd_inetd_is_not_installed
}
