require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_6_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_firewall('004 accept new and established ouput tcp connections')
              .with(
                chain: 'OUTPUT',
                state: ['NEW', 'ESTABLISHED'],
                action: 'accept',
                proto: 'tcp',
              )
            is_expected.to contain_firewall('005 accept new and established ouput udp connections')
              .with(
                chain: 'OUTPUT',
                state: ['NEW', 'ESTABLISHED'],
                action: 'accept',
                proto: 'udp',
              )
            is_expected.to contain_firewall('006 accept new and established ouput icmp connections')
              .with(
                chain: 'OUTPUT',
                state: ['NEW', 'ESTABLISHED'],
                action: 'accept',
                proto: 'icmp',
              )
            is_expected.to contain_firewall('007 accept estalished input tcp connections')
              .with(
                chain: 'INPUT',
                state: 'ESTABLISHED',
                action: 'accept',
                proto: 'tcp',
              )
            is_expected.to contain_firewall('008 accept estalished input udp connections')
              .with(
                chain: 'INPUT',
                state: 'ESTABLISHED',
                action: 'accept',
                proto: 'udp',
              )
            is_expected.to contain_firewall('009 accept estalished input icmp connections')
              .with(
                chain: 'INPUT',
                state: 'ESTABLISHED',
                action: 'accept',
                proto: 'icmp',
              )
          }
        else
          it {
            is_expected.not_to contain_firewall('004 accept new and established ouput tcp connections')
            is_expected.not_to contain_firewall('005 accept new and established ouput udp connections')
            is_expected.not_to contain_firewall('006 accept new and established ouput icmp connections')
            is_expected.not_to contain_firewall('007 accept estalished input tcp connections')
            is_expected.not_to contain_firewall('008 accept estalished input udp connections')
            is_expected.not_to contain_firewall('009 accept estalished input icmp connections')
          }
        end
      end
    end
  end
end
