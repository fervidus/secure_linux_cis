#
class secure_linux_cis::cis_oracle7::cis_6_1_13 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::audit_suid_executables
}
