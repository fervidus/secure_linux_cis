#
class secure_linux_cis::cis_ubuntu18::cis_4_1_18 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable
}
