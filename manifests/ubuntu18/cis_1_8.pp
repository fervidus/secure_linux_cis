#
class secure_linux_cis::ubuntu18::cis_1_8 {
  include secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed
}