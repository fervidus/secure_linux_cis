# @api private
#
# @summary Ensure /etc/hosts.allow is configured 
#
class secure_linux_cis::rules::ensure_etc_hosts_allow_is_configured {
  $allow_content = join($secure_linux_cis::host_allow_rules, "\n")
  # This file manages both benchmarks 3_4_2 and 3_4_4
  file { '/etc/hosts.allow':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${allow_content}\n",
  }
}
