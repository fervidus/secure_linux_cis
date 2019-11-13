#
class secure_linux_cis::cis_ubuntu18::cis_4_2_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_logging_is_configured
}
