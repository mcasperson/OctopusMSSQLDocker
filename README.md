An image based on microsoft/mssql-server-windows-express that creates a new database called Octopus from the files `C:\OctopusDB\octopus.mdf` and `C:\OctopusDB\octopus_log.ldf`.

If `C:\OctopusDB` is mounted to a volume, this database can be persisted.

```
docker run -d -p 1433:1433 -e sa_password=Password01 -e ACCEPT_EULA=Y -v C:/OctopusDB/:C:/OctopusDB/ mcasperson/octopus-mssql-server-windows-express
```