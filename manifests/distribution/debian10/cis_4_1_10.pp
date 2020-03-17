# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_10 {
  include secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected
}
