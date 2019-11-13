#
class secure_linux_cis::cis_oracle7::cis_5_3_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512
}
