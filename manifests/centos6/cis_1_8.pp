#
class secure_linux_cis::cis_centos6::cis_1_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed
}
