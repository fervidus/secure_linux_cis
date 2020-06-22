# Changelog

## Release 2.0.14

* Cleaned up and fixed the way /var/log directory is secured.

## Release 2.0.13

* Important fixes

## Release 2.0.12

* Fix for su command is restricted bug

## Release 2.0.11

* Add whitelist for non-nologin shells
* Make TMOUT variable configurable
* Support for Debian10
* Add file test for tcp6 to pevent warning if tcp6 disabled

## Release 2.0.10

* New updated documentation
* Apache license
* Litmus acceptance testing

## Release 2.0.5 Release Candidate

* Added plan to harden OS's
* Separated Centos 7 and RHEL 7 into server / workstation profiles

## Release 2.0.0 Release Candidate

* Major release adding Linux releases and refactoring
* Module level hiera now used with (optional) exclude_rules subtracted from include_rules
* Not all OS's supported as yet

## Release 1.0.17

* Fix issue with logic in cis_1_7_2
* Correct syntax in rootpw fact
* Fix logic in cis_1_2_1
* Fix type for cis_6_2_6 in centos.pp 

## Release 1.0.16

* Add file_line management of /etc/default/useradd INACTIVE entry in cis_5_4_1_4 to meet Nessus scan requirement
* Expand puppetlabs/firewall version range to >= 1.15.0 < 3.0.0 as many other modules still have < 2.0.0 and this module will fail to install
* Added support for CIS 4.1.12
* Add newlines to the end of /etc/hosts.{allow,deny} in cis_3_4_2 and cis_3_4_3
* cis_5_4_1_4 now also covers the default setting

## Release 1.0.15

* Activate use of cis_1_1_3, cis 1_1_4 and cis_1_1_5 to manage /tmp partition options in centos7.pp
* Change management of /dev/shm to use mount resource in cis_1_1_15 as not listed in /etc/fstab and mount_options.pp fails
* Move TMOUT setting from cis_5_4_4 to cis 5_4_5, add export and readonly lines to /etc/bashrc
* Add oboe/chrony to dependencies in metadata to allow time_sync to work with chrony
* Add puppetlabs/mount_core to metadata to maintain compliance with puppet 6
* Raise minimum version requirements for dependencies in metadata
* Raise Puppet version requirement to >= 5.0.0 < 7.0.0

## Release 1.0.14

Thanks to Bart-Jan Vrielink for fixing our spec test.

## Release 1.0.13

* Added AIDE database renaming to cis_1_3_1 as 'aide --init' command creates a new temporary file requiring renaming
* Change cis_1_6_11 to use kernel_parameter instead of file_line to set 'quiet' in grub.cfg, to avoid entire line being overwritten in /etc/default/grub.cfg
* Add optional $motd parameter to be sole content of /etc/motd in cis_1_7_1_4.  If not defined and $banner is defined, $banner becomes content of /etc/motd
* Restore sysctl resources when disabling ipv6 in cis_3_3_1, cis_3_3_2 and cis_3_3_3, remove kernel_parameter from cis_3_3_3 as problematic when using sysctl to disable and check ipv6, add /etc/sysconfig/network entries
* Update cis_3_3_3 and cis_3_6_2 to allow ip6_tables to drop undefined traffic
* Fix typo in cis_5_3_1 of try_first_path instead of try_first_pass
* Remove nullok and add shadow to /etc/pam.d system-auth and password-auth in cis_5_3_3
* Remove all use of pkill, add rsyslog and rsyslog-ng classes to array of classes that trigger an opt-in reboot, as rsyslog can be (outside of this module) configured to halt system or boot into single mode if terminated
* Fix various custom fact scripts issues with missing .sh, false positives when home dir absent, reduce script file and directory permissions to 0700
* Update local_users custom fact to allow for users whose password needs to be changed
* Move location of custom fact scripts directory from /tmp/cis_scripts to /usr/share/cis_scripts as fail to execute if /tmp mounted noexec as per recommendations!
* Remove subscription_manager from dependencies as appears unused

## Release 1.0.12

* Fix cis_5_2_14 ssh DenyGroups typo
* Refactor remaining bash scripts using Shellcheck and test functions
* Replace sysctl resources with file_line in cis_3_3_1, cis_3_3_2 and cis_3_3_3 as sysctl fails to write to /proc/sys/net/ipv6 when  kernel_parameter ipv6.disable=1 in effect and system has been rebooted.  Kernel_parameter requires a reboot to have effect.
* Add shared resources block to end of centos7.pp and redhat7.pp to invoke service/system reload or restart only when notified
* Add parameter for auto_restart when defined classes make changes that require a reboot to take effect (defaults to false)
* Add optional parameter for banner which becomes the sole content of /etc/issue, /etc/issue.net and /etc/motd

## Release 1.0.11

* Create resource collector override to disable ip6tables in class cis_3_3_3 when ipv6 disabled
* Change default of ip6_enabled to false (ipv6 is now now opt-in)
* Increase max_log_file default size from 8 to 32Mb to satisfy Nessus scan

## Release 1.0.10

* Fix multiple line issue with cis 5.2.10

## Release 1.0.9

* Multiple cleanup
* Grub fixes
* Started plan

## Release 1.0.8

* Refactoring by CanIHaveThisOne
* Change audit.rules entries to /etc/audit/rules.d/audit.rules so persistent across reboots
* Add '-e 2' to audit.rules to make immutable (activate class cis_4_1_18)
* Refactor and expand local_users fact and classes cis_5_4_1_1 to cis_5_4_1_5
* Reinstate confining facts to RedHat
* Re-fix typo in auditd rule cis_4_1_4

## Release 1.0.7

* Added multiple enhancements by Dan Wittenberg
* Move to PDK 12

## Release 1.0.5

* Confined facts to RedHat family

## Release 1.0.1

Added selinux test and check by Patrick Picard (patpicos).

Made changes for Puppet 6.

**Features**

**Bugfixes**

**Known Issues**
