# @api private
#
# @summary Ensure Reverse Path Filtering is enabled 
#
class secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled {
  sysctl { 'net.ipv4.conf.all.rp_filter':
    value    => 1,
  }
  sysctl { 'net.ipv4.conf.default.rp_filter':
    value    => 1,
  }
}
