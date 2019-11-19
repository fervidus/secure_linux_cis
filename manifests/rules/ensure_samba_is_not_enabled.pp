# 2 Ensure Samba is not enabled (Scored)
#
# Description:
# The Samba daemon allows system administrators to configure their Linux systems to share
# file systems and directories with Windows desktops. Samba will advertise the file systems
# and directories via the Small Message Block (SMB) protocol.
# Windows desktop users will be able to mount these directories and file systems as letter drives on their systems.
#
# Rationale:
# If there is no need to mount directories and file systems to Windows systems,
# then this service can be disabled to reduce the potential attack surface.
#
# @summary 2 Ensure Samba is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_samba_is_not_enabled

class secure_linux_cis::rules::ensure_samba_is_not_enabled {

  case $facts['os']['family'] {
    'RedHat': {
      $service = 'smb'
    }
    'Debian': {
      $service = 'smbd'
    }
    default: {
      notify { "This Samba server check is not yet implemented for ${facts['os']['family']}": }
      $service = 'TODO Samba'
    }
  }

  service { $service:
    ensure => stopped,
    enable => false,
  }

}
