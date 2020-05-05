

1. Create service principal
2. Get service principal ID
```powershell
Get-AzServicePrincipal
```
3. Get EnrollmentAccountObjectID
```powershell
Get-AzEnrollmentAccount
```
4. Grant Access to Service Principal
```powershell
New-AzRoleAssignment -RoleDefinitionName Owner -ObjectId <userObjectId> -Scope /providers/Microsoft.Billing/enrollmentAccounts/<enrollmentAccountObjectId>
```
[https://docs.microsoft.com/nl-nl/azure/azure-resource-manager/management/grant-access-to-create-subscription?tabs=rest%2Crest-2]

5. Create subscription using REST API
[https://docs.microsoft.com/nl-nl/azure/azure-resource-manager/management/programmatically-create-subscription?tabs=rest]


