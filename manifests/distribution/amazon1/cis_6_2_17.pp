# @api private
#
class secure_linux_cis::distribution::amazon1::cis_6_2_17 {
  include secure_linux_cis::rules::ensure_no_duplicate_gids_exist
}
