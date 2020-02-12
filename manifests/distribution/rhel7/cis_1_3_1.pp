# @api private
#
class secure_linux_cis::distribution::rhel7::cis_1_3_1 {
  include secure_linux_cis::rules::ensure_aide_is_installed
}
