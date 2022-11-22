# @api private
#
# @summary Ensure minimum days between password changes is configured 
#
class secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_configured {
  include secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_7_or_more
}
