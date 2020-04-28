require 'spec_helper'

describe 'secure_linux_cis' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'           => 'Debian',
        'operatingsystemrelease'    => '8',
      },
    ],
  }

  on_supported_os(test_on).each do |os, os_facts|
    let(:facts) { os_facts }
    let(:params) do
      {
        'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
        'profile_type'      => 'workstation',
        'enforcement_level' => '2',
      }
    end

    puts "\n##########>  #{os} - workstation 2  <##########\n\n"

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_20') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_21') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_4_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_4_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_5_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_5_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_5_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_5_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_6_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_7_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_3_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_2_3_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_3_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_3_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_4_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_4_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_4_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_5_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_3_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_3_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_4_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_5_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_20') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::debian8::cis_6_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::reboot') }
    it { is_expected.to contain_class('secure_linux_cis::rules::audit_sgid_executables') }
    it { is_expected.to contain_class('secure_linux_cis::rules::audit_suid_executables') }
    it { is_expected.to contain_class('secure_linux_cis::rules::audit_system_file_permissions') }
    it { is_expected.to contain_class('secure_linux_cis::rules::disable_automounting') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_aide_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_all_apparmor_profiles_are_enforcing') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_all_users_home_directories_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_all_users_last_password_change_date_is_in_the_past') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_apparmor_is_not_disabled_in_bootloader_configuration') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_at_cron_is_restricted_to_authorized_users') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_auditd_service_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_authentication_required_for_single_user_mode') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_avahi_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_bootloader_password_is_set') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_broadcast_icmp_requests_are_ignored') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_chrony_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_core_dumps_are_restricted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_cron_daemon_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_cups_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_dccp_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_deny_firewall_policy') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_group_for_the_root_account_is_gid_0') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_dhcp_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_dns_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_etc_hosts_allow_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_etc_hosts_deny_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_filesystem_integrity_is_regularly_checked') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ftp_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_gdm_login_banner_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_http_proxy_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_http_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_inactive_password_lock_is_30_days_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_inetd_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ip_forwarding_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_iptables_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_firewall_rules_exist_for_all_open_ports') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_loopback_traffic_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_outbound_and_established_connections_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_router_advertisements_are_not_accepted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ldap_client_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ldap_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_lockout_for_failed_password_attempts_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_logging_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_login_and_logout_events_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_logrotate_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_loopback_traffic_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_7_or_more') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_freevxfs_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_hfs_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_jffs2_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_mounting_of_udf_filesystems_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nis_client_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nis_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_duplicate_gids_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_duplicate_group_names_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_duplicate_uids_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_duplicate_user_names_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_passwd') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_unconfined_daemons_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_users_have_forward_files') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_users_have_netrc_files') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_users_have_rhosts_files') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_no_world_writable_files_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nodev_option_set_on_home_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nodev_option_set_on_removable_media_partitions') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nodev_option_set_on_tmp_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_noexec_option_set_on_dev_shm_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nosuid_option_set_on_removable_media_partitions') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nosuid_option_set_on_tmp_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nosuid_option_set_on_var_tmp_partition') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ntp_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_only_strong_ciphers_are_used') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_only_strong_key_exchange_algorithms_are_used') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_package_manager_repositories_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_creation_requirements_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_fields_are_not_empty') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_password_reuse_is_limited') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_cron_d_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_cron_daily_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_cron_hourly_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_cron_monthly_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_cron_weekly_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_crontab_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_group__are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_gshadow__are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_gshadow_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_hosts_allow_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_hosts_deny_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_issue_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_passwd__are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_shadow__are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_etc_ssh_sshd_config_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_prelink_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rds_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_root_is_the_only_uid_0_account') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_root_login_is_restricted_to_system_console') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_root_path_integrity') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsh_client_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsync_service_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsyslog_or_syslog_ng_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsyslog_service_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_samba_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_sctp_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_selinux_or_apparmor_are_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_selinux_policy_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_separate_partition_exists_for_home') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_separate_partition_exists_for_var') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_separate_partition_exists_for_var_tmp') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_session_initiation_information_is_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_shadow_group_is_empty') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_snmp_server_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_access_is_limited') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_loglevel_is_appropriate') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_loglevel_is_set_to_info') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_protocol_is_set_to_2') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_root_login_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_suspicious_packets_are_logged') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_syslog_ng_service_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_accounts_are_non_login') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_talk_client_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_tcp_wrappers_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_telnet_client_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_time_synchronization_is_in_use') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_tipc_is_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_tmp_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_updates_patches_and_additional_security_software_are_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_users_dot_files_are_not_group_or_world_writable') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_users_home_directories_permissions_are_750_or_more_restrictive') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_users_netrc_files_are_not_group_or_world_accessible') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_users_own_their_home_directories') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_xd_nx_support_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_xinetd_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::service') }
    it { is_expected.to contain_cron__job('cron_aide') }
    it { is_expected.to contain_cron__monthly('security-update') }
    it { is_expected.to contain_exec('create_aide_database') }
    it { is_expected.to contain_exec('reload sshd') }
    it { is_expected.to contain_exec('root_wheel') }
    it { is_expected.to contain_file('/boot/grub/grub.cfg') }
    it { is_expected.to contain_file('/etc/at.allow') }
    it { is_expected.to contain_file('/etc/at.deny') }
    it { is_expected.to contain_file('/etc/cron.allow') }
    it { is_expected.to contain_file('/etc/cron.d') }
    it { is_expected.to contain_file('/etc/cron.daily') }
    it { is_expected.to contain_file('/etc/cron.deny') }
    it { is_expected.to contain_file('/etc/cron.hourly') }
    it { is_expected.to contain_file('/etc/cron.monthly') }
    it { is_expected.to contain_file('/etc/cron.weekly') }
    it { is_expected.to contain_file('/etc/crontab') }
    it { is_expected.to contain_file('/etc/group-') }
    it { is_expected.to contain_file('/etc/group') }
    it { is_expected.to contain_file('/etc/gshadow-') }
    it { is_expected.to contain_file('/etc/gshadow') }
    it { is_expected.to contain_file('/etc/hosts.allow') }
    it { is_expected.to contain_file('/etc/hosts.deny') }
    it { is_expected.to contain_file('/etc/issue') }
    it { is_expected.to contain_file('/etc/motd') }
    it { is_expected.to contain_file('/etc/passwd-') }
    it { is_expected.to contain_file('/etc/passwd') }
    it { is_expected.to contain_file('/etc/rsyslog.d/*.*;mail.none;news.none') }
    it { is_expected.to contain_file('/etc/rsyslog.d/*.=warning;*.=err') }
    it { is_expected.to contain_file('/etc/rsyslog.d/*.crit') }
    it { is_expected.to contain_file('/etc/rsyslog.d/*.emerg') }
    it { is_expected.to contain_file('/etc/rsyslog.d/') }
    it { is_expected.to contain_file('/etc/rsyslog.d/local0,local1.*') }
    it { is_expected.to contain_file('/etc/rsyslog.d/local2,local3.*') }
    it { is_expected.to contain_file('/etc/rsyslog.d/local4,local5.*') }
    it { is_expected.to contain_file('/etc/rsyslog.d/local6,local7.*') }
    it { is_expected.to contain_file('/etc/rsyslog.d/mail.*') }
    it { is_expected.to contain_file('/etc/rsyslog.d/mail.err') }
    it { is_expected.to contain_file('/etc/rsyslog.d/mail.info') }
    it { is_expected.to contain_file('/etc/rsyslog.d/mail.warning') }
    it { is_expected.to contain_file('/etc/rsyslog.d/news.crit') }
    it { is_expected.to contain_file('/etc/rsyslog.d/news.err') }
    it { is_expected.to contain_file('/etc/rsyslog.d/news.notice') }
    it { is_expected.to contain_file('/etc/shadow-') }
    it { is_expected.to contain_file('/etc/shadow') }
    it { is_expected.to contain_file('/etc/ssh/sshd_config') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/audit_priv.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/dot_file_wr.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/dup_gid.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/dup_group.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/dup_uid.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/dup_usr.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/forward.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/home_dir_own.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/home_dir_perm.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/home_directory.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/netrc.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/netrc_access.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/pwd_group_exist.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/rhost.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts/root_path.sh') }
    it { is_expected.to contain_file('/usr/share/cis_scripts') }
    it { is_expected.to contain_file('/var/log') }
    it { is_expected.to contain_file_line('/etc/bash.bashrc_export_tmout') }
    it { is_expected.to contain_file_line('/etc/bash.bashrc_tmout') }
    it { is_expected.to contain_file_line('/etc/profile readonly tmout') }
    it { is_expected.to contain_file_line('/etc/profile_export_tmout') }
    it { is_expected.to contain_file_line('/etc/profile_tmout') }
    it { is_expected.to contain_file_line('action_mail_acct') }
    it { is_expected.to contain_file_line('admin_space_left_action') }
    it { is_expected.to contain_file_line('audit.rules access 1') }
    it { is_expected.to contain_file_line('audit.rules access 2') }
    it { is_expected.to contain_file_line('audit.rules access 3') }
    it { is_expected.to contain_file_line('audit.rules access 4') }
    it { is_expected.to contain_file_line('audit.rules access 5') }
    it { is_expected.to contain_file_line('audit.rules access 6') }
    it { is_expected.to contain_file_line('audit.rules file access 1') }
    it { is_expected.to contain_file_line('audit.rules file access 2') }
    it { is_expected.to contain_file_line('audit.rules file access 3') }
    it { is_expected.to contain_file_line('audit.rules file access 4') }
    it { is_expected.to contain_file_line('audit.rules file deletion 1') }
    it { is_expected.to contain_file_line('audit.rules file deletion 2') }
    it { is_expected.to contain_file_line('audit.rules kernel module 1') }
    it { is_expected.to contain_file_line('audit.rules kernel module 2') }
    it { is_expected.to contain_file_line('audit.rules kernel module 3') }
    it { is_expected.to contain_file_line('audit.rules kernel module 4') }
    it { is_expected.to contain_file_line('audit.rules kernel module 5') }
    it { is_expected.to contain_file_line('audit.rules login/logout 1') }
    it { is_expected.to contain_file_line('audit.rules login/logout 2') }
    it { is_expected.to contain_file_line('audit.rules login/logout 3') }
    it { is_expected.to contain_file_line('audit.rules make immutable') }
    it { is_expected.to contain_file_line('audit.rules mounts 1') }
    it { is_expected.to contain_file_line('audit.rules mounts 2') }
    it { is_expected.to contain_file_line('audit.rules network 1') }
    it { is_expected.to contain_file_line('audit.rules network 2') }
    it { is_expected.to contain_file_line('audit.rules network 3') }
    it { is_expected.to contain_file_line('audit.rules network 4') }
    it { is_expected.to contain_file_line('audit.rules network 5') }
    it { is_expected.to contain_file_line('audit.rules network 6') }
    it { is_expected.to contain_file_line('audit.rules selinux 1') }
    it { is_expected.to contain_file_line('audit.rules selinux 2') }
    it { is_expected.to contain_file_line('audit.rules session 1') }
    it { is_expected.to contain_file_line('audit.rules session 2') }
    it { is_expected.to contain_file_line('audit.rules session 3') }
    it { is_expected.to contain_file_line('audit.rules sudo.log 1') }
    it { is_expected.to contain_file_line('audit.rules sudoers 1') }
    it { is_expected.to contain_file_line('audit.rules sudoers 2') }
    it { is_expected.to contain_file_line('audit.rules time 1') }
    it { is_expected.to contain_file_line('audit.rules time 2') }
    it { is_expected.to contain_file_line('audit.rules time 3') }
    it { is_expected.to contain_file_line('audit.rules time 4') }
    it { is_expected.to contain_file_line('audit.rules time 5') }
    it { is_expected.to contain_file_line('audit.rules user/group 1') }
    it { is_expected.to contain_file_line('audit.rules user/group 2') }
    it { is_expected.to contain_file_line('audit.rules user/group 3') }
    it { is_expected.to contain_file_line('audit.rules user/group 4') }
    it { is_expected.to contain_file_line('audit.rules user/group 5') }
    it { is_expected.to contain_file_line('bashrc') }
    it { is_expected.to contain_file_line('disable_ipv6_network') }
    it { is_expected.to contain_file_line('disable_ipv6_network_init') }
    it { is_expected.to contain_file_line('emergency') }
    it { is_expected.to contain_file_line('limits_hc') }
    it { is_expected.to contain_file_line('login.defs') }
    it { is_expected.to contain_file_line('max_log_file') }
    it { is_expected.to contain_file_line('max_log_file_action') }
    it { is_expected.to contain_file_line('ntpuser') }
    it { is_expected.to contain_file_line('pam dcredit') }
    it { is_expected.to contain_file_line('pam lcredit') }
    it { is_expected.to contain_file_line('pam minlen') }
    it { is_expected.to contain_file_line('pam ocredit') }
    it { is_expected.to contain_file_line('pam ucredit') }
    it { is_expected.to contain_file_line('password change policy') }
    it { is_expected.to contain_file_line('password expiration policy') }
    it { is_expected.to contain_file_line('password warning policy') }
    it { is_expected.to contain_file_line('profile') }
    it { is_expected.to contain_file_line('rescue') }
    it { is_expected.to contain_file_line('rsyslog.conf InputTCPServerRun') }
    it { is_expected.to contain_file_line('rsyslog.conf ModLoad') }
    it { is_expected.to contain_file_line('rsyslog.conf log_permissions') }
    it { is_expected.to contain_file_line('space_left_action') }
    it { is_expected.to contain_file_line('ssh alive count max') }
    it { is_expected.to contain_file_line('ssh alive interval') }
    it { is_expected.to contain_file_line('ssh ciphers') }
    it { is_expected.to contain_file_line('ssh host based authentication') }
    it { is_expected.to contain_file_line('ssh ignore rhosts') }
    it { is_expected.to contain_file_line('ssh kex') }
    it { is_expected.to contain_file_line('ssh log level') }
    it { is_expected.to contain_file_line('ssh login grace time') }
    it { is_expected.to contain_file_line('ssh mac algorithms') }
    it { is_expected.to contain_file_line('ssh max auth tries') }
    it { is_expected.to contain_file_line('ssh permit empty password') }
    it { is_expected.to contain_file_line('ssh permit root login') }
    it { is_expected.to contain_file_line('ssh permit user environment') }
    it { is_expected.to contain_file_line('ssh protocol') }
    it { is_expected.to contain_file_line('ssh warning banner') }
    it { is_expected.to contain_file_line('ssh x11') }
    it { is_expected.to contain_file_line('su') }
    it { is_expected.to contain_file_line('useradd_inactive') }
    it { is_expected.to contain_firewall('001 IPv6 accept all input to lo interface') }
    it { is_expected.to contain_firewall('001 accept all input to lo interface') }
    it { is_expected.to contain_firewall('002 IPv6 accept all output to lo interface') }
    it { is_expected.to contain_firewall('002 accept all output to lo interface') }
    it { is_expected.to contain_firewall('003 IPv6 drop all to lo ::/0') }
    it { is_expected.to contain_firewall('003 drop all to lo 127.0.0.0/8') }
    it { is_expected.to contain_firewall('004 accept new and established ouput IPv6 tcp connections') }
    it { is_expected.to contain_firewall('004 accept new and established ouput tcp connections') }
    it { is_expected.to contain_firewall('005 accept new and established ouput IPv6 udp connections') }
    it { is_expected.to contain_firewall('005 accept new and established ouput udp connections') }
    it { is_expected.to contain_firewall('006 accept new and established ouput IPv6 icmp connections') }
    it { is_expected.to contain_firewall('006 accept new and established ouput icmp connections') }
    it { is_expected.to contain_firewall('007 accept estalished input IPv6 tcp connections') }
    it { is_expected.to contain_firewall('007 accept estalished input tcp connections') }
    it { is_expected.to contain_firewall('008 accept estalished input IPv6 udp connections') }
    it { is_expected.to contain_firewall('008 accept estalished input udp connections') }
    it { is_expected.to contain_firewall('009 accept estalished input IPv6 icmp connections') }
    it { is_expected.to contain_firewall('009 accept estalished input icmp connections') }
    it { is_expected.to contain_firewall('010 open IPv6 ssh port') }
    it { is_expected.to contain_firewallchain('FORWARD:filter:IPv4') }
    it { is_expected.to contain_firewallchain('FORWARD:filter:IPv6') }
    it { is_expected.to contain_firewallchain('INPUT:filter:IPv4') }
    it { is_expected.to contain_firewallchain('INPUT:filter:IPv6') }
    it { is_expected.to contain_firewallchain('OUTPUT:filter:IPv4') }
    it { is_expected.to contain_firewallchain('OUTPUT:filter:IPv6') }
    it { is_expected.to contain_kernel_parameter('apparmor=1') }
    it { is_expected.to contain_kernel_parameter('audit=1') }
    it { is_expected.to contain_kernel_parameter('enforcing=0') }
    it { is_expected.to contain_kernel_parameter('quiet') }
    it { is_expected.to contain_kernel_parameter('security=apparmor') }
    it { is_expected.to contain_kernel_parameter('selinux=0') }
    it { is_expected.to contain_kmod__install('cramfs') }
    it { is_expected.to contain_kmod__install('dccp') }
    it { is_expected.to contain_kmod__install('freevxfs') }
    it { is_expected.to contain_kmod__install('hfs') }
    it { is_expected.to contain_kmod__install('hfsplus') }
    it { is_expected.to contain_kmod__install('jffs2') }
    it { is_expected.to contain_kmod__install('rds') }
    it { is_expected.to contain_kmod__install('sctp') }
    it { is_expected.to contain_kmod__install('squashfs') }
    it { is_expected.to contain_kmod__install('tipc') }
    it { is_expected.to contain_kmod__install('udf') }
    it { is_expected.to contain_notify('NX') }
    it { is_expected.to contain_notify('allow_groups') }
    it { is_expected.to contain_notify('mh') }
    it { is_expected.to contain_notify('vla') }
    it { is_expected.to contain_notify('vlp') }
    it { is_expected.to contain_notify('vp') }
    it { is_expected.to contain_notify('vtp') }
    it { is_expected.to contain_package('aide') }
    it { is_expected.to contain_package('apparmor-utils') }
    it { is_expected.to contain_package('apparmor') }
    it { is_expected.to contain_package('auditd') }
    it { is_expected.to contain_package('exim4') }
    it { is_expected.to contain_package('inetd') }
    it { is_expected.to contain_package('ldap-utils') }
    it { is_expected.to contain_package('libpam-pwquality') }
    it { is_expected.to contain_package('nis') }
    it { is_expected.to contain_package('openldap-clients') }
    it { is_expected.to contain_package('prelink') }
    it { is_expected.to contain_package('rsh-client') }
    it { is_expected.to contain_package('rsh-redone-client') }
    it { is_expected.to contain_package('rsh') }
    it { is_expected.to contain_package('rsyslog') }
    it { is_expected.to contain_package('talk') }
    it { is_expected.to contain_package('tcpd') }
    it { is_expected.to contain_package('telnet') }
    it { is_expected.to contain_package('xinetd') }
    it { is_expected.to contain_package('ypbind') }
    it { is_expected.to contain_pam('pam common-password pwhistory') }
    it { is_expected.to contain_pam('pam common-password requisite') }
    it { is_expected.to contain_pam('pam_tally2 common-auth') }
    it { is_expected.to contain_pam('pam_unix common-password') }
    it { is_expected.to contain_reboot('after_run') }
    it { is_expected.to contain_resources('firewall') }
    it { is_expected.to contain_schedule('harden_schedule') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/home-nodev') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/tmp-mode=1777,strictatime,noexec,nodev,nosuid') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/tmp-nodev') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/tmp-nosuid') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/var/tmp-nodev') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/var/tmp-noexec') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/var/tmp-nosuid') }
    it { is_expected.to contain_service('apache2') }
    it { is_expected.to contain_service('apache') }
    it { is_expected.to contain_service('auditd') }
    it { is_expected.to contain_service('autofs') }
    it { is_expected.to contain_service('avahi-daemon') }
    it { is_expected.to contain_service('bind9') }
    it { is_expected.to contain_service('cron') }
    it { is_expected.to contain_service('cups') }
    it { is_expected.to contain_service('dhcpd') }
    it { is_expected.to contain_service('httpd') }
    it { is_expected.to contain_service('isc-dhcp-server6') }
    it { is_expected.to contain_service('isc-dhcp-server') }
    it { is_expected.to contain_service('lighttpd') }
    it { is_expected.to contain_service('nfs-server') }
    it { is_expected.to contain_service('nfs') }
    it { is_expected.to contain_service('nginx') }
    it { is_expected.to contain_service('nis') }
    it { is_expected.to contain_service('rpcbind') }
    it { is_expected.to contain_service('rsync') }
    it { is_expected.to contain_service('rsyncd') }
    it { is_expected.to contain_service('rsyslog') }
    it { is_expected.to contain_service('slapd') }
    it { is_expected.to contain_service('smbd') }
    it { is_expected.to contain_service('snmpd') }
    it { is_expected.to contain_service('squid') }
    it { is_expected.to contain_service('vsftpd') }
    it { is_expected.to contain_service('ypserv') }
    it { is_expected.to contain_sysctl('fs.suid_dumpable') }
    it { is_expected.to contain_sysctl('kernel.randomize_va_space') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.accept_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.accept_source_route') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.log_martians') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.rp_filter') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.secure_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.all.send_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.accept_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.accept_source_route') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.log_martians') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.rp_filter') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.secure_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.conf.default.send_redirects') }
    it { is_expected.to contain_sysctl('net.ipv4.icmp_echo_ignore_broadcasts') }
    it { is_expected.to contain_sysctl('net.ipv4.icmp_ignore_bogus_error_responses') }
    it { is_expected.to contain_sysctl('net.ipv4.ip_forward') }
    it { is_expected.to contain_sysctl('net.ipv4.tcp_syncookies') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.all.accept_ra') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.all.accept_redirects') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.all.accept_source_route') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.all.disable_ipv6') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.all.forwarding') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.default.accept_ra') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.default.accept_redirects') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.default.accept_source_route') }
    it { is_expected.to contain_sysctl('net.ipv6.conf.default.disable_ipv6') }
    it { is_expected.to contain_user('root') }
  end
end
