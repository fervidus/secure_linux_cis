# Changelog

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
