#
class secure_linux_cis::cis_oracle8::cis_1_7_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly
}
