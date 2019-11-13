#
class secure_linux_cis::cis_aliyun1::cis_2_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_daytime_services_are_not_enabled
}
