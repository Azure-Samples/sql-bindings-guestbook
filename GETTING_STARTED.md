# Getting started with this sample for development and testing

Begin by cloning this repository to your machine and opening the folder in Visual Studio Code.

```bash
git clone https://github.com/Azure-Samples/sql-bindings-guestbook.git
cd sql-bindings-guestbook
code .
```


## 1. Local database

Option 1: From the [SQL Database Projects extension](https://learn.microsoft.com/sql/azure-data-studio/sql-database-projects) in VS Code, publish the **guestbook** SQL project to a new Azure SQL Database emulator.  More information about local development for Azure SQL Database is available at https://aka.ms/azuredbemulator.

Option 2: If you have a local SQL Server instance such as a the container `mcr.microsoft.com/mssql/server:latest`, you can publish the **guestbook** SQL project to a new database on that instance using one of the following:
- **[SqlPackage command line tool](https://aka.ms/sqlpackage-ref)** - run the following command from the **sql** folder in the repository:
    ```bash
    dotnet build
    sqlpackage /a:Publish /tsn:localhost /tdn:guestbook /tu:sa /tp:yourStrong(!)Password /ttsc:true /sf:bin/Debug/guestbook.dacpac /p:AllowIncompatiblePlatform=true
    ```
- **[SQL Database Projects extension](https://learn.microsoft.com/sql/azure-data-studio/sql-database-projects) in VS Code** - in the Database Projects pane in VS Code, right-click on the **guestbook** project and select **Publish**.  Select **SQL Server** as the target and enter the connection string for your local SQL Server instance.

- **[SQL Server Data Tools](https://docs.microsoft.com/sql/ssdt/download-sql-server-data-tools-ssdt) in Visual Studio** - open the **guestbook.sqlproj** file in Visual Studio and publish the project to a new database on your local SQL Server instance.

*Note: you will need to update the target platform for the **guestbook** SQL project to match your local SQL Server instance if you are not publishing from the SqlPackage command line tool.  For example, if you are using the container `mcr.microsoft.com/mssql/server:latest`, you will need to change the target platform to `SQL Server 2022`.*


## 2. Local Azure Functions

After installing the [Azure Functions Core Tools](https://docs.microsoft.com/azure/azure-functions/functions-run-local#install-the-azure-functions-core-tools), you can run the Azure Functions locally for testing and development.  JavaScript Azure Functions will [require Node.js](https://learn.microsoft.com/azure/azure-functions/create-first-function-vs-code-node#configure-your-environment) to be installed and C# Azure Functions will [require .NET Core](https://learn.microsoft.com/azure/azure-functions/create-first-function-vs-code-csharp?tabs=in-process#configure-your-environment) to be installed.

### JavaScript Azure Functions

We need to add a local development settings file to the **apis/js-api** folder.  Copy the file **apis/js-api/local.settings.json.example** to **apis/js-api/local.settings.json** and update the `SqlConnectionString` value to match your local SQL Server instance.

To run the NodeJS Azure Function locally, open a terminal in the **apis/js-api** folder and run the following command:

```bash
func start
```
This starts Azure Functions Core Tools on the default port (7071) and makes the API endpoints used to read and write to the database available at http://localhost:7071/api.

### C# Azure Functions

We need to add a local development settings file to the **apis/net-api** folder.  Copy the file **apis/net-api/local.settings.json.example** to **apis/net-api/local.settings.json** and update the `SqlConnectionString` value to match your local SQL Server instance.

The C# Azure Function example provided also requires an Azure Content Moderator instance, which you can create at https://portal.azure.com/#create/Microsoft.CognitiveServicesContentModerator with the free pricing tier (`F0`).  Once you have created an instance, update the `ModeratorEndpoint` and `ModeratorKey` values in the **apis/net-api/local.settings.json** file.

To run the C# Azure Function locally, open a terminal in the **apis/net-api** folder and run the following command:

```bash
func start --dotnet --port 7072
```
This starts Azure Functions Core Tools on port 7072 and the Azure Function with the SQL trigger is now watching the `app.Entry` table for changes.

## 3. Azure Static Web App

### Build

To build the Azure Static Web App, open a terminal in the **guestbook** folder and run the following command:

```bash
npm install
npm run build
```

### Run locally

The Azure Static Web Apps CLI provides a local development environment for testing and debugging the Azure Static Web App.  [Install the CLI](https://github.com/Azure/static-web-apps-cli) as it will provide the local static server and a proxy to the JavaScript Azure Functions.

Start the Azure Static Web Apps local runtime with the following command at the terminal:

```bash
swa start ./build --api-location http://127.0.0.1:7071
```
The build folder is the output from our frontend web interface.  The API location is the URL for our local Azure Functions runtime with the JavaScript Azure Functions.

## 4. 🎉

You can now visit and test your site at http://localhost:4280