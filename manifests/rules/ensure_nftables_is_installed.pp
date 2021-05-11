# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nftables_is_installed
class secure_linux_cis::rules::ensure_nftables_is_installed {
  class { 'nftables':
    firewalld_enable => false,
  }

  # Ensure puppet agent can talk to PE
  nftables::rule { 'default_out-peagent':
    content => 'tcp dport 8140 accept',
  }
}
