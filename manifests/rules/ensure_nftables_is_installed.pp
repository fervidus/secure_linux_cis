# @api private
#
# @summary Ensure nftables is installed 
#
class secure_linux_cis::rules::ensure_nftables_is_installed {
  class { 'nftables':
    firewalld_enable => false,
  }

  # Ensure puppet agent can talk to PE
  nftables::rule { 'default_out-peagent':
    content => 'tcp dport 8140 accept',
  }
}
