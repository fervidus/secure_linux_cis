#
class secure_linux_cis::distribution::amazon2::cis_1_6_1_6 {
  include secure_linux_cis::rules::ensure_no_unconfined_daemons_exist
}
