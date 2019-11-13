#
class secure_linux_cis::cis_centos6::cis_5_4_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive
}
