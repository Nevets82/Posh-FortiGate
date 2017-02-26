# Posh-FortiGate PowerShell FortiGate Module

This PowerShell module provides some functionality to facilitate automating backup actions of a FortiGate device over SSH. This module also provides some basic functionality for troubleshooting FortiGate devices.

## Similar Projects

Here are some similar projects I am working on:

* [Posh-Cisco (PowerShell Cisco Module)](https://www.powershellgallery.com/packages/Posh-Cisco "Posh-Cisco PowerShell Cisco Module")
* [Posh-Juniper (PowerShell Juniper Module)](https://www.powershellgallery.com/packages/Posh-Juniper "Posh-Juniper PowerShell Juniper Module")
* [Posh-Ubnt (PowerShell Ubnt Module)](https://www.powershellgallery.com/packages/Posh-Ubnt "Posh-Ubnt PowerShell Ubnt Module")

## Dependencies

This module depends on the following PowerShell modules:

* [Posh-SSH (PowerShell SSH Module)](https://www.powershellgallery.com/packages/Posh-SSH "Posh-SSH PowerShell SSH Module")

## Inspect

```PowerShell
PS> Save-Module -Name Posh-FortiGate -Path <path>
```

## Install

```PowerShell
PS> Install-Module -Name Posh-FortiGate
```

## Functionality

* Backup-FortiGateConfig: Gets the configuration and writes it to a file.
* Get-FortiGateConfig: Gets the configuration.
* Get-FortiGateSystemStatus: Gets the system status.
* Get-FortiGateSystemPerformanceStatus: Gets the system performance status.
* Get-FortiGateSystemHAStatus: Gets the system HA (High-Availability) status.
* Get-FortiGateSystemSessionList: Gets the system session list.

## Usage

### Backup Configuration

This PowerShell command gets the configuration and writes it to a file.

```PowerShell
PS> Backup-FortiGateConfig -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential) -FilePath "$([Environment]::GetFolderPath(“MyDocuments”))\config.txt"
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.
* Specify the ```-Full``` flag to retrieve full configuration with default values.

### Get Configuration

This PowerShell command gets the configuration.

```PowerShell
PS> Get-FortiGateConfig -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.
* Specify the ```-Full``` flag to retrieve full configuration with default values.

### Get System Status

This PowerShell command gets the system status.

```PowerShell
PS> Get-FortiGateSystemStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Get System Performance Status

This PowerShell command gets the system performance status.

```PowerShell
PS> Get-FortiGateSystemPerformanceStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Get System High-Availability Status

This PowerShell command gets the system HA (High-Availability) status.

```PowerShell
PS> Get-FortiGateSystemHAStatus -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Get System Session List

This PowerShell command gets the system session list.

```PowerShell
PS> Get-FortiGateSystemSessionList -HostAddress "192.168.1.99" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

## Security Considerations

Before you create scripts that use this module, you should create a ```readonly_admin``` profile and ```readonly_User``` user to be used for the PSCredentials.

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

## Compatibility

These PowerShell functions were tested on the following FortiGate devices:

* FortiGate 100D (SW version: 5.4.1)
* FortiGate 1000D (SW version: 5.4.1)

## Change Log

### Version 1.0.1

#### New Features

* Added security considerations section to documentation

#### Bug Fixes

* Fixed issue with prompt being $ instead of #
* Fixed issue with backup file being UTF-16 instead of ASCII

### Version 1.0.0

#### New Features

* Added documentation
* Added support to backup configuration to a file (Backup-FortiGateConfig)
* Added support to backup full configuration (with default values) to a file (Backup-FortiGateConfig -Full)
* Added support to get configuration (Get-FortiGateConfig)
* Added support to get full configuration (with default values) (Get-FortiGateConfig -Full)
* Added support to get system status (Get-FortiGateSystemStatus)
* Added support to get system performance status (Get-FortiGateSystemPerformanceStatus)
* Added support to get system (HA) high-availability status (Get-FortiGateSystemHAStatus)
* Added support to get system session list (Get-FortiGateSystemSessionList)

## Todo

* Test on more devices
* ...
