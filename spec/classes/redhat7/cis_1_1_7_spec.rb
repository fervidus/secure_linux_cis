# require 'spec_helper'
#
# bool_options = [true, false]
#
# describe 'secure_linux_cis::redhat7::cis_1_1_7' do
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
#             is_expected.to contain_notify('vtp')
#           }
#         else
#           it {
#             is_expected.not_to contain_notify('vtp')
#           }
#         end
#       end
#     end
#   end
# end
#-----Commented because of spec fact conflict
