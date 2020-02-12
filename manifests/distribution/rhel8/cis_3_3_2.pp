# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_3_2 {
  include secure_linux_cis::rules::ensure_sctp_is_disabled
}
