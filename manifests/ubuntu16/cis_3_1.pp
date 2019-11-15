#
class secure_linux_cis::ubuntu16::cis_3_1 (
  Boolean $enforced = true,
) {
  include secure_linux_cis::rules::network_parameters
}
