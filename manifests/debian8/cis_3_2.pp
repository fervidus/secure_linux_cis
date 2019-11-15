#
class secure_linux_cis::debian8::cis_3_2 (
  Boolean $enforced = true,
) {
  include secure_linux_cis::rules::network_parameters
}
