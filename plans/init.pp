plan secure_linux_cis(
  TargetSpec $targets,
  Array[Stdlib::Host]           $time_servers = ['time.google.com'],
  Enum['workstation', 'server'] $profile_type = 'server',
) {
  apply_prep($targets)

  $apply_result = apply($targets) {
    class { 'secure_linux_cis':
      time_servers => $time_servers,
      profile_type => $profile_type,
    }
  }

  out::message($apply_result.first.value)
}
