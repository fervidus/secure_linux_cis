# @api private
#
# @summary Ensure local interactive user home directories are mode 750 or more restrictive
#
class secure_linux_cis::rules::ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive {
  exec { "Ensure local interactive user home directories are mode 750 or more restrictive":
    command   => "/usr/share/cis_scripts/ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive.sh",
    logoutput => true,
  }
}
