<h3>Script to extract all distribution group members who has delivery permission to send email to distribution group.</h3>
<p><span>Basically this&nbsp;one-liner script allows you to get AcceptMessagesOnlyFromDLMembers property for all Distribution groups which has delivery restriction enabled.</span></p>
<p>You should see a list of addresses delimited by semicolon in the AcceptMessagesOnlyFromDLMembers&nbsp;column:<br /> <br /></p>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">Get-DistributionGroup -ResultSize Unlimited -filter {AcceptMessagesOnlyFromDLMembers -ne $null} | select
 -object Name,@{Name="AcceptMessagesOnlyFromDLMembers";Expression={[string]::join(";",($_.AcceptMessagesOnlyFromDLMembers| foreach {$_.name
 }) )}}


Name            AcceptMessagesOnlyFromDLMembers
----            -------------------------------
TestGroupSatya  TestGroupSatya2;TestGroupSatya</pre>
<div class="preview">
<pre class="powershell">Get<span class="powerShell__operator">-</span>DistributionGroup&nbsp;<span class="powerShell__operator">-</span>ResultSize&nbsp;Unlimited&nbsp;<span class="powerShell__operator">-</span><span class="powerShell__keyword">filter</span>&nbsp;{AcceptMessagesOnlyFromDLMembers&nbsp;<span class="powerShell__operator">-</span>ne&nbsp;<span class="powerShell__variable">$null</span>}&nbsp;<span class="powerShell__operator">|</span>&nbsp;<span class="powerShell__alias">select</span>&nbsp;
&nbsp;<span class="powerShell__operator">-</span>object&nbsp;Name,@{Name=<span class="powerShell__string">"AcceptMessagesOnlyFromDLMembers"</span>;Expression={[string]::join(<span class="powerShell__string">";"</span>,(<span class="powerShell__variable">$_</span>.AcceptMessagesOnlyFromDLMembers<span class="powerShell__operator">|</span>&nbsp;<span class="powerShell__keyword">foreach</span>&nbsp;{<span class="powerShell__variable">$_</span>.name&nbsp;
&nbsp;})&nbsp;)}}&nbsp;
&nbsp;
&nbsp;
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AcceptMessagesOnlyFromDLMembers&nbsp;
<span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span>&nbsp;
TestGroupSatya&nbsp;&nbsp;TestGroupSatya2;TestGroupSatya</pre>
</div>
</div>
</div>
<div class="endscriptcode"></div>
<p>&nbsp;This is as per the Forum query "<span>Cmdlet to get AcceptMessagesOnlyFrom property for Distribution groups":</span></p>
<p><a href="https://social.technet.microsoft.com/Forums/scriptcenter/en-US/6b5fbd76-8c9a-4d41-b291-9496ba9626e0/cmdlet-to-get-acceptmessagesonlyfrom-property-for-distribution-groups?forum=ITCG">https://social.technet.microsoft.com/Forums/scriptcenter/en-US/6b5fbd76-8c9a-4d41-b291-9496ba9626e0/cmdlet-to-get-acceptmessagesonlyfrom-property-for-distribution-groups?forum=ITCG</a></p>
<p>&nbsp;</p>
<p>Update:9Oct2015</p>
<p>Earlier cmdlet was missing out users and only listed DLs in the list. This list all, but is slighly slower due to usage of Where ?{}.</p>
<p>&nbsp;</p>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">Get-DistributionGroup -ResultSize Unlimited | ?{$_.AcceptMessagesOnlyFromSendersOrMembers -ne $null} | select-object Name,@{Name="AcceptMessagesOnlyFromSendersOrMembers";Expression={[string]::join(";",($_.AcceptMessagesOnlyFromSendersOrMembers| %{$_.Name}) )}}

Name                    AcceptMessagesOnlyFromSendersOrMembers  
----                    -------------------------------
TestGroupSatya          SatyaTEST1;Satyajit;TestGroupSatya2;TestGroupSatya</pre>
<div class="preview">
<pre class="powershell">Get<span class="powerShell__operator">-</span>DistributionGroup&nbsp;<span class="powerShell__operator">-</span>ResultSize&nbsp;Unlimited&nbsp;<span class="powerShell__operator">|</span>&nbsp;?{<span class="powerShell__variable">$_</span>.AcceptMessagesOnlyFromSendersOrMembers&nbsp;<span class="powerShell__operator">-</span>ne&nbsp;<span class="powerShell__variable">$null</span>}&nbsp;<span class="powerShell__operator">|</span>&nbsp;<span class="powerShell__cmdlets">select-object</span>&nbsp;Name,@{Name=<span class="powerShell__string">"AcceptMessagesOnlyFromSendersOrMembers"</span>;Expression={[string]::join(<span class="powerShell__string">";"</span>,(<span class="powerShell__variable">$_</span>.AcceptMessagesOnlyFromSendersOrMembers<span class="powerShell__operator">|</span>&nbsp;%{<span class="powerShell__variable">$_</span>.Name})&nbsp;)}}&nbsp;
&nbsp;
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AcceptMessagesOnlyFromSendersOrMembers&nbsp;&nbsp;&nbsp;
<span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span><span class="powerShell__operator">-</span>&nbsp;
TestGroupSatya&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SatyaTEST1;Satyajit;TestGroupSatya2;TestGroupSatya</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
<p>Attached is the script that does both,stores the output in csv files&nbsp;and shows you the output on screen.</p>
<p>&nbsp;</p>
<p><a id="143481" href="/scriptcenter/Script-to-extract-all-bd987395/file/143481/1/RestrictedDLAllowedListDL.csv">RestrictedDLAllowedListDL.csv</a></p>
<p><a id="143485" href="/scriptcenter/Script-to-extract-all-bd987395/file/143485/1/RestrictedDLAllowedListAll.csv">RestrictedDLAllowedListAll.csv</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>You can find the more detailed result script here. It covers the users and listing of the DL members as well.</p>
<p>List Allowed Senders from all Restricted Distribution List:</p>
<p><a href="https://gallery.technet.microsoft.com/List-Allowed-Senders-from-99b71c6a">https://gallery.technet.microsoft.com/List-Allowed-Senders-from-99b71c6a</a></p>
