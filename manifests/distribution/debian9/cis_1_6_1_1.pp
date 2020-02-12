# @api private
#
class secure_linux_cis::distribution::debian9::cis_1_6_1_1 {
  include secure_linux_cis::rules::ensure_selinux_is_enabled_in_the_bootloader_configuration
}
