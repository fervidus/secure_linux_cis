# 2.2.21 Ensure rsync service is not enabled (Scored)
#
# Description:
# The rsyncd service can be used to synchronize files between systems over network links.
#
# Rationale:
# The rsyncd service presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 2.2.21 Ensure rsync service is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_21
class secure_linux_cis::redhat7::cis_2_2_21 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'rsyncd':
      ensure => stopped,
      enable => false,
    }
  }
}
