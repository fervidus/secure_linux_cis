# 2.2.12 Ensure Samba is not enabled (Scored)
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
# @summary 2.2.12 Ensure Samba is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_12
class secure_linux_cis::redhat7::cis_2_2_12 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'smb':
      ensure => stopped,
      enable => false,
    }
  }
}
