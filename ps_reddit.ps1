$sub = "powershell"
[array]$Index=(1..3)
$WC = New-Object net.webclient
$global:SubStorage = $WC.Downloadstring("http://www.reddit.com/r/$sub/.json") | ConvertFrom-json

[array]::Reverse($Index)

$Index | ForEach-Object {

    $ix = $_ - 1
    $url = $null
    $url = $SubStorage.data.children.Item($ix).data.url
    "`n_ $_ ______________________________________________________"
    "title-------- " + $SubStorage.data.children.Item($ix).data.title
    "url---------- " + $url
    "PermaLink---- www.reddit.com" + $SubStorage.data.children.Item($ix).data.permalink
    "score-------- " + $SubStorage.data.children.Item($ix).data.score
    "ups---------- " + $SubStorage.data.children.Item($ix).data.ups
    "downs-------- " + $SubStorage.data.children.Item($ix).data.downs
    "author------- " + $SubStorage.data.children.Item($ix).data.author
    "Num_Comments- " + $SubStorage.data.children.Item($ix).data.num_comments

}