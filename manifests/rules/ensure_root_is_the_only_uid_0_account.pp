# @api private
#
# @summary Ensure root is the only UID 0 account
#
class secure_linux_cis::rules::ensure_root_is_the_only_uid_0_account {
  exec { "Ensure root is the only UID 0 account":
    command   => "/usr/bin/sed -i '/^[^:]\+:x:0:/{/^root:/!d}' /etc/passwd",
    logoutput => true,
  }
}
