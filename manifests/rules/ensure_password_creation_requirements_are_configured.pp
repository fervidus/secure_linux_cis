# @api private
#  Ensure password creation requirements are configured (Scored)
#
# Description:
# The pam_pwquality.so module checks the strength of passwords. It performs checks such as making sure a password is not a dictionary word,
# it is a certain length, contains a mix of characters (e.g. alphabet, numeric, other) and more. The following are definitions of the
# pam_pwquality .so options.
#
#   try_first_pass - retrieve the password from a previous stacked PAM module. If not available, then prompt the user for a password.
#   retry=3 - Allow 3 tries before sending back a failure.
#
# The following options are set in the /etc/security/pwquality.conf file:
#   minlen = 14 - password must be 14 characters or more
#   dcredit = -1 - provide at least one digit
#   ucredit = -1 - provide at least one uppercase character
#   ocredit = -1 - provide at least one special character
#   lcredit = -1 - provide at least one lowercase character
#
# The settings shown above are one possible policy. Alter these values to conform to your own organization's password policies.
#
# Rationale:
# Strong passwords protect systems from being hacked through brute force methods.
#
# @summary  Ensure password creation requirements are configured (Scored)
#
# @param enforced Should this rule be enforced
# @param minlen Minimum length
# @param dcredit D Credit
# @param ucredit U Credit
# @param ocredit O Credit
# @param lcredit L Credit
#
# @example
#   include secure_linux_cis::ensure_password_creation_requirements_are_configured
class secure_linux_cis::rules::ensure_password_creation_requirements_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    $services = $facts['osfamily'] ? {
      'RedHat' => [
        'system-auth',
        'password-auth',
      ],
      'Suse'   => ['common-password'],
      'Debian' => ['common-password'],
    }
    if $::secure_linux_cis::minlen == 0 and $::secure_linux_cis::dcredit == 0 and $::secure_linux_cis::ucredit == 0 and
        $::secure_linux_cis::ocredit == 0 and $::secure_linux_cis::lcredit == 0 {
      notify { 'blackpass':
        message  => 'Not in compliance with CIS  (Scored). At least one of the password requirements in /etc/security/pwquality.conf must be specified',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
    elsif $::secure_linux_cis::minlen == undef and $::secure_linux_cis::dcredit == undef and $::secure_linux_cis::ucredit == undef and
          $::secure_linux_cis::ocredit == undef and $::secure_linux_cis::lcredit == undef {
    fail('All of the minimum characters in pwquality.conf are undefined')      }
    else {
      # By default this is already installed on RedHat, but not on Debian
      # We just make certain it is installed on either OS, as this package
      # provides /etc/security/pwquality.conf
      $libpwquality = $facts['osfamily'] ? {
        'Suse'   => 'libpwquality',
        'RedHat' => 'libpwquality',
        'Debian' => 'libpam-pwquality',
      }
      package { $libpwquality:
        ensure   => installed,
        schedule => 'harden_schedule',
      }
      -> File_line <| path == '/etc/security/pwquality.conf' |>
      file_line { 'pam minlen':
        ensure   => 'present',
        schedule => 'harden_schedule',
        path     => '/etc/security/pwquality.conf',
        line     => "minlen = ${::secure_linux_cis::minlen}",
        match    => '^#?minlen',
      }
      file_line { 'pam dcredit':
        ensure   => 'present',
        schedule => 'harden_schedule',
        path     => '/etc/security/pwquality.conf',
        line     => "dcredit = ${::secure_linux_cis::dcredit}",
        match    => '^#?dcredit',
      }
      file_line { 'pam ucredit':
        ensure   => 'present',
        schedule => 'harden_schedule',
        path     => '/etc/security/pwquality.conf',
        line     => "ucredit = ${::secure_linux_cis::ucredit}",
        match    => '^#?ucredit',
      }
      file_line { 'pam ocredit':
        ensure   => 'present',
        schedule => 'harden_schedule',
        path     => '/etc/security/pwquality.conf',
        line     => "ocredit = ${::secure_linux_cis::ocredit}",
        match    => '^#?ocredit',
      }
      file_line { 'pam lcredit':
        ensure   => 'present',
        schedule => 'harden_schedule',
        path     => '/etc/security/pwquality.conf',
        line     => "lcredit = ${::secure_linux_cis::lcredit}",
        match    => '^#?lcredit',
      }
      $services.each | $service | {
        pam { "pam ${service} requisite":
          ensure    => present,
          schedule  => 'harden_schedule',
          service   => $service,
          type      => 'password',
          control   => 'requisite',
          module    => 'pam_pwquality.so',
          arguments => ['try_first_pass', 'retry=3']
        }
      }
    }
  }
}
