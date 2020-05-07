Login-AzAccount

$resourcegroups = @{
    "JMB-DTA-SVF-DEV" = "dta-svf-dev-we-rg"
    "JMB-DTA-SVF-ACC" = "dta-svf-acc-we-rg"
    "JMB-DTA-SVF-TST" = "dta-svf-tst-we-rg"
    "JMB-DTA-SVF-PRD" = "dta-svf-prd-we-rg"
}

$tags = @{
    Environment = "Unknown"
    ApplicationName = "SVF (Sales Volume Forecasting)";
    Project_Change = "W2004 1252";
    TeamName = "DTA"
    TeamContactMail = "nospam@nospam.com"
    Description = "DTA SVF"
}



foreach ($g in $resourcegroups.keys) {
    $omgeving = $g.Split("-")
    $omgeving = $omgeving[-1]
    $tags['Environment'] = $omgeving
    Get-azsubscription -SubscriptionName $g | Select-AzSubscription
    $rg = $resourcegroups[$g]
    New-AzResourceGroup -name $rg -Location "West Europe" -Tag $tags -Force
}