# @api private
#
# @summary Ensure /etc/hosts.deny is configured 
#
class secure_linux_cis::rules::ensure_etc_hosts_deny_is_configured {
  $deny_content = join($secure_linux_cis::host_deny_rules, "\n")
  # This file manages both benchmarks 3_4_3 and 3_4_5
  file { '/etc/hosts.deny':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${deny_content}\n",
  }
}
