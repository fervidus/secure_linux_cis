plan secure_linux_cis(
  TargetSpec $nodes,
  Array[Stdlib::Host]           $time_servers = ['time.google.com'],
  Enum['workstation', 'server'] $profile_type = 'server',
) {
  $nodes.apply_prep

  # Compile the manifest block into a catalog
  apply($nodes) {
    class { '::secure_linux_cis':
      time_servers => $time_servers,
      profile_type => $profile_type,
    }
  }
}
