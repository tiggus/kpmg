function searcher {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $instanceId,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $datakey
    )
    # variables
    $output = 'json'
    $instanceRegion = 'us-east-2'

    # query metadata
    $metadata = aws ec2 describe-instances --instance-id $instancdId --region $instanceRegion --output $output
    # get datakey $searcher
    if ($datakey){
        $lookup = $metadata | ConvertFrom-Json
        $lookup | Select-Object {$_.Reservations.Instances.$datakey} | select-object -ExpandProperty *
    }
    else {
        if ($metadata) {$metadata}
    }
}

# returns the json metadata
searcher -instanceId i-123456789

# return the selected data key if exists
searcher -instanceId i-123456789 -datakey LaunchTimer