# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_4 {
  include secure_linux_cis::rules::ensure_suspicious_packets_are_logged
}
