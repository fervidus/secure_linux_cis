#
class secure_linux_cis::suse12::cis_3_1 (
  Boolean $enforced = true,
) {
  include secure_linux_cis::rules::network_parameters
}
