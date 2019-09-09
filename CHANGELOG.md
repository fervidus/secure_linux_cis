# Changelog

## Release 1.0.12
* Fix cis_5_2_14 ssh DenyGroups typo
* Refactor remaining bash scripts using Shellcheck and test functions
* Replace sysctl resources with file_line in cis_3_3_1, cis_3_3_2 and cis_3_3_3 as sysctl fails to write to /proc/sys/net/ipv6 when  kernel_parameter ipv6.disable=1 in effect and system has been rebooted.  Kernel_parameter requires a reboot to have effect.
* Add shared resources block to end of centos7.pp and redhat7.pp to invoke service/system reload or restart only when notified

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
