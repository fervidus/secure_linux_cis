# # 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
# #
# #
# # Description:
# # The default TMOUT determines the shell timeout for users. The TMOUT value is measured in seconds.
# #
# # @summary 5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_5_4_5

# The TMOUT parameter has been added in 5_4_4

#   class secure_linux_cis::redhat7::cis_5_4_5 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#
#   }
# }
