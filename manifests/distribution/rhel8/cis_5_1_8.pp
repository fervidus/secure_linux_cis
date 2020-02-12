# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_1_8 {
  include secure_linux_cis::rules::ensure_at_cron_is_restricted_to_authorized_users
}
