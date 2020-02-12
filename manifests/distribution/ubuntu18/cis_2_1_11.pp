# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_2_1_11 {
  include secure_linux_cis::rules::ensure_openbsd_inetd_is_not_installed
}
