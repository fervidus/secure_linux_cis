# @api private
#
# @summary Ensure default user shell timeout is 900 seconds or less
#
class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less {
  exec { "Ensure default user shell timeout is 900 seconds or less":
    command   => "/usr/share/cis_scripts/ensure_default_user_shell_timeout_is_900_seconds_or_less.sh",
    logoutput => true,
  }
}
