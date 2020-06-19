# @api private
#  Ensure permissions on all logfiles are configured (Scored)
#
# Description:
# Log files stored in /var/log/ contain logged information from many services on the system, or on log hosts others as well.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive data is archived and protected.
#
# @summary  Ensure permissions on all logfiles are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_all_logfiles_are_configured
class secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    # Recursively set permissions on files & directories within /var/log/ - leaving /var/log itself alone.
    # Use of file resource is blocked by https://tickets.puppetlabs.com/browse/PUP-1444
    # Note: puppetlabs directory is excluded because Puppet manages it's own log permissions
    exec { 'set permissions on /var/log subdirectories':
      command  => 'find /var/log -mindepth 1 -type d -not \( -path /var/log/puppetlabs -prune \) -exec chmod g-w,o-rwx "{}" \;',
      path     => ['/usr/bin', '/usr/sbin',],
      schedule => 'harden_schedule',
    } ->
    exec { 'set permissions on /var/log files':
      command  => 'find /var/log -type f -not \( -path /var/log/puppetlabs/\* -prune \) -exec chmod g-wx,o-rwx "{}" \;',
      path     => ['/usr/bin', '/usr/sbin',],
      schedule => 'harden_schedule',
    }
  }
}
