# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_squashfs_kernel_module_is_not_available
class secure_linux_cis::rules::ensure_squashfs_kernel_module_is_not_available {
  kmod::install { 'squashfs': command => '/bin/false' }
  kmod::blacklist { 'squashfs': }
}
