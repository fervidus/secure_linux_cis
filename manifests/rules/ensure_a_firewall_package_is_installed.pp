# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_a_firewall_package_is_installed
class secure_linux_cis::rules::ensure_a_firewall_package_is_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    unless ($facts['osfamily'] == 'RedHat' and $facts['operatingsystemmajrelease'] == '8') {
      firewall { '010 open ssh port':
        chain    => 'INPUT',
        schedule => 'harden_schedule',
        dport    => 22,
        state    => 'NEW',
        action   => 'accept',
        proto    => 'tcp',
        tag      => 'cis_firewall_pre',
      }

      Firewallchain <| tag == 'cis_firewall_pre' |>
      -> Firewall <| tag == 'cis_firewall_pre' |>
      -> Firewall <| tag == 'cis_firewall_rule' |>
      -> Firewall <| tag == 'cis_firewall_post' |>
      -> Firewallchain <| tag== 'cis_firewall_post' |>
    }
    else {
      class { '::firewalld':
        default_zone              => 'drop',
        schedule                  => 'harden_schedule',
        purge_direct_rules        => true,
        purge_direct_chains       => true,
        purge_direct_passthroughs => true,
      }
    }
  }
}
