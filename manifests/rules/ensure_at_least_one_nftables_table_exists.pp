# @api private
#
# @summary Ensure at least one nftables table exists
#
class secure_linux_cis::rules::ensure_at_least_one_nftables_table_exists {
  exec { "Ensure at least one nftables table exists":
    command   => "/usr/share/cis_scripts/ensure_at_least_one_nftables_table_exists.sh",
    logoutput => true,
  }
}
