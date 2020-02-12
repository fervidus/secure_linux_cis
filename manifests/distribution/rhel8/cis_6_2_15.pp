# @api private
#
class secure_linux_cis::distribution::rhel8::cis_6_2_15 {
  include secure_linux_cis::rules::ensure_no_duplicate_uids_exist
}
