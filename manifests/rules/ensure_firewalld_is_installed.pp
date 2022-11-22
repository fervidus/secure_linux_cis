# @api private
#
# @summary Ensure firewalld is installed 
#
class secure_linux_cis::rules::ensure_firewalld_is_installed {
  class { 'firewalld':
    default_zone => $secure_linux_cis::default_firewalld_zone,
    # purge_direct_rules        => true,
    # purge_direct_chains       => true,
    # purge_direct_passthroughs => true,
  }
}
