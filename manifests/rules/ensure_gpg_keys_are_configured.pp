# @api private
#  Ensure GPG keys are configured (Not Scored)
#
#
# Description:
# The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/*
# files determines if an RPM package's signature is checked prior to its installation.
#
# @summary  Ensure GPG keys are configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_gpg_keys_are_configured
class secure_linux_cis::rules::ensure_gpg_keys_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    exec { 'gpgkey':
      command  => "rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\\n' > /root/gpgkeys.txt",
      schedule => 'harden_schedule',
      creates  => '/root/gpgkeys.txt',
      path     => '/bin/',
    }
  }
}
