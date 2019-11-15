#
class secure_linux_cis::centos8::cis_1_2_2 {
  include secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated
}
