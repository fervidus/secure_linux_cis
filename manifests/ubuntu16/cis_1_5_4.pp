#
class secure_linux_cis::cis_ubuntu16::cis_1_5_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_prelink_is_disabled
}
