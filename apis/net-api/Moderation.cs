using System;
using Microsoft.Azure.CognitiveServices.ContentModerator.Models;
using Newtonsoft.Json;

namespace Azure.Samples
{
    public class Moderation
    {
        public int Id { get; set; }
        public double? Category1 { get; set; }
        public double? Category2 { get; set; }
        public double? Category3 { get; set; }
        public Boolean? ReviewRecommended { get; set; }
        public string ProfaneTerms { get; set; }

        public Moderation(int Id, Screen contentScreen)
        {
            this.Id = Id;
            if (contentScreen.Classification != null)
            {
                this.Category1 = contentScreen.Classification.Category1.Score;
                this.Category2 = contentScreen.Classification.Category2.Score;
                this.Category3 = contentScreen.Classification.Category3.Score;
                this.ReviewRecommended = contentScreen.Classification.ReviewRecommended;
            }

            if (contentScreen.Terms != null && contentScreen.Terms.Count > 0)
            {
                this.ProfaneTerms = JsonConvert.SerializeObject(contentScreen.Terms);
            }
            else
            {
                this.ProfaneTerms = null;
            }
        }
    }
}