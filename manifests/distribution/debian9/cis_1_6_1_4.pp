#
class secure_linux_cis::distribution::debian9::cis_1_6_1_4 {
  include secure_linux_cis::rules::ensure_no_unconfined_daemons_exist
}
