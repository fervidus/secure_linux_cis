
# secure_linux_cis

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with secure_linux_cis](#setup)
    * [What secure_linux_cis affects](#what-secure_linux_cis-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with secure_linux_cis](#beginning-with-secure_linux_cis)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module implements security controls defined in the Center for Internet Security (CIS) benchmarks for the below operating systems. The benchmark versions are listed below:

| Operating System | Benchmark Version |
|------------------|-------------------|
| RedHat 7 | 2.2.0 |
| CentOS 7 | 2.2.0 |

CIS Benchmarks can be found [here](https://www.cisecurity.org/benchmark/centos_linux/).

## Setup

To start with Secure Linux and harden your server to CIS standards, declare the `secure_linux_cis::redhat7` class:

```Puppet
class {'::secure_linux_cis':}
```

The module will begin enforcement and reporting immediately and without breaking by default, but to reach full compliance please specify which users or groups to allow/deny access by specifying any one of the parameters shown below:

```Puppet
class {'::secure_linux_cis':
  $allow_users  => ['john','jacob','jeremiah']
  $allow_groups => 'root',
  $deny_users   => 'mark',
  $deny_groups  => 'external',
}
```

### No-Op Mode
It is possible to run the module in "No-Op Mode", which identifies detected Configuration Drifts without implementing any actual changes. This is useful for auditing the state of your system without making any changes.

```
puppet agent -t --noop
```

## Usage

### Disabling Vulnerabilities with Hiera

As of enforcement for the Redhat 7 OS, there are 223 CIS rules that are either enforced or documented. Each rule relates to a class which can be turned on or off according to the needs of the system. By default, all vulnerabilities are turned ON to ensure maximum security out-of-box. This is how you would turn off a vulnerablity using your company's Hiera configuration.

```yaml
# hieradata/common.yaml
secure_linux::cis_1_1_2::enforced: false
```

See [Limitations](#limitations) for a list of vulnerabilities that might not apply to certain system configurations

Any parameters that need to be explicitly defined can be done so in init.pp

## Reference

### Parameters

#### `time_servers`

Default value: []

This should be the appropriate time server for your organization.

Used in cis_2_2_1_2, cis_2_2_1_3

#### `logging`

Default value: 'rsyslog'

Which system log solution the user prefers and where the logs are sent

Used in cis_4_2_1_2, cis_4_2_1_3, cis_4_2_1_4, cis_4_2_1_5, cis_4_2_2_1,
cis_4_2_2_2, cis_4_2_2_3, cis_4_2_2_4, cis_4_2_2_5, cis_4_2_3

#### `logging_host`

Default value: ''

Which host the user prefers to send logs to

Used in cis_4_2_1_4, cis_4_2_2_4

#### `is_logging_host`

Default value: False

Whether or not the node is a logging host

Used in cis_4_2_1_5, cis_4_2_2_5

#### `max_log_file`

Default value: 8

Determines the size of the specified log file (MB)

Used in cis_4_1_1_1

#### `max_auth_tries`

Default value: '4'

The amount of times authentication is allowed per connection

Used in cis_5_2_5

#### `time_sync`

Default value: 'ntp'

Which time sync service is used

Used in cis_2_2_1_2, cis_2_2_1_3

#### `ipv6_enabled`

Default value: true

Determines whether or not the system will accept ipv6 router advertisements

Used in cis_3_3_1, cis_3_3_2, cis_3_3_3

#### `approved_mac_algorithms`

Default values: ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com']

An array of approved mac algorithms that are used to connect to the system

Used in cis_5_2_11

#### `client_alive_interval`

Default value: 300

Controls timeout of ssh sessions

Used in cis_5_2_12

#### `client_alive_count_max`

Default value: '0'

Controls timeout of ssh sessions

Used in cis_5_2_12

#### `login_grace_time`

Default value: 60

The time allowed for successful authentication to the ssh server

Used in cis_5_2_13

#### `allow_users`

Default value: []

Which users can ssh into the system

Used in cis_5_2_14

#### `allow_groups`

Default value: []

Which groups can ssh into the system

Used in cis_5_2_14

#### `deny_users`

Default value: []

Which users are denied access to the system through ssh

Used in cis_5_2_14

#### `deny_groups`

Default value: []

Which groups are denied access to the system through ssh

Used in cis_5_2_14

#### `minlen`

Default value: 14

The minimum length of a user's password

Used in cis_5_3_1

#### `dcredit`

Default value: -1

A password rule requiring (in this case) at least one digit

Used in cis_5_3_1

#### `ucredit`

Default value: -1

A password rule requiring (in this case) at least one uppercase character

Used in cis_5_3_1

#### `ocredit`

Default value: -1

A password rule requiring (in this case) at least one special character

Used in cis_5_3_1

#### `lcredit`

Default value: -1

A password rule requiring (in this case) at least one lowercase character

Used in cis_5_3_1

#### `attempts`

Default value: 5

The amount of unsuccessful login attempts allowed before a user is locked out

Used in cis_5_3_2

#### `lockout_time`

Default value: 900

How long a user is locked out of their account after repeated failed attempts (seconds)

Used in cis_5_3_2

#### `past_passwords`

Default value: 5

The amount of previous passwords a user is not allowed to repeat

Used in cis_5_3_3

#### `pass_max_days`

Default value: 90

The amount of days a user is allowed before their password must be changed

Used in cis_5_4_1_1

#### `pass_min_days`

Default value: 7

The amount of days a user has to wait before changing their password again

Used in cis_5_4_1_2

#### `pass_warn_days`

Default value: 7

The amount of days a user has before they are notified of their next password change date

Used in cis_5_4_1_3

### Useful Organization Information (Highly recommended to read before using module)

#### 1.8
We have a cron job running security updates the first of every month

#### 2.2.4
With the above rule enforced, any attempt to print using this system will break things

#### 2.2.5
If the user intends to make their system a DHCP server, disable the above rule

#### 2.2.6
If the user intends to make their system an LDAP server, disable the above rule

#### 2.2.7
If the user intends to make their system an NFS server, disable the above rule

#### 2.2.8
If the user intends to make their system a DNS server, disable the above rule

#### 2.2.9
If the user intends to make their system an FTP server, disable the above rule (sftp is allowed)

#### 2.2.10
If the user intends to make their system an HTTP server, disable the above rule

#### 2.2.11
If the user intends to make their system either a POP3 or IMAP server, disable the above rule

#### 2.2.12
If the user intends to make their system a SAMBA server, disable the above rule

#### 2.2.13
If the user intends to make their system an HTTP proxy server, disable the above rule

#### 2.2.14
If the user intends to make their system a SNMP server, disable the above rule

#### 2.3.5
If the user intends to make their system an LDAP client, disable the above rule

#### 3.1.1, 3.1.2
If the user intends to make their system a router, disable the above rule

#### 3.3.1, 3.3.2, 3.3.3
If the user is not using ipv6, set the $ipv6_disabled parameter to false to disable these rules

#### 3.6.1
IMPORTANT---If the user wants to keep their existing firewall policy, disable this rule. The previous firewall resource will be purged.

#### 4.1.1.2
Once audit logs are full, the system will be shut off

#### 4.3
If the user has an explicit site policy for log rotation, disable this rule


## Limitations

For some rules, it is up to the user to fully satisfy CIS requirements

#### 1.1.18
For all removable media partitions, make sure that the "nodev" option is set

#### 1.1.19
For all removable media partitions, make sure that the "nosuid" option is set

#### 1.1.20
For all removable media partitions, make sure that the "noexec" option is set

#### 1.2.4
Please verify that your system is connected to the Red Hat Subscription Manager

#### 1.5.2
Please run "dmesg | grep NX" and verify that No Execute (or Execute Disable, for some Intel processors) protection is enabled

#### 6.1.1
Utilize the RPM package manager to ensure that system packages have been installed properly, and files have correct permissions to the OS

#### 6.1.10
Ensure no world-writable files exist in network mounted partitions. We can only check the local filesystem

#### 6.2.1
Lock any accounts that do not have passwords for review

### Important Data Stored in Facts

#### 1.2.1
**yum_repolist** contains the configuration settings for Yum repositories on the system

#### 1.2.3
**gpgkey** contains information regarding GPG configuration for the system

#### 6.1.1
**file_permissions** contains information regarding system file permissions and configuration

#### 6.1.13
**suid_files** can be examined to ensure all SUID files on the system have intended properties

#### 6.1.14
**sgid_files** can be examined to ensure all SGID files on the system have intended properties

## Development

### How to Contribute

Create a pull request and we will review your change. Log issues in the issues tab.


### Running Tests


This module is built on PDK, which can be used for testing. Download PDK and run the following commands:

```
pdk validate
pdk test unit
```

Alternatively, you can run the following to test the module:

```
bundle install
bundle exec rake rubocop
bundle exec rake syntax lint
bundle exec rake metadata_lint
bundle exec rake spec
```
## Contributors

This module is an open source project that was created and maintained by Autostructure.

## Disclaimer

> This Work is provided "as is." Any express or implied warranties,
including but not limited to, the implied warranties of merchantability
and fitness for a particular purpose are disclaimed. In no event shall
the authors be liable for any direct, indirect,
incidental, special, exemplary or consequential damages (including, but
not limited to, procurement of substitute goods or services, loss of
use, data or profits, or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of
this Guidance, even if advised of the possibility of such damage.
>
> The User of this Work agrees to hold harmless and indemnify Autostructure,
its agents, parent company, and employees from every claim or liability
(whether in tort or in contract), including attorneys' fees,
court costs, and expenses, arising in direct consequence of Recipient's
use of the item, including, but not limited to, claims or liabilities
made for injury to or death of personnel of User or third parties,
damage to or destruction of property of User or third parties, and
infringement or other violations of intellectual property or technical
data rights.
>
> Nothing in this Work is intended to constitute an endorsement, explicit
or implied, by Autostructure of any particular manufacturer's
product or service.
