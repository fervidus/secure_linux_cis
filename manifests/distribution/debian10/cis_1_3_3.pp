# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_3_3 {
  include secure_linux_cis::rules::ensure_sudo_log_file_exists
}
