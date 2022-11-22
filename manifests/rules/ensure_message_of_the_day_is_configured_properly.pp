# @api private
#
# @summary Ensure message of the day is configured properly 
#
class secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly {
  if $facts['motd'] {
    notify { 'motd':
      message  => 'Not in compliance with CIS  (Scored). There is OS and/or patch level information in /etc/motd',
      loglevel => 'warning',
    }
  }
}
