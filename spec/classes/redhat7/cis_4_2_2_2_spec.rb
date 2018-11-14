require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_2_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_console); destination(console); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_console); destination(console); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_console); destination(xconsole); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_console); destination(xconsole); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_newscrit); destination(newscrit); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_newscrit); destination(newscrit); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_newserr); destination(newserr); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_newserr); destination(newserr); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_newsnotice); destination(newsnotice); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_newsnotice); destination(newsnotice); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_mailinfo); destination(mailinfo); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_mailinfo); destination(mailinfo); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_mailwarn); destination(mailwarn); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_mailwarn); destination(mailwarn); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_mailerr); destination(mailerr); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_mailerr); destination(mailerr); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_mail); destination(mail); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_mail); destination(mail); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_acpid); destination(acpid); flags(final); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_acpid); destination(acpid); flags(final); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_acpid_full); destination(devnull); flags(final); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_acpid_full); destination(devnull); flags(final); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_acpid_old); destination(acpid); flags(final); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_acpid_old); destination(acpid); flags(final); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_netmgm); destination(netmgm); flags(final); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_netmgm); destination(netmgm); flags(final); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_local); destination(localmessages); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_local); destination(localmessages); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_messages); destination(messages); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_messages); destination(messages); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_iptables); destination(firewall); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_iptables); destination(firewall); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_warn); destination(warn); };')
              .with(
                line: 'log { source(src); source(chroots); filter(f_warn); destination(warn); };',
              )
            is_expected.to contain_exec('reload syslog-ng 4_2_2_2')
              .with(
                command: '/bin/pkill -HUP syslog-ng',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_warn); destination(warn); };')
            is_expected.not_to contain_exec('reload syslog-ng 4_2_2_2')
          }
        end
      end
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file_line('syslog-ng.conf log { source(src); source(chroots); filter(f_warn); destination(warn); };')
        }
      end
    end
  end
end
