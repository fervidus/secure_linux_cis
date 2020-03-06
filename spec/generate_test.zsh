#!/usr/local/bin/zsh

###
###  usage:  spec/generate_test.zsh CentOS 7 server 2 | pbcopy
###

OS=$1
RELEASE=$2
PROFILE=$3
LEVEL=$4

CLASS=()
CRON_JOB=()
CRON_MONTHLY=()
EXEC=()
FILE=()
FILE_LINE=()
FIREWALL=()
FIREWALLCHAIN=()
KERNEL_PARAMETER=()
KMOD_INSTALL=()
NOTIFY=()
PACKAGE=()
PAM=()
REBOOT=()
RESOURCES=()
SCHEDULE=()
MOUNT_OPTIONS=()
SERVICE=()
SYSCTL=()
USER=()

PDK=/opt/puppetlabs/pdk/bin/pdk

${PDK} test unit --parallel | grep "\]$" | sed 's/\]$/'"'"'\) }/g' | while read normalized; do
  #echo ${normalized}
  [[ ${normalized} =~ '^Class\[' ]] && CLASS+=( ${normalized//'Class['/'it { is_expected.to contain_class('"'"} )
  [[ ${normalized} =~ '^Cron::Job\[' ]] && CRON_JOB+=( ${normalized//'Cron::Job['/'it { is_expected.to contain_cron__job('"'"} )
  [[ ${normalized} =~ '^Cron::Monthly\[' ]] && CRON_MONTHLY+=( ${normalized//'Cron::Monthly['/'it { is_expected.to contain_cron__monthly('"'"} )
  [[ ${normalized} =~ '^Exec\[' ]] && EXEC+=( ${normalized//'Exec['/'it { is_expected.to contain_exec('"'"} )
  [[ ${normalized} =~ '^File\[' ]] && FILE+=( ${normalized//'File['/'it { is_expected.to contain_file('"'"} )
  [[ ${normalized} =~ '^File_line\[' ]] && FILE_LINE+=( ${normalized//'File_line['/'it { is_expected.to contain_file_line('"'"} )
  [[ ${normalized} =~ '^Firewall\[' ]] && FIREWALL+=( ${normalized//'Firewall['/'it { is_expected.to contain_firewall('"'"} )
  [[ ${normalized} =~ '^Firewallchain\[' ]] && FIREWALLCHAIN+=( ${normalized//'Firewallchain['/'it { is_expected.to contain_firewallchain('"'"} )
  [[ ${normalized} =~ '^Kernel_parameter\[' ]] && KERNEL_PARAMETER+=( ${normalized//'Kernel_parameter['/'it { is_expected.to contain_kernel_parameter('"'"} )
  [[ ${normalized} =~ '^Kmod::Install\[' ]] && KMOD_INSTALL+=( ${normalized//'Kmod::Install['/'it { is_expected.to contain_kmod__install('"'"} )
  [[ ${normalized} =~ '^Notify\[' ]] && NOTIFY+=( ${normalized//'Notify['/'it { is_expected.to contain_notify('"'"} )
  [[ ${normalized} =~ '^Package\[' ]] && PACKAGE+=( ${normalized//'Package['/'it { is_expected.to contain_package('"'"} )
  [[ ${normalized} =~ '^Pam\[' ]] && PAM+=( ${normalized//'Pam['/'it { is_expected.to contain_pam('"'"} )
  [[ ${normalized} =~ '^Reboot\[' ]] && REBOOT+=( ${normalized//'Reboot['/'it { is_expected.to contain_reboot('"'"} )
  [[ ${normalized} =~ '^Resources\[' ]] && RESOURCES+=( ${normalized//'Resources['/'it { is_expected.to contain_resources('"'"} )
  [[ ${normalized} =~ '^Schedule\[' ]] && SCHEDULE+=( ${normalized//'Schedule['/'it { is_expected.to contain_schedule('"'"} )
  [[ ${normalized} =~ '^Secure_linux_cis::Mount_options\[' ]] && MOUNT_OPTIONS+=( ${normalized//'Secure_linux_cis::Mount_options['/'it { is_expected.to contain_secure_linux_cis__mount_options('"'"} )
  [[ ${normalized} =~ '^Service\[' ]] && SERVICE+=( ${normalized//'Service['/'it { is_expected.to contain_service('"'"} )
  [[ ${normalized} =~ '^Sysctl\[' ]] && SYSCTL+=( ${normalized//'Sysctl['/'it { is_expected.to contain_sysctl('"'"} )
  [[ ${normalized} =~ '^User\[' ]] && USER+=( ${normalized//'User['/'it { is_expected.to contain_user('"'"} )
done

# counts for sanity check
# echo "--------------------------------------------\n"
# echo "CLASS: ${#CLASS[@]}"
# echo "CRON_JOB: ${#CRON_JOB[@]}"
# echo "CRON_MONTHLY: ${#CRON_MONTHLY[@]}"
# echo "EXEC: ${#EXEC[@]}"
# echo "FILE: ${#FILE[@]}"
# echo "FILE_LINE: ${#FILE_LINE[@]}"
# echo "FIREWALL: ${#FIREWALL[@]}"
# echo "FIREWALLCHAIN: ${#FIREWALLCHAIN[@]}"
# echo "KERNEL_PARAMETER: ${#KERNEL_PARAMETER[@]}"
# echo "KMOD_INSTALL: ${#KMOD_INSTALL[@]}"
# echo "NOTIFY: ${#NOTIFY[@]}"
# echo "PACKAGE: ${#PACKAGE[@]}"
# echo "PAM: ${#PAM[@]}"
# echo "REBOOT: ${#REBOOT[@]}"
# echo "RESOURCES: ${#RESOURCES[@]}"
# echo "SCHEDULE: ${#SCHEDULE[@]}"
# echo "MOUNT_OPTIONS: ${#MOUNT_OPTIONS[@]}"
# echo "SERVICE: ${#SERVICE[@]}"
# echo "SYSCTL: ${#SYSCTL[@]}"
# echo "USER: ${#USER[@]}"
# echo "--------------------------------------------\n"

# print the top
echo "require 'spec_helper'"
echo " "
echo "describe 'secure_linux_cis' do"
echo "  test_on = {"
echo "    supported_os: ["
echo "      {"
echo "        'operatingsystem'           => '${OS}',"
echo "        'operatingsystemrelease'    => '${RELEASE}',"
echo "      },"
echo "    ],"
echo "  }"
echo " "
echo "  on_supported_os(test_on).each do |os, os_facts|"
echo "    let(:facts) { os_facts }"
echo "    let(:params) do"
echo "      {"
echo "        'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],"
echo "        'profile_type'      => '${PROFILE}',"
echo "        'enforcement_level' => '${LEVEL}',"
echo "      }"
echo "    end"
echo " "
echo '    puts "\\n##########>  #{os} - '"${PROFILE} ${LEVEL}"'  <##########\\n\\n"'
echo " "    
echo "    it { is_expected.to compile.with_all_deps }"

# lowercase on classes
for ELEMENT in ${CLASS[@]}; do
  echo "    ${ELEMENT:l}"
done

# case as-is for remaining
for ELEMENT in ${CRON_JOB[@]} \
               ${CRON_MONTHLY[@]} \
               ${EXEC[@]} ${FILE[@]} \
               ${FILE_LINE[@]} \
               ${FIREWALL[@]} \
               ${FIREWALLCHAIN[@]} \
               ${KERNEL_PARAMETER[@]} \
               ${KMOD_INSTALL[@]} \
               ${NOTIFY[@]} \
               ${PACKAGE[@]} \
               ${PAM[@]} \
               ${REBOOT[@]} \
               ${RESOURCES[@]} \
               ${SCHEDULE[@]} \
               ${MOUNT_OPTIONS[@]} \
               ${SERVICE[@]} \
               ${SYSCTL[@]} \
               ${USER[@]}; do
  echo "    ${ELEMENT}"
done

# print the bottom
echo " "
echo "  end"
echo "end"
