# @api private
#
class secure_linux_cis::distribution::centos8::cis_4_1_7 {
  include secure_linux_cis::rules::ensure_events_that_modify_the_system_s_Mandatory_Access_Controls_are_collected
}
