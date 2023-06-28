# @api private
#
# @summary Ensure rsyslog is not configured to recieve logs from a remote client 
#
class secure_linux_cis::rules::ensure_rsyslog_is_not_configured_to_recieve_logs_from_a_remote_client {
  $facts['rsyslog_configuration_files'].each | String $path | {
    file_line { "Remove ModLoad on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*$ModLoad\s+imtcp',
      match_for_absence => true,
    }

    file_line { "Remove InputTCPServerRun on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*$InputTCPServerRun',
      match_for_absence => true,
    }

    file_line { "Remove module imtcp load on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*module(load="imtcp")',
      match_for_absence => true,
    }

    file_line { "Remove input imtcp on ${path}":
      ensure => absent,
      path   => $path,
      match  => '^\s*input(\s+type="imtcp"\s+port="514"\s+)',
      match_for_absence => true,
    }
  }
}
