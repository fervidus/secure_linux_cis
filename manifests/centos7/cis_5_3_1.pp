#
class secure_linux_cis::centos7::cis_5_3_1 {
  include secure_linux_cis::rules::ensure_password_creation_requirements_are_configured
}