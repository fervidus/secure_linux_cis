# Custom fact to test if there is a SMTP daemon listening on port 25 on a non-local port
# CIS 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
#
# This is done by directly probing /proc/net/tcp*, as that is guaranteed to be available on Linux.
# Tools such as netstat, ss, lsof or fuser are not installed on each and every Linux flavor.

Facter.add('smtp_listen') do
  confine kernel: 'Linux'
  smtp = []
  setcode do
    File.open('/proc/net/tcp').each do |i|
      i = i.split(' ')
      next unless %r{:0016$}.match?(i[1]) # Skip anything but smtp
      next if %r{^0100007F:}.match?(i[1]) # Skip localhost
      next unless %r{^0{8}:0{4}$}.match?(i[2]) # Only LISTEN
      smtp << 'There is a process listening on TCP port 25'
    end

    if File.exist?('/proc/net/tcp6')
      File.open('/proc/net/tcp6').each do |i|
        i = i.split(' ')
        next unless %r{:0016$}.match?(i[1]) # Skip anything but smtp
        next if %r{^00000000000000000000000001000000:}.match?(i[1]) # Skip localhost
        next unless %r{^0{32}:0{4}$}.match?(i[2]) # only LISTEN
        smtp << 'There is a process listening on TCP port 25 (IPv6)'
      end
    end
    smtp
  end
end
