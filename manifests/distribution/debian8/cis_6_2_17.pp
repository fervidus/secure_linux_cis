# @api private
#
class secure_linux_cis::distribution::debian8::cis_6_2_17 {
  include secure_linux_cis::rules::ensure_no_duplicate_gids_exist
}
