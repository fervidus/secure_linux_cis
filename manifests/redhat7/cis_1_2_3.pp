# # 1.2.3 Ensure GPG keys are configured (Not Scored)
# #
# #
# # Description:
# # Most packages managers implement GPG key signing to verify package integrity during installation.
# #
# # @summary 1.2.3 Ensure GPG keys are configured (Not Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_1_2_3
# class secure_linux_cis::redhat7::cis_1_2_3 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#
#       exec { 'gpgkey':
#         command => "rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\\n' > /tmp/gpgkeys.txt",
#         creates => '/tmp/gpgkeys.txt',
#         path    => '/bin/',
#         notify  => Notify['gpg_keys'],
#         }
#       notify { 'gpg_keys':
#         message => '[1.2.3] (Not Scored) Your GPG key configuration is stored in /tmp/gpgkeys.txt, please review and ensure all keys
#         are in a desired state', #lint:ignore:140chars
#       }
#   }
# }
#------Data is stored in custom fact gpgkey
