#
class secure_linux_cis::rhel7::cis_3_5_2 {
  include secure_linux_cis::rules::ensure_sctp_is_disabled
}