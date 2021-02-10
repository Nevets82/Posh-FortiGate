# Posh-FortiGate6 PowerShell FortiGate Module

[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/posh-fortigate6)](https://www.powershellgallery.com/packages/Posh-FortiGate6)

This PowerShell module provides some functionality to facilitate automating backup actions of a FortiGate device over SSH. This module also provides some basic functionality for troubleshooting FortiGate devices.

This module works up to FortiOs 6.4.x 

This Module is available in PowerShell Gallery!
https://www.powershellgallery.com/packages/Posh-FortiGate6

## Credits

This module is based on the original Posh-Fortigate Module from [@Nevets82](https://github.com/Nevets82) - ([Posh-Fortigate](https://github.com/Nevets82/Posh-FortiGate)), which only worked with FortiGates up to Firmware v6.0.x and is no longer updated.

This module will be update frequently for further Firmware Versions like 6.4 and 7.0, although it is not clear at the moment, how much the CLI of FortiOS 7.x has changed and if it makes more sense to completely rewrite the module by then.


## Dependencies

This module depends on the following PowerShell modules:

- [Posh-SSH (PowerShell SSH Module)](https://www.powershellgallery.com/packages/Posh-SSH 'Posh-SSH PowerShell SSH Module')

## Inspect

```PowerShell
PS> Save-Module -Name Posh-FortiGate6 -Path <path>
```

## Install

```PowerShell
PS> Install-Module -Name Posh-FortiGate6
```

## Import

```PowerShell
PS> Import-Module -Name Posh-FortiGate6
```

## Functionality

- Backup-FortiGateConfig: Gets the configuration and writes it to a file.
- Get-FortiGateConfig: Gets the configuration.
- Get-FortiGateSystemStatus: Gets the system status.
- Get-FortiGateSystemPerformanceStatus: Gets the system performance status.
- Get-FortiGateSystemHAStatus: Gets the system HA (High-Availability) status.
- Get-FortiGateSystemSessionList: Gets the system session list.

## Usage

### Backup Configuration

This PowerShell command gets the configuration and writes it to a file.

```PowerShell
PS> Backup-FortiGateConfig -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential) -FilePath "$([Environment]::GetFolderPath(“MyDocuments”))\config.txt"
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.
- Specify the `-Full` flag to retrieve full configuration with default values.
- Specify the `-EnforceStandardOutput` flag to dynamically set the CLI mode to standard.

### Get Configuration

This PowerShell command gets the configuration.

```PowerShell
PS> Get-FortiGateConfig -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.
- Specify the `-Full` flag to retrieve full configuration with default values.
- Specify the `-EnforceStandardOutput` flag to dynamically set the CLI mode to standard.

### Get System Status

This PowerShell command gets the system status.

```PowerShell
PS> Get-FortiGateSystemStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.

### Get System Performance Status

This PowerShell command gets the system performance status.

```PowerShell
PS> Get-FortiGateSystemPerformanceStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.

### Get System High-Availability Status

This PowerShell command gets the system HA (High-Availability) status.

```PowerShell
PS> Get-FortiGateSystemHAStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.

### Get System Session List

This PowerShell command gets the system session list.

```PowerShell
PS> Get-FortiGateSystemSessionList -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

- Specify the `-AcceptKey` flag to automatically accept SSH key.

## Security Considerations

Before you create scripts that use this module, you should create a `readonly_admin` profile and `readonly_User` user to be used for the PSCredentials.

```
config system accprofile
    edit "readonly_admin"
        set mntgrp read
        set admingrp read
        set updategrp read
        set authgrp read
        set sysgrp read
        set netgrp read
        set loggrp read
        set routegrp read
        set fwgrp read
        set vpngrp read
        set utmgrp read
        set wanoptgrp read
        set endpoint-control-grp read
        set wifi read
    next
end
```

```
config system admin
	edit "readonly_user"
        set trusthost1 192.168.1.1 255.255.255.255
        set accprofile "readonly_admin"
        set comments "User for PowerShell backup and troubleshooting tasks"
        set vdom "root"
        set password enterastrongpasswordhere
    next
end
```

## FortiOS 6.2.x CLI Output Mode

On FortiOS 6.2 and above, the `More` CLI output mode can cause problems resulting in incomplete configurations.

If you want the readonly_user to be able to switch the FortiOS CLI output mode, you have to set read-write access for the sysgrp as well.

```
config system accprofile
    edit "readonly_admin"
        set sysgrp read-write
    next
end
```

Alternatively you can set the CLI output mode permanently to `Standard`.

```
config system console
    set output standard
end
```

With the `-EnforceStandardOutput` parameter, the script will dynamically change the output mode to `Standard` for the duration of the command.

```PowerShell
PS> Get-FortiGateConfig -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential) -EnforceStandardOutput
```

Alternatively you can permanently change the mode to `Standard`.

```PowerShell
PS> Set-FortiGateCLIOutputMode -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential) -OutputMode standard
```

And revert it back to `More`.

```PowerShell
PS> Set-FortiGateCLIOutputMode -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential) -OutputMode more
```

## Compatibility

These PowerShell functions were tested on the following FortiGate devices:

- FortiGate 100D (SW version: 5.4.1)
- FortiGate 1000D (SW version: 5.4.1)
- FortiGate 600D (SW version: 6.0.4)
- Fortigate 30E (SW version: 6.2.1)
- Fortigate 50E (SW version: 6.2.3)
- Fortigate 60F (SW version: 6.2.3)
- Fortigate 100E (SW version: 6.2.3)

## Changelog (v6)

▶ [changelog.md](changelog.md)

## [legacy] Change Log

### Version 1.0.2

- Added optional `-EnforceStandardOutput` parameter to `Get-FortiGateConfig` and `Backup-FortiGateConfig`
- Added `Get-FortiGateCLIOutputMode` function to get the current output mode
- Added `Set-FortiGateCLIOutputMode` function to set the current output mode (standard/more)
- Added FortiOS 6.2.x CLI Output Mode section to documentation

### Version 1.0.1

#### New Features

- Added security considerations section to documentation

#### Bug Fixes

- Fixed issue with prompt being \$ instead of #
- Fixed issue with backup file being UTF-16 instead of ASCII

### Version 1.0.0

#### New Features

- Added documentation
- Added support to backup configuration to a file (Backup-FortiGateConfig)
- Added support to backup full configuration (with default values) to a file (Backup-FortiGateConfig -Full)
- Added support to get configuration (Get-FortiGateConfig)
- Added support to get full configuration (with default values) (Get-FortiGateConfig -Full)
- Added support to get system status (Get-FortiGateSystemStatus)
- Added support to get system performance status (Get-FortiGateSystemPerformanceStatus)
- Added support to get system (HA) high-availability status (Get-FortiGateSystemHAStatus)
- Added support to get system session list (Get-FortiGateSystemSessionList)

## Todo

- Test on more devices
- ...
