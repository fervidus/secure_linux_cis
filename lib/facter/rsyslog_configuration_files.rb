# frozen_string_literal: true

# rsyslog_configuration_files.rb
# Contains any rsyslog config files that may exist on a system

Facter.add('rsyslog_configuration_files') do
  confine kernel: 'Linux'
  setcode do
    files = Dir['/etc/rsyslog.d/*.conf']
    files = [] if files.nil?
    files << '/etc/rsyslog.conf'

    files
  end
end
