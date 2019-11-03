# frozen_string_literal: true

# unconf_daemons.rb
# Ensures no unconfined daemons exist
Facter.add('unconf_daemons') do
  confine kernel: 'Linux'
  setcode "ps -eZ | egrep \"initrc\" | egrep -vw \"tr|ps|egrep|bash|awk\" | tr ':' ' ' | awk '{ print $NF }'"
end
