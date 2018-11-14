# # 1.5.2 Ensure XD/NX support is enabled (Not Scored)
# #
# #
# # Description:
# # Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis.
# # Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD).
# # This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible.
# # Extra steps must be taken to ensure that this protection is enabled, particularly on 32-bit x86 systems. Other processors, such
# # as # Itanium and POWER, have included such support since inception and the standard kernel for those platforms supports the feature.
# #
# # @summary 1.5.2 Ensure XD/NX support is enabled (Not Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_1_5_2
# class secure_linux_cis::redhat7::cis_1_5_2 (
#   Boolean $enforced = true,
# ) {
#
#   if $enforced {
#
#     notify { 'NX':
#       message  => '[1.5.2] (Not Scored) Please run "dmesg | grep NX" and verify that No Execute (or Execute Disable, for some Intel
#       processors) protection is enabled', #lint:ignore:140chars
#     }
#   }
# }
#-----Documented in README
