#
class secure_linux_cis::centos7::cis_4_1_18 {
  include secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable
}
