#teste job
clear
WorkFlow workflowDemorado
{
while(1)
    {(get-date).ToString()+ "script demoradinho"
    Start-Sleep 2
    }
}

$wfjob = workflowDemorado -AsJob
$wfjob

Receive-job $wfjob