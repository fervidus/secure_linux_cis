# @api private
#
class secure_linux_cis::distribution::amazon2::cis_3_4_2 {
  include secure_linux_cis::rules::ensure_sctp_is_disabled
}
