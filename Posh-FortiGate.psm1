# Posh-FortiGate PowerShell FortiGate Module
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

# Import PowerShell SSH Module
Import-Module Posh-SSH;

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateSSHResponse
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey,
		[Parameter(Mandatory=$true)]
		[String]$Command,
		[Parameter(Mandatory=$false)]
		[String]$StripHeaderAt = $null
    )

    $SSHSession = New-SSHSession -ComputerName $HostAddress -Port $HostPort -Credential $Credential -AcceptKey:$AcceptKey;
        
    if ($SSHSession.Connected)
    {
        $SSHResponse = Invoke-SSHCommand -SSHSession $SSHSession -Command $Command;
    
        Remove-SSHSession -SSHSession $SSHSession | Out-Null;

        $Result = $SSHResponse.Output | Out-String;

        $StartIndex = 0;

        if ($StripHeaderAt)
        {
            $StartIndex = $Result.IndexOf(" # $StripHeaderAt");

            if ($StartIndex -lt 0)
            {
                $StartIndex = $Result.IndexOf(" $ $StripHeaderAt");
            }

            if ($StartIndex -lt 0)
            {
                $StartIndex = 0;
            }
            else 
            {
                $StartIndex += 3;
            }
        }

        $Result = $Result.Substring($StartIndex).Trim();
        
        $EndIndex = $Result.LastIndexOf("`n");
		
        if ($EndIndex -gt 0)
        {
            $Result = $Result.Substring(0, $EndIndex + 1).Trim();
        }

      	return $Result.Replace("`n--More-- `r         `r", "`n");
    }
    else
    {
        throw [System.InvalidOperationException]"Could not connect to SSH host: $($HostAddress):$HostPort.";
    }
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateConfig
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$Full,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey
    )

    $Command = 'show';

    if ($Full)
    {
        $Command = 'show full-configuration';
    }

    return (Get-FortiGateSSHResponse -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -AcceptKey:$AcceptKey -Command $Command -StripHeaderAt '#config-');
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Backup-FortiGateConfig
{
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$Full,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey,
		[Parameter(Mandatory=$true)]
		[String]$FilePath
    )

    Get-FortiGateConfig -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -Full:$Full -AcceptKey:$AcceptKey | Out-File -FilePath $FilePath -Encoding ascii;
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateSystemStatus
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey
    )

    return (Get-FortiGateSSHResponse -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -AcceptKey:$AcceptKey -Command 'get system status' -StripHeaderAt 'Version: ');
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateSystemPerformanceStatus
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey
    )

    return (Get-FortiGateSSHResponse -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -AcceptKey:$AcceptKey -Command 'get system performance status' -StripHeaderAt 'CPU ');
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateSystemHAStatus
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey
    )

    return (Get-FortiGateSSHResponse -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -AcceptKey:$AcceptKey -Command 'get system ha status' -StripHeaderAt 'HA ');
}

# .ExternalHelp Posh-FortiGate.psm1-Help.xml
function Get-FortiGateSystemSessionList
{
    [OutputType([String])]
    param
    (
		[Parameter(Mandatory=$true)]
		[String]$HostAddress,
		[Parameter(Mandatory=$false)]
		[Int]$HostPort = 22,
		[Parameter(Mandatory=$true)]
		[PSCredential]$Credential,
		[Parameter(Mandatory=$false)]
		[Switch]$AcceptKey
    )

    return (Get-FortiGateSSHResponse -HostAddress $HostAddress -HostPort $HostPort -Credential $Credential -AcceptKey:$AcceptKey -Command 'get system session list' -StripHeaderAt 'PROTO ');
}
