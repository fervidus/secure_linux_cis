# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_8 {
  include secure_linux_cis::rules::ensure_session_initiation_information_is_collected
}
