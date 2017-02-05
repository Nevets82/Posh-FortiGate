# Posh-FortiGate PowerShell FortiGate Module

This PowerShell module provides some functionality to facilitate automating backup actions of a FortiGate device over SSH. This module also provides some basic functionality for troubleshooting FortiGate devices.

## Similar Projects

Here are some similar projects I wrote:

* [Posh-Cisco (PowerShell Cisco Module)](https://www.powershellgallery.com/packages/Posh-Cisco "Posh-Cisco PowerShell Cisco Module")

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

* Backup-FortiGateConfig: Gets the running configuration and writes it to a file.
* Get-FortiGateConfig: Gets the running configuration.
* Get-FortiGateSystemStatus: Gets the system status.
* Get-FortiGateSystemPerformanceStatus: Gets the system performance status.
* Get-FortiGateSystemHAStatus: Gets the system HA (High-Availability) status.
* Get-FortiGateSystemSessionList: Gets the system session list.

## Usage

### Backup Configuration

This PowerShell command gets the running configuration and writes it to a file.

```PowerShell
PS> Backup-FortiGateConfig -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential) -FilePath "$([Environment]::GetFolderPath(“MyDocuments”))\running-config.txt"
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.
* Specify the ```-Full``` flag to retrieve full configuration with default values.

### Show Configuration

This PowerShell command gets the running configuration.

```PowerShell
PS> Get-FortiGateConfig -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.
* Specify the ```-Full``` flag to retrieve full configuration with default values.

### Show System Status

This PowerShell command gets the system status.

```PowerShell
PS> Get-FortiGateSystemStatus -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Show System Performance Status

This PowerShell command gets the system performance status.

```PowerShell
PS> Get-FortiGateSystemPerformanceStatus -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Show System High-Availability Status

This PowerShell command gets the system HA (High-Availability) status.

```PowerShell
PS> Get-FortiGateSystemHAStatus -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

### Show System Session List

This PowerShell command gets the system session list.

```PowerShell
PS> Get-FortiGateSystemSessionList -HostAddress "192.168.0.1" -HostPort 22 -Credential (Get-Credential)
```

Advanced Options:

* Specify the ```-AcceptKey``` flag to automatically accept SSH key.

## Compatibility

These PowerShell functions were tested on the following FortiGate devices:

* FortiGate 100D (SW version: )
* FortiGate 1000D (SW version: )

## Change Log

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
