# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_13 {
  include secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected
}
