# 5.3.1 Ensure password creation requirements are configured (Scored)
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
# @summary 5.3.1 Ensure password creation requirements are configured (Scored)
#
# @param enforced Should this rule be enforced
# @param minlen Minimum length
# @param dcredit D Credit
# @param ucredit U Credit
# @param ocredit O Credit
# @param lcredit L Credit
#
# @example
#   include secure_linux_cis::redhat7::cis_5_3_1
class secure_linux_cis::redhat7::cis_5_3_1 (
  Boolean $enforced = true,
  Integer $minlen = 14,
  Integer $dcredit = -1,
  Integer $ucredit = -1,
  Integer $ocredit = -1,
  Integer $lcredit = -1,
) {

  $services = [
    'system-auth',
    'password-auth',
  ]

  if $enforced {

    if $minlen == 0 and $dcredit == 0 and $ucredit == 0 and $ocredit == 0 and $lcredit == 0 {

      notify { 'blackpass':
        message  => 'Not in compliance with CIS 5.3.1 (Scored). At least one of the password requirements in /etc/security/pwquality.conf must be specified',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
    elsif $minlen == undef and $dcredit == undef and $ucredit == undef and $ocredit == undef and $lcredit == undef {

    fail('All of the minimum characters in pwquality.conf are undefined')      }
    else {

      # By default this is already installed on RedHat, but not on Debian
      # We just make certain it is installed on either OS, as this package
      # provides /etc/security/pwquality.conf
      $libpwquality = $facts['os']['family'] ? {
        'RedHat' => 'libpwquality',
        'Debian' => 'libpam-pwquality',
      }

      package { $libpwquality:
        ensure => installed,
      }
      -> File_line <| path == '/etc/security/pwquality.conf' |>

      file_line { 'pam minlen':
        ensure => 'present',
        path   => '/etc/security/pwquality.conf',
        line   => "minlen = ${minlen}",
        match  => '^#?minlen',
      }

      file_line { 'pam dcredit':
        ensure => 'present',
        path   => '/etc/security/pwquality.conf',
        line   => "dcredit = ${dcredit}",
        match  => '^#?dcredit',
      }

      file_line { 'pam ucredit':
        ensure => 'present',
        path   => '/etc/security/pwquality.conf',
        line   => "ucredit = ${ucredit}",
        match  => '^#?ucredit',
      }

      file_line { 'pam ocredit':
        ensure => 'present',
        path   => '/etc/security/pwquality.conf',
        line   => "ocredit = ${ocredit}",
        match  => '^#?ocredit',
      }

      file_line { 'pam lcredit':
        ensure => 'present',
        path   => '/etc/security/pwquality.conf',
        line   => "lcredit = ${lcredit}",
        match  => '^#?lcredit',
      }

      $services.each | $service | {
        pam { "pam ${service} requisite":
          ensure    => present,
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
