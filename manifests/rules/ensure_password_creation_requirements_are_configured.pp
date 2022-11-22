# @api private
#
# @summary Ensure password creation requirements are configured 
#
class secure_linux_cis::rules::ensure_password_creation_requirements_are_configured {
  $services = $facts['os']['family'] ? {
    'RedHat' => [
      'system-auth',
      'password-auth',
    ],
    'Suse'   => ['common-password'],
    'Debian' => ['common-password'],
  }
  if $secure_linux_cis::minlen == 0 and $secure_linux_cis::dcredit == 0 and $secure_linux_cis::ucredit == 0 and
  $secure_linux_cis::ocredit == 0 and $secure_linux_cis::lcredit == 0 {
    notify { 'blackpass':
      message  => 'Not in compliance with CIS  (Scored). At least one of the password requirements in /etc/security/pwquality.conf must be specified',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
  elsif $secure_linux_cis::minlen == undef and $secure_linux_cis::dcredit == undef and $secure_linux_cis::ucredit == undef and
  $secure_linux_cis::ocredit == undef and $secure_linux_cis::lcredit == undef {
  fail('All of the minimum characters in pwquality.conf are undefined') }
  else {
    # By default this is already installed on RedHat, but not on Debian
    # We just make certain it is installed on either OS, as this package
    # provides /etc/security/pwquality.conf
    $libpwquality = $facts['os']['family'] ? {
      'Suse'   => 'libpwquality',
      'RedHat' => 'libpwquality',
      'Debian' => 'libpam-pwquality',
    }
    package { $libpwquality:
      ensure   => installed,
    }
    -> File_line <| path == '/etc/security/pwquality.conf' |>
    file_line { 'pam minlen':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "minlen = ${secure_linux_cis::minlen}",
      match  => '^#?minlen',
    }
    file_line { 'pam dcredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "dcredit = ${secure_linux_cis::dcredit}",
      match  => '^#?dcredit',
    }
    file_line { 'pam ucredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "ucredit = ${secure_linux_cis::ucredit}",
      match  => '^#?ucredit',
    }
    file_line { 'pam ocredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "ocredit = ${secure_linux_cis::ocredit}",
      match  => '^#?ocredit',
    }
    file_line { 'pam lcredit':
      ensure => 'present',
      path   => '/etc/security/pwquality.conf',
      line   => "lcredit = ${secure_linux_cis::lcredit}",
      match  => '^#?lcredit',
    }
    $services.each | $service | {
      pam { "pam ${service} requisite":
        ensure    => present,
        service   => $service,
        type      => 'password',
        control   => 'requisite',
        module    => 'pam_pwquality.so',
        arguments => ['try_first_pass', 'retry=3'],
      }
    }
  }
}
