plan secure_linux_cis(
  TargetSpec $nodes,
  Array[Stdlib::Host]           $time_servers,
  Enum['workstation', 'server'] $profile_type,
) {
  $nodes.apply_prep

  # Compile the manifest block into a catalog
  apply($nodes) {
    class { '::secure_linux_cis':
      time_servers => $time_servers,
      schedule     => 'harden_schedule',
      profile_type => $profile_type,
    }
  }
}
