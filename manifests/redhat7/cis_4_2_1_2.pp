# 4.2.1.2 Ensure logging is configured (Not Scored)
#
# Description:
# The /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files specifies rules for logging and
# which files are to be used to log certain classes of messages.
#
# Rationale:
# A great deal of important security-related information is sent via rsyslog (e.g., successful
# and failed su attempts, failed login attempts, root login attempts, etc.).
#
# @summary 4.2.1.2 Ensure logging is configured (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_2
class secure_linux_cis::redhat7::cis_4_2_1_2 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'rsyslog' {

    $configs = {
      '*.emerg'                 => ':omusrmsg:*',
      'mail.*'                  => '-/var/log/mail',
      'mail.info'               => '-/var/log/mail.info',
      'mail.warning'            => '-/var/log/mail.warn',
      'mail.err'                => '/var/log/mail.err',
      'news.crit'               => '-/var/log/news/news.crit',
      'news.err'                => '-/var/log/news/news.err',
      'news.notice'             => '-/var/log/news/news.notice',
      '*.=warning;*.=err'       => '-/var/log/warn',
      '*.crit'                  => '/var/log/warn',
      '*.*;mail.none;news.none' => '-/var/log/messages',
      'local0,local1.*'         => '-/var/log/localmessages',
      'local2,local3.*'         => '-/var/log/localmessages',
      'local4,local5.*'         => '-/var/log/localmessages',
      'local6,local7.*'         => '-/var/log/localmessages',
    }

    $configs.each | $config, $dest | {
      file { "/etc/rsyslog.d/${config}":
        ensure  => file,
        content => "${config} ${dest}",
        notify  => Exec['reload rsyslog'],
      }
    }

    exec { 'reload rsyslog':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }
  }
}
