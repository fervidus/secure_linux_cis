# @api private
#
# @summary Ensure default user umask is 027 or more restrictive
#
class secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive {
  exec { "Ensure default user umask is 027 or more restrictive":
    command   => "/usr/share/cis_scripts/ensure_default_user_umask_is_027_or_more_restrictive.sh",
    logoutput => true,
  }
}
