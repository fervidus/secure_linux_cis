#
class secure_linux_cis::cis_ubuntu18::cis_1_6_1_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed
}
