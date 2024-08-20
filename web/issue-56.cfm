<!--
https://github.com/softwareCobbler/luceedebug/issues/56##issuecomment-2282299372
-->
<cfscript>
writeOutput("before 0+0;<br>");
0+0;
writeOutput("after");
</cfscript>
