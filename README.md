---
page_type: sample
languages:
- tsql
- sql
- csharp
- javascript
- powershell
products:
- azure
- azure-sql-database
- dotnet-core
- azure-functions
- azure-static-web-apps
description: "Geocoding sample for Azure SQL DB with Azure Functions"
urlFragment: "azure-sql-functions-geocode"
---

# SQL bindings guestbook demo

![License](https://img.shields.io/badge/license-MIT-green.svg)

<!-- 
Guidelines on README format: https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

Guidance on onboarding samples to docs.microsoft.com/samples: https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

Taxonomies for products and languages: https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master
-->

A sample web application where users can leave a message and view recent messages.  After entry, messages are send to content moderation. Watch a walkthrough of this sample at [https://www.youtube.com/watch?v=01nhp4OAk0c](https://www.youtube.com/watch?v=01nhp4OAk0c).

![guestbook screenshot](images/guestbook.png)

## Components
- Azure SQL Database
- .NET Azure Functions
  - SQL trigger
  - SQL output binding
- .NET Azure Functions
  - SQL output binding
  - SQL input binding
- Azure Static Web App
- Azure Content Moderation
 
## Contents

| File/folder       | Description                                |
|-------------------|--------------------------------------------|
| `.github/workflows`       | GitHub Actions workflows for the sample to deploy the Functions, the Azure Static Web App, and the SQL project. |
| `apis/web-api`            | .NET Azure Functions that serve the Azure Static Web App data. |
| `apis/net-api`           | .NET Azure Function that moderates new guestbook entries. |
| `guestbook`              | Azure Static Web App that serves the guestbook UI through a React app. |
| `sql`                    | SQL project that contains the database objects (tables, stored procedures). |
 
## Architecture

[![Data Exposed episode](https://img.youtube.com/vi/01nhp4OAk0c/0.jpg)](https://www.youtube.com/watch?v=01nhp4OAk0c)

- [Azure Static Web App](guestbook/)
  - input form for adding guestbook entries
  - list of guestbook entries
  - calls to the .NET Azure Functions (web-api)
- [.NET Azure Functions](apis/web-api/)
  - lists some entries from the app.Entry table (SQL input binding)
  - add guestbook entry for to app.Entry table (SQL output binding)
- [.NET Azure Function](apis/net-api/)
  - SQL trigger on changes in app.Entry table
  - sends newly inserted rows to Azure Content Moderation
  - SQL output binding writes moderation results to app.Moderation table
  - SQL output binding updates to app.Entry table

![architecture diagram](images/architecture.png)

## What are SQL bindings?

![summary slide on SQL bindings](images/sqlbindings-summary.png)

Learn more at [https://aka.ms/sqlbindings](https://aka.ms/sqlbindings).

- Azure Functions can authenticate to Azure SQL Database with Azure AD Managed Identity
- Configure SQL bindings with a connection string and T-SQL query, stored procedure name, or table name
- SQL bindings are currently in preview for .NET, JavaScript, Python, PowerShell, and Java Azure Functions
- SQL trigger is currently in preview for .NET Azure Functions

## Getting started with the guestbook sample

Instructions are available for setup of local development of this sample in [GETTING_STARTED.md](GETTING_STARTED.md).