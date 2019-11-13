#
class secure_linux_cis::cis_debian8::cis_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::network_parameters
}
