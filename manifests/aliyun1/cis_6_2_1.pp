#
class secure_linux_cis::cis_aliyun1::cis_6_2_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_fields_are_not_empty
}
