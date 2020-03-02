# @api private
# 1 Ensure rsync service is not enabled (Scored)
#
# Description:
# The rsyncd service can be used to synchronize files between systems over network links.
#
# Rationale:
# The rsyncd service presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 1 Ensure rsync service is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_rsync_service_is_not_enabled
class secure_linux_cis::rules::ensure_rsync_service_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { ['rsyncd', 'rsync']:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
