#
class secure_linux_cis::debian9::cis_1_2_2 {
  include secure_linux_cis::rules::ensure_gpg_keys_are_configured
}
