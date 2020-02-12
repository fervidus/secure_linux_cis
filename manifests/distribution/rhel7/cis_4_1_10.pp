# @api private
#
class secure_linux_cis::distribution::rhel7::cis_4_1_10 {
  include secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected
}
