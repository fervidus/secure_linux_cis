#
class secure_linux_cis::cis_oracle7::cis_3_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
