#
class secure_linux_cis::cis_debian9::cis_6_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::audit_system_file_permissions
}
