using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace Azure.Samples
{
    public static class AddEntry
    {
        [FunctionName("AddEntry")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = "Entry")] HttpRequest req,
            [Sql("app.Entry", "SqlConnectionString")] IAsyncCollector<Entry> newEntries,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            string newEntryText = data?.newEntry;

            Entry newEntry = new Entry();
            newEntry.TextEntry = newEntryText;
            newEntry.DateCreated = DateTime.Now;
            newEntry.DisableView = false;

            await newEntries.AddAsync(newEntry);

            return new OkObjectResult(newEntry);
        }
    }
}
