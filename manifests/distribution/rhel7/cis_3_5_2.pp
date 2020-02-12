# @api private
#
class secure_linux_cis::distribution::rhel7::cis_3_5_2 {
  include secure_linux_cis::rules::ensure_sctp_is_disabled
}
