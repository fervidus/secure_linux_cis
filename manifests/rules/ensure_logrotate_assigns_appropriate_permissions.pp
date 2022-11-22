# @api private
#
# @summary Ensure logrotate assigns appropriate permissions 
#
class secure_linux_cis::rules::ensure_logrotate_assigns_appropriate_permissions {
  # This setting is managed by the logrotate class. Just make sure the
  # 'create_mode' option is not set too open.
}
