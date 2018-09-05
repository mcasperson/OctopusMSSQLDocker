if (!$(Test-Path C:\OctopusDB\octopus.mdf)) {
    cp C:\OctopusDBInit\octopus.mdf C:\OctopusDB\octopus.mdf
}

if (!$(Test-Path C:\OctopusDB\octopus_log.ldf)) {
    cp C:\OctopusDBInit\octopus_log.ldf C:\OctopusDB\octopus_log.ldf
}