#
class secure_linux_cis::cis_ubuntu16::cis_3_5_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_dccp_is_disabled
}
