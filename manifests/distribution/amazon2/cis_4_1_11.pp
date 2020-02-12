# @api private
#
class secure_linux_cis::distribution::amazon2::cis_4_1_11 {
  include secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected
}
