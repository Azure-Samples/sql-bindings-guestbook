using System;

namespace Azure.Samples
{
    public class Entry
    {
        public int Id { get; set; }
        public bool DisableView { get; set; }
        public string TextEntry { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateModerated { get; set; }
    }
}