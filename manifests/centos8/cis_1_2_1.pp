#
class secure_linux_cis::centos8::cis_1_2_1 {
  include secure_linux_cis::rules::ensure_GPG_keys_are_configured
}
