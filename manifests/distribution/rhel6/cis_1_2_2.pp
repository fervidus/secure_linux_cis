#
class secure_linux_cis::distribution::rhel6::cis_1_2_2 {
  include secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated
}
