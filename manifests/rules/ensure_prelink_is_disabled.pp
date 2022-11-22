# @api private
#
# @summary Ensure prelink is disabled 
#
class secure_linux_cis::rules::ensure_prelink_is_disabled {
  case $facts['os']['family'] {
    'Suse': {
      package { 'prelink':
        ensure   => absent,
      }
    }
    default: {
      package { 'prelink':
        ensure   => absent,
      }
    }
  }
}
