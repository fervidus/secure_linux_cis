#
class secure_linux_cis::rhel8::cis_5_4_1 {
  include secure_linux_cis::rules::ensure_password_creation_requirements_are_configured
}