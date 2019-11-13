#
class secure_linux_cis::cis_debian8::cis_6_1_14 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::audit_sgid_executables
}
