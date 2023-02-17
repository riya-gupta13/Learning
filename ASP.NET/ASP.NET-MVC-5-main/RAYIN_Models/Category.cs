﻿using System.ComponentModel.DataAnnotations;

namespace RAYIN_Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; } 
        [Required]
        public string Name { get; set; }    

        [Required]
        [Range(1,int.MaxValue,ErrorMessage = "Display order must be greater than 0")]
        public int DisplayOrder { get; set; } 
    }
}
