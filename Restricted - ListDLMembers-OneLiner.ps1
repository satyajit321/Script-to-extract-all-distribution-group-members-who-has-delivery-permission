#Extract the data, DL filtered
Get-DistributionGroup -ResultSize Unlimited -filter {AcceptMessagesOnlyFromDLMembers -ne $null} | select-object Name,@{Name="AcceptMessagesOnlyFromDLMembers";Expression={[string]::join(";",($_.AcceptMessagesOnlyFromDLMembers| foreach {$_.name}) )}} | Export-Csv RestrictedDLAllowedListDL.csv

#All DL+Users
Get-DistributionGroup -ResultSize Unlimited | ?{$_.AcceptMessagesOnlyFromSendersOrMembers -ne $null} | select-object Name,@{Name="AcceptMessagesOnlyFromDLMembers";Expression={[string]::join(";",($_.AcceptMessagesOnlyFromSendersOrMembers| %{$_.Name}) )}}  | Export-Csv RestrictedDLAllowedListAll.csv


#List out the result back on screen
Import-Csv .\RestrictedDLAllowedList.csv
Import-Csv .\RestrictedDLAllowedListAll.csv
