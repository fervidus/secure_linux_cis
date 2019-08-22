# 1.2.3 Ensure GPG keys are configured (Not Scored)
#
#
# Description:
# The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/*
# files determines if an RPM package's signature is checked prior to its installation.
#
# @summary 1.2.3 Ensure GPG keys are configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_2_3
class secure_linux_cis::redhat7::cis_1_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    exec { 'gpgkey':
      command => "rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\\n' > /root/gpgkeys.txt",
      creates => '/root/gpgkeys.txt',
      path    => '/bin/',
    }

    # Idempotency says don't do this
    #notify { 'gpg_keys':
    #  message     => '[1.2.3] (Not Scored) Your GPG key configuration is stored in /root/gpgkeys.txt, please review and ensure all keysare in a desired state', #lint:ignore:140chars
    #}

  }
}
