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
$enrollmentaccounts = Invoke-RestMethod -uri $url -ContentType 'application/json' -Headers $headers -Method 'GET'

$request = @"
{
  "displayName": "Dev Team Subscription 101",
  "offerType": "MS-AZR-0017P",
}
"@


$url =  "https://management.azure.com/providers/Microsoft.Billing/enrollmentAccounts/$ENROLLMENTACCOUNT/providers/Microsoft.Subscription/createSubscription?api-version=2018-03-01-preview"
$result = Invoke-RestMethod -uri $url -ContentType 'application/json' -Headers $headers -Method 'POST' -Body $request

