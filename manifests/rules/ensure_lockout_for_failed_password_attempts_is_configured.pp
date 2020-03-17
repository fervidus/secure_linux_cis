# @api private
#  Ensure lockout for failed password attempts is configured (Scored)
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
# @summary  Ensure lockout for failed password attempts is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param attempts Number of attempts
# @param lockout_time Amount of time for lockout
#
# @example
#   include secure_linux_cis::ensure_lockout_for_failed_password_attempts_is_configured
class secure_linux_cis::rules::ensure_lockout_for_failed_password_attempts_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    $os = "${facts['os']['name']}${facts['os']['release']['major']}"
    case $facts['osfamily'] {
      'Debian': {
        pam { 'pam_tally2 common-auth':
          ensure    => present,
          schedule  => 'harden_schedule',
          service   => 'common-auth',
          type      => 'auth',
          module    => 'pam_tally2.so',
          control   => 'required',
          arguments => [
            'onerr=fail',
            'audit',
            'silent',
            "deny=${::secure_linux_cis::attempts}",
            "unlock_time=${::secure_linux_cis::lockout_time}",
          ],
          position  => 'before *[type="auth" and module="pam_unix.so"]',
        }
        if $os == 'Debian10' {
          pam { 'pam_tally2 common-account':
            ensure   => present,
            schedule => 'harden_schedule',
            service  => 'common-account',
            type     => 'account',
            module   => 'pam_tally2.so',
            control  => 'required',
            position => 'after *[type="account" and module="pam_deny"]',
          }
        }
      }
      default: {
        $services = [
          'system-auth',
          'password-auth',
        ]
        $services.each | $service | {
          pam { "pam_unix ${service}":
            ensure           => present,
            schedule         => 'harden_schedule',
            service          => $service,
            type             => 'auth',
            module           => 'pam_unix.so',
            control          => '[success=1 default=bad]',
            control_is_param => true,
            arguments        => [],
          }
          pam { "pam_faillock preauth ${service}":
            ensure           => present,
            schedule         => 'harden_schedule',
            service          => $service,
            type             => 'auth',
            module           => 'pam_faillock.so',
            control          => 'required',
            control_is_param => true,
            arguments        => [
              'preauth',
              'audit',
              'silent',
              "deny=${::secure_linux_cis::attempts}",
              "unlock_time=${::secure_linux_cis::lockout_time}",
            ],
            position         => 'before *[type="auth" and module="pam_unix.so"]',
          }
          pam { "pam_faillock authfail ${service}":
            ensure           => present,
            schedule         => 'harden_schedule',
            service          => $service,
            type             => 'auth',
            module           => 'pam_faillock.so',
            control          => '[default=die]',
            control_is_param => true,
            arguments        => [
              'authfail',
              'audit',
              "deny=${::secure_linux_cis::attempts}",
              "unlock_time=${::secure_linux_cis::lockout_time}",
            ],
            position         => 'after *[type="auth" and module="pam_unix.so"]',
          }
          pam { "pam_faillock authsucc ${service}":
            ensure           => present,
            schedule         => 'harden_schedule',
            service          => $service,
            type             => 'auth',
            module           => 'pam_faillock.so',
            control          => 'sufficient',
            control_is_param => true,
            arguments        => [
              'authsucc',
              'audit',
              "deny=${::secure_linux_cis::attempts}",
              "unlock_time=${::secure_linux_cis::lockout_time}",
            ],
            position         => 'after *[type="auth" and module="pam_faillock.so" and control="[default=die]"]',
          }
        }
      }
    }
  }
}
