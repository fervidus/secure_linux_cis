# 4.2.2.2 Ensure logging is configured (Not Scored)
#
# Description:
# The /etc/syslog-ng/syslog-ng.conf file specifies rules for logging and which files are to
# be used to log certain classes of messages.
#
# Rationale:
# A great deal of important security-related information is sent via syslog-ng (e.g., successful
# and failed su attempts, failed login attempts, root login attempts, etc.).
#
# @summary 4.2.2.2 Ensure logging is configured (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_2
class secure_linux_cis::redhat7::cis_4_2_2_2 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'syslog-ng' {

    # Default CIS configuration for syslog-ng. Disable this class to enforce your own site configuration
    $syslog_ng_conf_lines = [
      'log { source(src); source(chroots); filter(f_console); destination(console); };',
      'log { source(src); source(chroots); filter(f_console); destination(xconsole); };',
      'log { source(src); source(chroots); filter(f_newscrit); destination(newscrit); };',
      'log { source(src); source(chroots); filter(f_newserr); destination(newserr); };',
      'log { source(src); source(chroots); filter(f_newsnotice); destination(newsnotice); };',
      'log { source(src); source(chroots); filter(f_mailinfo); destination(mailinfo); };',
      'log { source(src); source(chroots); filter(f_mailwarn); destination(mailwarn); };',
      'log { source(src); source(chroots); filter(f_mailerr); destination(mailerr); };',
      'log { source(src); source(chroots); filter(f_mail); destination(mail); };',
      'log { source(src); source(chroots); filter(f_acpid); destination(acpid); flags(final); };',
      'log { source(src); source(chroots); filter(f_acpid_full); destination(devnull); flags(final); };',
      'log { source(src); source(chroots); filter(f_acpid_old); destination(acpid); flags(final); };',
      'log { source(src); source(chroots); filter(f_netmgm); destination(netmgm); flags(final); };',
      'log { source(src); source(chroots); filter(f_local); destination(localmessages); };',
      'log { source(src); source(chroots); filter(f_messages); destination(messages); };',
      'log { source(src); source(chroots); filter(f_iptables); destination(firewall); };',
      'log { source(src); source(chroots); filter(f_warn); destination(warn); };',
    ]

    $syslog_ng_conf_lines.each | $config | {
      file_line { "syslog-ng.conf ${config}":
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => $config,
        notify => Exec['reload syslog-ng 4_2_2_2'],
      }
    }

    exec { 'reload syslog-ng 4_2_2_2':
      command     => '/bin/pkill -HUP syslog-ng',
      refreshonly => true,
    }
  }
}
