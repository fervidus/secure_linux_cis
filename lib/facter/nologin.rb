# frozen_string_literal: true

# non-login.rb
# Ensures certain accounts used for managing applications cannot be accessed

Facter.add('nologin') do
  confine kernel: 'Linux'
  setcode do
    user_list = Facter::Core::Execution.exec(
      "egrep -v \"^\\+\" /etc/passwd | awk -F: '($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $3<1000 && $7!~\"/sbin/nologin\" && $7!=\"/bin/false\") {print}'",
    ).split("\n")
    # rubocop:enable Metrics/LineLength
    users = []

    user_list.each do |user|
      users.push(%r{^[^:]*}.match(user))
    end
    users
  end
end
