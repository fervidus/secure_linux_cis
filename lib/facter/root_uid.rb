# frozen_string_literal: true

# root_uid.rb
# This contains all users that have a UID of "0"

Facter.add('root_uid') do
  confine kernel: 'Linux'
  setcode "cat /etc/passwd | awk -F: '($3 == 0) { print $1 }'"
end
