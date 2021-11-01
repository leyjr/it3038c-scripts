This is how you can use a powershell plugin called "ComputerManagementDsc" for some conifurations of your windows computer such as renaming computer, joining to a domain/workgroup, and creating a powerplan are naming just a few.

To install this plugin run then command below
Get-DscResource -Module ComputerManagemenetDsc

The first command is how you would change your computer name. In the code below you would want to change "Server01" to a computer name that would suit want you need.

Configuration Computer_RenameComputerInWorkgroup_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer NewName
        {
            Name = 'Server01'
        }
    }
}

This next command would have the computer join a domain.  Again you would alter the code to join a relevant domain. You will need the credential of an admin to the targeted domain.

Configuration Computer_JoinDomain_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer JoinDomain
        {
            Name       = 'Server01'
            DomainName = 'Contoso'
            Credential = $Credential # Credential to join to domain
        }
    }
}

This last example is how you would leave a domain and join a workgroup.  You will also need admin credentials to run this command.

Configuration Computer_UnjoinDomainAndJoinWorkgroup_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer JoinWorkgroup
        {
            Name          = 'Server01'
            WorkGroupName = 'ContosoWorkgroup'
            Credential    = $Credential # Credential to unjoin from domain
        }
    }
}
