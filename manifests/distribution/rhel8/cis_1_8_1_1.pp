# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_8_1_1 {
  include secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly
}
