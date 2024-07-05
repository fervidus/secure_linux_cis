plan secure_linux_cis::audit_ensure_kernel_modules_are_not_available2 (
  Integer[1, 2] $profile_level = 1,
  Enum['server', 'workstation'] $profile = 'server',
) {
  $linux_list = puppetdb_query('inventory[certname] { facts.kernel = "Linux" }')

  $linux_servers = $linux_list.map | $server | {
    $server['certname']
  }

  $targets = get_targets($linux_servers)

  # # List of kernels
  $cramfs_result_set = run_task(
    'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
    $targets,
    'mod_name' => 'cramfs',
    'mod_path' => 'fs'
  )

  $freevxfs_result_set = run_task(
    'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
    $targets,
    'mod_name' => 'freevxfs',
    'mod_path' => 'fs'
  )

  $hfs_result_set = run_task(
    'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
    $targets,
    'mod_name' => 'hfs',
    'mod_path' => 'fs'
  )

  $hfsplus_result_set = run_task(
    'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
    $targets,
    'mod_name' => 'hfsplus',
    'mod_path' => 'fs'
  )

  $jffs2_result_set = run_task(
    'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
    $targets,
    'mod_name' => 'jffs2',
    'mod_path' => 'fs'
  )

  if($profile_level == 2) {
    $squashfs_result_set = run_task(
      'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
      $targets,
      'mod_name' => 'squashfs',
      'mod_path' => 'fs'
    )

    $udf_result_set = run_task(
      'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
      $targets,
      'mod_name' => 'udf',
      'mod_path' => 'fs'
    )
  }
  else {
    $squashfs_result_set = undef
    $udf_result_set = undef
  }

  if($profile == 'server' or ($profile == 'workstation' and $profile_level == 2)) {
    $usbstorage_result_set = run_task(
      'secure_linux_cis::audit_ensure_kernel_module_is_not_available',
      $targets,
      'mod_name' => 'usbstorage',
      'mod_path' => 'device'
    )
  }
  else {
    $usbstorage_result_set = undef
  }

  $all_result_sets = [$cramfs_result_set, $freevxfs_result_set, $squashfs_result_set, $udf_result_set, $usbstorage_result_set, $jffs2_result_set, $hfs_result_set, $hfsplus_result_set, $usbstorage_result_set]

  $all_results_sets_flatten = $all_result_sets.flatten.filter | $value | {
    $value != undef
  }[0]

  $all_results = $all_results_sets_flatten.flatten.map | $next_result_set | {
    $next_result_set.results()
  }[0]

  $results_filtered = $all_results.flatten.filter | $next_result | {
    $next_result.message() !~ /.+PASS.+/
  }

  $results_messages = $results_filtered.map | $next_result | {
    $message = $next_result.message()
    $target = $next_result.target()

    "${target} -- ${message}"
  }

  return $results_messages
}
