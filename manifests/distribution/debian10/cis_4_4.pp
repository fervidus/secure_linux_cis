# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_4 {
  include secure_linux_cis::rules::ensure_logrotate_assigns_appropriate_permissions
}
