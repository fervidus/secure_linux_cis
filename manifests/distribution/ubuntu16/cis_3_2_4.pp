# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_3_2_4 {
  include secure_linux_cis::rules::ensure_suspicious_packets_are_logged
}
