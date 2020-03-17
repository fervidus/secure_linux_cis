# @api private
#  Ensure logrotate is configured (Not Scored)
#
# Description:
# Log files contain logged information from many services on the system, or on log hosts
# others as well.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive
# data is archived and protected.
#
# @summary  Ensure logrotate assigns appropriate permissions
#
# @example
#   include secure_linux_cis::ensure_logrotate_assigns_appropriate_permissions
class secure_linux_cis::rules::ensure_logrotate_assigns_appropriate_permissions{
    # This setting is managed by the logrotate class. Just make sure the
    # 'create_mode' option is not set too open.
}
