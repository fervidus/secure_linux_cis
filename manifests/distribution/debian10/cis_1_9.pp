# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_9 {
  include secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed
}
