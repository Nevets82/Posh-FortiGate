# Posh-FortiGate6 PowerShell FortiGate Module
# Copyright (c) 2021 David Schafer, All rights reserved.
# Copyright (c) 2017 Steven Lietaer, All rights reserved.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

@{

    # Script module or binary module file associated with this manifest.
    # RootModule = ''

    # Version number of this module.
    ModuleVersion     = '0.2.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '3a4ffbfb-f16d-419c-b8e9-e54669b80486'

    # Author of this module
    Author            = 'David Schafer'

    # Company or vendor of this module
    CompanyName       = 'Unknown'

    # Copyright statement for this module
    Copyright         = '(c) 2021 David Schafer. All rights reserved.`n (c) 2017 Steven Lietaer. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'PowerShell module that provides some functionality to facilitate automating backup actions of a FortiGate (Firmware v6.2.x & up) device over SSH. This module also provides some basic functionality for troubleshooting FortiGate devices.'

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @('Posh-SSH')

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules     = @('Posh-FortiGate6.psm1')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('Get-FortiGateConfig', 'Backup-FortiGateConfig', 'Get-FortiGateSystemStatus', 'Get-FortiGateSystemPerformanceStatus', 'Get-FortiGateSystemHAStatus', 'Get-FortiGateSystemSessionList', 'Get-FortiGateCLIOutputMode', 'Set-FortiGateCLIOutputMode')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = '*'

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    FileList          = @('Posh-FortiGate6.psm1')

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('Backup', 'Config', 'Configuration', 'FortiGate', 'HA', 'High-Availability', 'Performance', 'Session', 'Status', 'System')

            # A URL to the license for this module.
            LicenseUri   = 'https://github.com/daveschafer/Posh-FortiGate6/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/daveschafer/Posh-FortiGate6'

            # A URL to an icon representing this module.
            IconUri      = 'http://daveschafer.github.io/static/images/posh-fortigate6.png'

            # ReleaseNotes of this module
            ReleaseNotes = 'https://github.com/daveschafer/Posh-FortiGate6'

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

