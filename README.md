An image based on microsoft/mssql-server-windows-express that creates a new database called Octopus from the files `C:\OctopusDB\octopus.mdf` and `C:\OctopusDB\octopus_log.ldf`.

If `C:\OctopusDB` is mounted to a volume, this database can be persisted.

```powershell
# Run the SQL Server
docker run -d `
  --publish "1444:1433" `
  -e sa_password=Password01 `
  -e ACCEPT_EULA=Y `
  -v C:/OctopusDB/:C:/OctopusDB/ `
  mcasperson/octopus-mssql-server-windows-express
# Get the SQL Server IP address
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
# Run the Octopus Server
docker run --interactive --detach `
 --name OctopusServer `
 --publish "1322:81" `
 --env sqlDbConnectionString="Server=host.docker.internal,1444;Initial Catalog=Octopus;Persist Security Info=False;User ID=sa;Password=Password01;MultipleActiveResultSets=False;Connection Timeout=30;" `
 --volume "E:/Octopus/Logs:C:/TaskLogs" `
 octopusdeploy/octopusdeploy:2018.8.2
```