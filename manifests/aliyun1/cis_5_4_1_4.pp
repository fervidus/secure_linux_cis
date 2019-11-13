#
class secure_linux_cis::cis_aliyun1::cis_5_4_1_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_inactive_password_lock_is_30_days_or_less
}
