# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nosuid_option_set_on_run_shm_partition
class secure_linux_cis::rules::ensure_nosuid_option_set_on_run_shm_partition {
  $mount = '/run/shm'
  $option = 'nosuid'

  secure_linux_cis::mount_options { "${mount}-${option}":
    mount => $mount,
    opt   => $option,
  }
}
