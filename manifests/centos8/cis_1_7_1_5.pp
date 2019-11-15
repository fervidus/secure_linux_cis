#
class secure_linux_cis::centos8::cis_1_7_1_5 {
  include secure_linux_cis::rules::ensure_no_unconfined_services_exist
}
