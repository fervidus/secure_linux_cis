# 5.3.2 Ensure lockout for failed password attempts is configured (Scored)
#
# Description:
# Lock out users after n unsuccessful consecutive login attempts. The first sets of changes are made to the PAM configuration files. The
# second set of changes are applied to the program specific PAM configuration file. The second set of changes must be applied to each
# program that will lock out users. Check the documentation for each secondary program for instructions on how to configure them to work
# with PAM.
#
# Set the lockout number to the policy in effect at your site.
#
# Rationale:
# Locking out user IDs after n unsuccessful consecutive login attempts mitigates brute force password attacks against your systems.
#
# @summary 5.3.2 Ensure lockout for failed password attempts is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_3_2
class secure_linux_cis::redhat7::cis_5_3_2 (
  Boolean $enforced = true,
  Integer $attempts = 5,
  Integer $lockout_time = 900,
) {

  $services = [
    'system-auth',
    'password-auth'
  ]

  if $enforced {

    $services.each | $service | {

      pam { "pam_unix ${service}":
        ensure           => present,
        service          => $service,
        type             => 'auth',
        module           => 'pam_unix.so',
        control          => '[success=1 default=bad]',
        control_is_param => true,
        arguments        => [],
      }

      pam { "pam_faillock preauth ${service}":
        ensure           => present,
        service          => $service,
        type             => 'auth',
        module           => 'pam_faillock.so',
        control          => 'required',
        control_is_param => true,
        arguments        => [
                            'preauth',
                            'audit',
                            'silent',
                            "deny=${attempts}",
                            "unlock_time=${lockout_time}"
                            ],
        position         => 'before *[type="auth" and module="pam_unix.so"]',
      }

      pam { "pam_faillock authfail ${service}":
        ensure           => present,
        service          => $service,
        type             => 'auth',
        module           => 'pam_faillock.so',
        control          => '[default=die]',
        control_is_param => true,
        arguments        => [
                            'authfail',
                            'audit',
                            "deny=${attempts}",
                            "unlock_time=${lockout_time}"
                            ],
      position           => 'after *[type="auth" and module="pam_unix.so"]',
      }

      pam { "pam_faillock authsucc ${service}":
        ensure           => present,
        service          => $service,
        type             => 'auth',
        module           => 'pam_faillock.so',
        control          => 'sufficient',
        control_is_param => true,
        arguments        => [
                            'authsucc',
                            'audit',
                            "deny=${attempts}",
                            "unlock_time=${lockout_time}"
                            ],
        position         => 'after *[type="auth" and module="pam_faillock.so" and control="[default=die]"]',
      }
    }
  }
}
