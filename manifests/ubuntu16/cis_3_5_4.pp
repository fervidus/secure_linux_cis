#
class secure_linux_cis::cis_ubuntu16::cis_3_5_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_tipc_is_disabled
}
