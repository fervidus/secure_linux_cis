# local_users.rb
# This fact contains a dictionary of local users and their value for max number of days between a password change
Facter.add(:local_users) do
  confine osfamily: 'RedHat'
  require 'time'
  setcode do
    local_users = {}
    user_list = Facter::Core::Execution.exec('egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1').split("\n")
    if user_list
      user_list.each do |user|
        local_users[user] = {}

        maximum_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Max\"")
        number_parser_max = %r{\d+}.match(maximum_number_of_days_between_password_change)

        minimum_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Min\"")
        number_parser_min = %r{\d+}.match(minimum_number_of_days_between_password_change)

        warning_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"warn\"")
        number_parser_warn = %r{\d+}.match(warning_number_of_days_between_password_change)

        password_inactive = Facter::Core::Execution.exec("chage --list #{user} | grep \"inactive\"")
        number_parser_inactive = %r{\d+}.match(password_inactive)

        password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Last\"")
        number_parser_change = %r{\: ([^:]*)}.match(password_change)
        password_valid_date = Date.parse(number_parser_change[0]) <= Date.today

        local_users[user] = {
          'max_days_between_password_change'  => number_parser_max[0].to_i,
          'min_days_between_password_change'  => number_parser_min[0].to_i,
          'warn_days_between_password_change' => number_parser_warn[0].to_i,
          'password_inactive'                 => number_parser_inactive ? number_parser_inactive[0].to_i : '',
          'password_change'                   => password_valid_date,
        }
      end
    end
    local_users
  end
end
