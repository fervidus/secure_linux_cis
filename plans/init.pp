plan secure_linux_cis(
  TargetSpec $nodes,
) {
  $nodes.apply_prep

  # Compile the manifest block into a catalog
  apply($nodes) {
    include ::secure_linux_cis

    # notify { $facts['os']: }
  }
}
