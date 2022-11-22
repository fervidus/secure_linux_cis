# @api private
#
# @summary Ensure updates, patches, and additional security software are installed 
#
class secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed {
  cron::monthly { 'security-update':
    ensure      => present,
    environment => ['MAILTO=root', 'PATH="/usr/bin:/bin"',],
    command     => $secure_linux_cis::update_command,
  }
}
