using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace Azure.Samples
{
    public static class GetEntries
    {
        [FunctionName("GetEntries")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "Entry")] HttpRequest req,
            [Sql("SELECT TOP 10 [Id], [DisableView], [TextEntry], [DateCreated] FROM app.Entry WHERE [DisableView]= 0 ORDER BY [Id] DESC", "SqlConnectionString")] IEnumerable<Entry> entries,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            return new OkObjectResult(entries);
        }
    }
}
