#
class secure_linux_cis::distribution::rhel8::cis_1_6_1 {
  include secure_linux_cis::rules::ensure_core_dumps_are_restricted
}
