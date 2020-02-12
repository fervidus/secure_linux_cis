# @api private
# #  Ensure root login is restricted to system console (Not Scored)
# #
# #
# # Description:
# # The file /etc/securetty contains a list of valid terminals that may be logged in directly as root.
# #
# # @summary  Ensure root login is restricted to system console (Not Scored)
# #
# # @param enforced Should this rule be enforced
# #
# # @example
# #   include secure_linux_cis::ensure_root_login_is_restricted_to_system_console
#
#   class secure_linux_cis::rules::ensure_root_login_is_restricted_to_system_console (
#   Boolean $enforced = true,
# ) {
#
##
#     notify { 'console':
#     message => '[] (Not Scored) Please ensure any consoles specified in /etc/securetty are valid and in a physically secure location',
#     }
#   }
# }
#---This cannot be automated or enforced in any way
class secure_linux_cis::rules::ensure_root_login_is_restricted_to_system_console {}
