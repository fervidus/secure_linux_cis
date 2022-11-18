# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_rsyslog_is_not_configured_to_recieve_logs_from_a_remote_client
class secure_linux_cis::rules::ensure_rsyslog_is_not_configured_to_recieve_logs_from_a_remote_client {
  $facts['rsyslog_configuration_files'].each | String $path | {
    file { "Remove ModLoad on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*$ModLoad\s+imtcp',
    }

    file { "Remove InputTCPServerRun on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*$InputTCPServerRun',
    }

    file { "Remove module imtcp load on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*module(load="imtcp")',
    }

    file { "Remove input imtcp on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*input(\s+type="imtcp"\s+port="514"\s+)',
    }
  }
}
