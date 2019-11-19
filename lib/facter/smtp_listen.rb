# Custom fact to test if there is a SMTP daemon listening on port 25 on a non-local port
# CIS 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
#
# This is done by directly probing /proc/net/tcp*, as that is guaranteed to be available on Linux.
# Tools such as netstat, ss, lsof or fuser are not installed on each and every Linux flavor.

PROC_NET_TCP = '/proc/net/tcp'.freeze # Should always be the same
PROC_NET_TCP6 = '/proc/net/tcp6'.freeze # Should always be the same
SMTP_PORT = '0016'.freeze # Hex 25
LOCALHOST_IPv4 = '0100007F'.freeze # 127.0.0.1 in hex
LOCALHOST_IPv6 = '00000000000000000000000001000000'.freeze # ::1 in hex

Facter.add('smtp_listen') do
  confine osfamily: ['RedHat', 'Debian']
  smtp = []
  setcode do
    File.open(PROC_NET_TCP).each do |i|
      i = i.split(' ')
      next unless i[1] =~ %r{:#{SMTP_PORT}$} # Skip anything but smtp
      next if i[1] =~ %r{^#{LOCALHOST_IPv4}:} # Skip localhost
      next unless i[2] =~ %r{^0{8}:0{4}$} # Only LISTEN
      smtp << 'There is a process listening on TCP port 25'
    end
    File.open(PROC_NET_TCP6).each do |i|
      i = i.split(' ')
      next unless i[1] =~ %r{:#{SMTP_PORT}$} # Skip anything but smtp
      next if i[1] =~ %r{^#{LOCALHOST_IPv6}:} # Skip localhost
      next unless i[2] =~ %r{^0{32}:0{4}$} # only LISTEN
      smtp << 'There is a process listening on TCP port 25 (IPv6)'
    end
    smtp
  end
end
