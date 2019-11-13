#
class secure_linux_cis::cis_centos8::cis_3_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_suspicious_packets_are_logged
}
