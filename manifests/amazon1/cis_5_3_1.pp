#
class secure_linux_cis::cis_amazon1::cis_5_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_creation_requirements_are_configured
}
