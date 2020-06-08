# variables
$instancdId = 'i-01d2347c1b32ae075'
$searcher = 'LaunchTime'
$output = 'json'
$instanceRegion = 'us-east-2'

# query metadata
$metadata = aws ec2 describe-instances --instance-id $instancdId --region $instanceRegion --output $output

# get datakey $searcher
if ($searcher){
    $lookup = $metadata | ConvertFrom-Json
    $lookup | Select-Object {$_.Reservations.Instances.$searcher} | select-object -ExpandProperty *
}