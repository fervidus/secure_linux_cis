#
class secure_linux_cis::debian8::cis_5_2_13 {
  include secure_linux_cis::rules::ensure_only_strong_ciphers_are_used
}
