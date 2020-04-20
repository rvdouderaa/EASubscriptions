. ./credentials.ps1


# Request Access Token
$body = "grant_type=client_credentials&client_id=$APPID&client_secret=$SECRET&resource=https://management.azure.com/"
$url = "https://login.microsoftonline.com/$TENANTID/oauth2/token"
$AccessToken = Invoke-RestMethod -uri $url -ContentType 'application/x-www-form-urlencoded' -body $body -Method 'POST'
$AccessToken.access_token



$headers=@{Authorization="Bearer $($AccessToken.access_token)"
    'Accept'='application/json'
}

$url =  "https://management.azure.com/providers/Microsoft.Billing/enrollmentAccounts?api-version=2018-03-01-preview" 
Invoke-RestMethod -uri $url -ContentType 'application/json' -Headers $headers -Method 'GET'

<#
GET https://management.azure.com/providers/Microsoft.Billing/enrollmentAccounts?api-version=2018-03-01-preview


GET https://management.azure.com/providers/Microsoft.Billing/enrollmentAccounts?api-version=2018-03-01-preview

{
    "value": [
      {
        "id": "/providers/Microsoft.Billing/enrollmentAccounts/747ddfe5-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "747ddfe5-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "type": "Microsoft.Billing/enrollmentAccounts",
        "properties": {
          "principalName": "SignUpEngineering@contoso.com"
        }
      },
      {
        "id": "/providers/Microsoft.Billing/enrollmentAccounts/4cd2fcf6-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "4cd2fcf6-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "type": "Microsoft.Billing/enrollmentAccounts",
        "properties": {
          "principalName": "BillingPlatformTeam@contoso.com"
        }
      }
    ]
  }



  POST https://management.azure.com/providers/Microsoft.Billing/enrollmentAccounts/<enrollmentAccountObjectId>/providers/Microsoft.Subscription/createSubscription?api-version=2018-03-01-preview

{
  "displayName": "Dev Team Subscription",
  "offerType": "MS-AZR-0017P",
  "owners": [
    {
      "objectId": "<userObjectId>"
    },
    {
      "objectId": "<servicePrincipalObjectId>"
    }
  ]
}
#>