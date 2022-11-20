# @api private
#  Ensure minimum days between password changes is 7 or more (Scored)
#
# Description:
# The PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum
# number of days have passed since the last time the user changed their password. It is recommended that PASS_MIN_DAYS parameter be set to
# 7 or more days.
#
# Rationale:
# By restricting the frequency of password changes, an administrator can prevent users from repeatedly changing their password in an
# attempt to circumvent password reuse controls.
#
# @summary  Ensure minimum days between password changes is 7 or more (Scored)
#
class secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_configured {
  include secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_7_or_more
}
