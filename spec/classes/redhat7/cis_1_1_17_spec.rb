# require 'spec_helper'
#
# bool_options = [true, false]
#
# describe 'secure_linux_cis::redhat7::cis_1_1_17' do
#   on_supported_os.each do |os, os_facts|
#     bool_options.each do |option|
#       context "on #{os}" do
#         let(:facts) { os_facts }
#         let(:params) { { 'enforced' => option } }
#
#         it { is_expected.to compile }
#
#         if option
#           it {
#             is_expected.to contain_notify('sne')
#           }
#         else
#           it {
#             is_expected.not_to contain_notify('sne')
#           }
#         end
#       end
#     end
#   end
# end
