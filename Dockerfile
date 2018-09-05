FROM microsoft/mssql-server-windows-express
COPY octopus.mdf C:/OctopusDBInit/
COPY octopus_log.ldf C:/OctopusDBInit/
RUN mkdir C:\OctopusDB
COPY initdb.ps1 /
CMD .\initdb; .\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \""[{'dbName':'Octopus','dbFiles':['C:\\OctopusDB\\octopus.mdf','C:\\OctopusDB\\octopus_log.ldf']}]"\" -Verbose