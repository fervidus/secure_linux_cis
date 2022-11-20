# @api private
#  Ensure updates, patches, and additional security software are installed (Scored)
#
# Description:
# Periodically patches are released for included software either due to security flaws or to include additional functionality.
#
# @summary  Ensure updates, patches, and additional security software are installed (Scored)
#
class secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed {
  cron::monthly { 'security-update':
    ensure      => present,
    environment => ['MAILTO=root', 'PATH="/usr/bin:/bin"',],
    command     => $secure_linux_cis::update_command,
  }
}
