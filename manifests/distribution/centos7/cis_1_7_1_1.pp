# @api private
#
class secure_linux_cis::distribution::centos7::cis_1_7_1_1 {
  include secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly
}
