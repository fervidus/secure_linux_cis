#
class secure_linux_cis::cis_oracle6::cis_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::network_parameters
}
