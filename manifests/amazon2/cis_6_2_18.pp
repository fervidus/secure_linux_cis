#
class secure_linux_cis::cis_amazon2::cis_6_2_18 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_duplicate_user_names_exist
}
