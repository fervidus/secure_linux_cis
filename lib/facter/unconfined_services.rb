# frozen_string_literal: true

# unconfined_services.rb
# This contains all unconfined processes

Facter.add('unconfined_services') do
  confine kernel: 'Linux'
  setcode 'ps -eZ | grep unconfined_service_t'
end
