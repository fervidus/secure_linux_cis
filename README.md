[![Build Status](https://img.shields.io/travis/fervidus/secure_linux_cis)](https://img.shields.io/travis/fervidus/secure_linux_cis)

# secure_linux_cis


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started](#setup)
    * [What secure_linux_cis affects](#what-secure_linux_cis-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with test](#beginning-with-secure_linux_cis)
3. [Usage - Configuration options and additional functionality](#usage)
    * [Opening firewall ports](#opening-firewall-ports)
    * [Disabling rules with Hiera](#disabling-rules-with-hiera)
    * [No-Op Mode](#no-op-mode)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module implements security controls defined in the Center for Internet Security (CIS) benchmarks for the following operating systems and benchmark versions:

| Operating System | Benchmark Version |
|------------------|-------------------|
| Aliyun       | 2.2.0 |
| Amazon 2017  | 2.2.0 |
| Amazon 2     | 2.2.0 |
| CentOS 6     | 2.1.0 |
| CentOS 7     | 2.2.0 |
| CentOS 8     | 1.0.0 |
| Debian 8     | 2.0.1 |
| Debian 9     | 1.0.1 |
| Oracle 6     | 1.0.0 |
| Oracle 7     | 2.2.0 |
| Oracle 8     | 1.1.0 |
| RedHat 6     | 2.1.0 |
| RedHat 7     | 2.2.0 |
| RedHat 8     | 1.0.0 |
| SLES   12    | 2.1.0 |
| Ubuntu 16.04 | 1.1.0 |
| Ubuntu 18.04 | 2.1.0 |

CIS Benchmarks can be found [here](https://www.cisecurity.org/benchmark).

## Setup

### What secure_linux_cis affects

This module touches the:

* Kernel settings
* Bootloader configuration
* Update settings
* Firewall
* TCP wrappers
* File and directory permissions

These are good things. They keep you safe.

But, please run tests before slamming it into productions.

### Beginning with secure_linux_cis

To start with Secure Linux and harden your server to CIS standards, declare the `secure_linux_cis:` class.

*NOTE:* you will want to open up at least one firewall port. See [Opening firewall ports](#usage).

Three parameters are required:

* ```time_servers``` Specify your enterprise's time server(s)

* ```profile_type``` It will be ```workstation``` or ```server```

* ```allow_users``` At least one user needs to ssh in. *NOT root*

``` puppet
class {'::secure_linux_cis':
   time_servers  => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
   profile_type  => 'server',
   allow_users   => 'trusteduser',
}
```

## Usage

### Opening firewall ports

This module opens up port 22. Everythings else is shut down by default.

If using iptables (Everything but RedHat family version 8) you will need to add firewall rules.

For example we want to open up for 8080 for tomcat:

```puppet
  firewall { '010 tomcat http port':
    chain  => 'INPUT',
    dport  => 8080,
    state  => 'NEW',
    action => 'accept',
    proto  => 'tcp',
    tag    => 'cis_firewall_rule',
  }
```

Notice the ```tag``` parameter. Include this on all firewall rules.

It ensures firewall rules are implemented in the proper order.

### TCP wrappers

This module is very generous with tcp controls. It relies on firewall rules for enforecment.

You should tighten them down.

*TODO: TCP wrapper example*

### Disabling rules with Hiera

As of enforcement for the Redhat 7 OS, there are 223 CIS rules that are either enforced or documented. Each rule relates to a class which can be turned on or off according to the needs of the system. By default, all vulnerabilities are turned ON to ensure maximum security out-of-box. This is how you would disable enforcement of a particular recommendation using Hiera:

```yaml
# hieradata/common.yaml
secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled::enforced: false
```

### Enabling rules with Hiera
Some recommendations are *not* enforced by default. For example, to enforce password-protected bootloader, a hash value for password must be present:

```yaml
# hieradata/common.yaml
secure_linux_cis::rules::ensure_bootloader_password_is_set::enforced: true
secure_linux_cis::rules::ensure_bootloader_password_is_set::grub_username: root
secure_linux_cis::rules::ensure_bootloader_password_is_set::grub_pbkdf2_password_hash: grub.pbkdf2.sha512.10000.7D81626...ABC0123C616C3210CBA
```

*NOTE:* Don't use the example pbkdf2 string value. It needs to be a hash you've generated with the intended password.

See [Limitations](#limitations) for a list of vulnerabilities that might not apply to certain system configurations

Any parameters that need to be explicitly defined can be done so in init.pp

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

### No-Op Mode
It is possible to run the module in "No-Op Mode", which identifies detected Configuration Drifts without implementing any actual changes. This is useful for auditing the state of your system without making any changes.

```bash
puppet agent -t --noop
```

## Limitations

RedHat family '8' OSes are not fully covered. Almost, but not quite.

Help getting this out the door would be appreciated. Also, we do not have acceptance testing completed for OracleLinux, Aliyun, or Amazon Linux. 

Same deal. Any help appreciated.

## Development

Please ensure PDK validation and unit tests pass.

Ideally make sure litmus tests pass too, but we understand this will be out of scope for some.
