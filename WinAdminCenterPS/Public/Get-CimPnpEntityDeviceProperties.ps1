<#
    
    .SYNOPSIS
        Gets Plug and Play device device properties.
    
    .DESCRIPTION
        Gets Plug and Play device device properties.

    .NOTES
        This function is pulled directly from the real Microsoft Windows Admin Center

        PowerShell scripts use rights (according to Microsoft):
        We grant you a non-exclusive, royalty-free right to use, modify, reproduce, and distribute the scripts provided herein.

        ANY SCRIPTS PROVIDED BY MICROSOFT ARE PROVIDED “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED,
        INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS OR A PARTICULAR PURPOSE.
    
    .ROLE
        Readers
    
#>
function Get-CimPnpEntityDeviceProperties {
    Param(
    [string]$DeviceId
    )
    
    import-module CimCmdlets
    
    $keyInstance = New-CimInstance -Namespace root/cimv2 -ClassName Win32_PnPEntity -Key @('DeviceId') -Property @{DeviceId=$DeviceId;} -ClientOnly
    Invoke-CimMethod $keyInstance -MethodName GetDeviceProperties
}