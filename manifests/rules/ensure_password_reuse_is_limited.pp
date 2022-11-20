# @api private
#  Ensure password reuse is limited (Scored)
#
# Description:
# The /etc/security/opasswd file stores the users' old passwords and can be checked to ensure that users are not recycling recent passwords.
#
# Rationale:
# Forcing users not to reuse their past 5 passwords make it less likely that an attacker will be able to guess the password.
#
# Note that these change only apply to accounts configured on the local system.
#
# @summary  Ensure password reuse is limited (Scored)
#
class secure_linux_cis::rules::ensure_password_reuse_is_limited {
  if $secure_linux_cis::past_passwords < 5 {
    fail('CIS recommends setting old password limit to previous 5.')
  }
  case $facts['os']['family'] {
    'Debian': {
      pam { 'pam common-password pwhistory':
        ensure    => present,
        service   => 'common-password',
        type      => 'password',
        control   => 'required',
        module    => 'pam_pwhistory.so',
        arguments => ["remember=${secure_linux_cis::past_passwords}"],
        position  => 'before *[type="password" and module="pam_unix.so"]',
      }
      pam { 'pam_unix common-password':
        ensure           => present,
        service          => 'common-password',
        type             => 'password',
        module           => 'pam_unix.so',
        control          => '[success=1 default=ignore]',
        control_is_param => true,
        arguments        => [
          'obscure',
          'use_authtok',
          'try_first_pass',
          'sha512',
        ],
      }
    }
    default: {
      $services = [
        'system-auth',
        'password-auth',
      ]
      $services.each | $service | {
        pam { "pam ${service} required":
          ensure    => present,
          service   => $service,
          type      => 'password',
          control   => 'required',
          module    => 'pam_pwhistory.so',
          arguments => ['use_authtok', "remember=${secure_linux_cis::past_passwords}", 'retry=3'],
          position  => 'after *[type="password" and module="pam_pwquality.so" and control="requisite"]',
        }

        pam { "pam ${service} sufficient":
          ensure    => present,
          service   => $service,
          type      => 'password',
          control   => 'sufficient',
          module    => 'pam_unix.so',
          arguments => ['sha512', 'shadow', 'nullok', 'try_first_pass', 'use_authtok'],
          position  => 'after *[type="password" and module="pam_pwhistory.so" and control="required"]',
        }
      }
    }
  }
}
