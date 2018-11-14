# 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)
#
#
# Description:
# The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides
# important information around configuration errors, unauthorized intrusions, and other potential errors.
#
# @summary 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_4
class secure_linux_cis::redhat7::cis_1_6_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'setroubleshoot':
      ensure => purged,
    }
  }
}
