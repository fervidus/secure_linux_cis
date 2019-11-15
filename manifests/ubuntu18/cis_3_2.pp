#
class secure_linux_cis::ubuntu18::cis_3_2 (
  Boolean $enforced = true,
) {
  include secure_linux_cis::rules::network_parameters
}
