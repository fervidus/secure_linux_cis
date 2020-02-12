# @api private
# A description of what this class does
#
# Description:
# The commands below change password encryption from md5 to sha512 (a much stronger hashing algorithm).
# All existing accounts will need to perform a password change to upgrade the stored hashes to the new algorithm.
#
# Rationale:
# The SHA-512 algorithm provides much stronger hashing than MD5, thus providing additional protection
# to the system by increasing the level of effort for an attacker to successfully determine passwords.
#
# Note that these change only apply to accounts configured on the local system.
#
# @summary A short summary of the purpose of this class
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_password_hashing_algorithm_is_sha_512
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512(
    Boolean $enforced = false,
) {
  # This benchmark is managed in secure_linux_cis::ensure_password_hashing_algorithm_is_sha_512
}
