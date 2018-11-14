require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_1_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/etc/rsyslog.d/*.emerg')
              .with(
                content: '*.emerg :omusrmsg:*',
              )
            is_expected.to contain_file('/etc/rsyslog.d/mail.*')
              .with(
                content: 'mail.* -/var/log/mail',
              )
            is_expected.to contain_file('/etc/rsyslog.d/mail.info')
              .with(
                content: 'mail.info -/var/log/mail.info',
              )
            is_expected.to contain_file('/etc/rsyslog.d/mail.warning')
              .with(
                content: 'mail.warning -/var/log/mail.warn',
              )
            is_expected.to contain_file('/etc/rsyslog.d/mail.err')
              .with(
                content: 'mail.err /var/log/mail.err',
              )
            is_expected.to contain_file('/etc/rsyslog.d/news.crit')
              .with(
                content: 'news.crit -/var/log/news/news.crit',
              )
            is_expected.to contain_file('/etc/rsyslog.d/news.err')
              .with(
                content: 'news.err -/var/log/news/news.err',
              )
            is_expected.to contain_file('/etc/rsyslog.d/news.notice')
              .with(
                content: 'news.notice -/var/log/news/news.notice',
              )
            is_expected.to contain_file('/etc/rsyslog.d/*.=warning;*.=err')
              .with(
                content: '*.=warning;*.=err -/var/log/warn',
              )
            is_expected.to contain_file('/etc/rsyslog.d/*.crit')
              .with(
                content: '*.crit /var/log/warn',
              )
            is_expected.to contain_file('/etc/rsyslog.d/*.*;mail.none;news.none')
              .with(
                content: '*.*;mail.none;news.none -/var/log/messages',
              )
            is_expected.to contain_file('/etc/rsyslog.d/local0,local1.*')
              .with(
                content: 'local0,local1.* -/var/log/localmessages',
              )
            is_expected.to contain_file('/etc/rsyslog.d/local2,local3.*')
              .with(
                content: 'local2,local3.* -/var/log/localmessages',
              )
            is_expected.to contain_file('/etc/rsyslog.d/local4,local5.*')
              .with(
                content: 'local4,local5.* -/var/log/localmessages',
              )
            is_expected.to contain_file('/etc/rsyslog.d/local6,local7.*')
              .with(
                content: 'local6,local7.* -/var/log/localmessages',
              )
          }
        else
          it {
            is_expected.not_to contain_file('/etc/rsyslog.d/*.emerg')
            is_expected.not_to contain_file('/etc/rsyslog.d/mail.*')
            is_expected.not_to contain_file('/etc/rsyslog.d/mail.info')
            is_expected.not_to contain_file('/etc/rsyslog.d/mail.warning')
            is_expected.not_to contain_file('/etc/rsyslog.d/mail.err')
            is_expected.not_to contain_file('/etc/rsyslog.d/news.crit')
            is_expected.not_to contain_file('/etc/rsyslog.d/news.err')
            is_expected.not_to contain_file('/etc/rsyslog.d/news.notice')
            is_expected.not_to contain_file('/etc/rsyslog.d/*.=warning;*.=err')
            is_expected.not_to contain_file('/etc/rsyslog.d/*.crit')
            is_expected.not_to contain_file('/etc/rsyslog.d/*.*;mail.none;news.none')
            is_expected.not_to contain_file('/etc/rsyslog.d/local0,local1.*')
            is_expected.not_to contain_file('/etc/rsyslog.d/local2,local3.*')
            is_expected.not_to contain_file('/etc/rsyslog.d/local4,local5.*')
            is_expected.not_to contain_file('/etc/rsyslog.d/local6,local7.*')
          }
        end
      end
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file('/etc/rsyslog.d/*.emerg')
          is_expected.not_to contain_file('/etc/rsyslog.d/mail.*')
          is_expected.not_to contain_file('/etc/rsyslog.d/mail.info')
          is_expected.not_to contain_file('/etc/rsyslog.d/mail.warning')
          is_expected.not_to contain_file('/etc/rsyslog.d/mail.err')
          is_expected.not_to contain_file('/etc/rsyslog.d/news.crit')
          is_expected.not_to contain_file('/etc/rsyslog.d/news.err')
          is_expected.not_to contain_file('/etc/rsyslog.d/news.notice')
          is_expected.not_to contain_file('/etc/rsyslog.d/*.=warning;*.=err')
          is_expected.not_to contain_file('/etc/rsyslog.d/*.crit')
          is_expected.not_to contain_file('/etc/rsyslog.d/*.*;mail.none;news.none')
          is_expected.not_to contain_file('/etc/rsyslog.d/local0,local1.*')
          is_expected.not_to contain_file('/etc/rsyslog.d/local2,local3.*')
          is_expected.not_to contain_file('/etc/rsyslog.d/local4,local5.*')
          is_expected.not_to contain_file('/etc/rsyslog.d/local6,local7.*')
        }
      end
    end
  end
end
