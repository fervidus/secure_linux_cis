# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_11 {
  include secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected
}
