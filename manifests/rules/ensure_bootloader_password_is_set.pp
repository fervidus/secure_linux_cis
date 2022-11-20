# @api private
#
# Ensure grub bootloader password is set (Scored)
#
# Description:
# Setting bootloader password will require a username and password to change default boot options
#
# @summary Ensure bootloader password is set (Scored)
#
# @see https://www.gnu.org/software/grub/manual/grub/grub.html
#
# @see https://github.com/ryran/burg2-mkpasswd-pbkdf2
#
#   Should this rule be enforced - defaults to false
#
#   Account name to authenticate against - defaults to root
#
#   String with value of pwssword in GRUB PBKDF2 format
#
# @note IMPORTANT:
#   grub_pbkdf2_password_hash must be set in hiera to implement. See associated grub documentation
#   and test on non-production machines before using elsewhere in your environment
#
#   secure_linux_cis::rules::ensure_bootloader_password_is_set::grub_pbkdf2_password_hash: grub.pbkdf2.sha512.10000.7D81626...ABC0123210CBA
#

# class secure_linux_cis::rules::ensure_bootloader_password_is_set (
#   String $grub_username = $secure_linux_cis::grub_username,
#   Optional[String] $grub_pbkdf2_password_hash = $secure_linux_cis::grub_pbkdf2_password_hash,
# ) {
#   if $grub_pbkdf2_password_hash != undef {
#     grub_user { $grub_username:
#       password  => $grub_pbkdf2_password_hash,
#       superuser => true,
#     }
#   }
#   elsif $facts['grub_pass'] == undef {
#     fail('No PBKDF2 password hash provided or set. Please add proper value to hiera or disable this rule until present.')
#   }
# }

class secure_linux_cis::rules::ensure_bootloader_password_is_set {
}
