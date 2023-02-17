using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using RAYIN_DataAccess.Data;
using RAYIN_Models;
using RAYIN_Models.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using RAYIN_Utility;
using RAYIN_DataAccess.Repository.IRepository;

namespace RAYIN.Controllers
{
    [Authorize(Roles = WC.AdminRole)]
    public class ProductController : Controller
    {
        private readonly IProductRepository _prodRepo;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ProductController(IProductRepository prodRepo, IWebHostEnvironment webHostEnvironment)
        {
            _prodRepo = prodRepo;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            IEnumerable<Product> objList = _prodRepo.GetAll(includeProperties:("Category,ApplicationType"));
            //foreach (var item in objList)
            //{
            //    item.Category = _db.Category.FirstOrDefault(u => u.Id == item.CategoryId);
            //    item.ApplicationType = _db.ApplicationType.FirstOrDefault(u => u.Id == item.ApplicationTypeId);
            //}
            return View(objList);
        }


        //Upsert-Get
        public IActionResult Upsert(int? id)
        {
            //IEnumerable<SelectListItem> CategoryDropDown = _db.Category.Select(i => new SelectListItem
            //{
            //    Text = i.Name,
            //    Value = i.Id.ToString()
            //});
            //ViewData["CategoryDropDown"] = CategoryDropDown;
            //Product product = new Product();
            ProductVM productVM = new ProductVM()
            {
                Product = new Product(),
                CategorySelectList = _prodRepo.GetAllDropDownitems(WC.CategoryName),
                ApplicationTypeSelectList = _prodRepo.GetAllDropDownitems(WC.ApplicationTypeName)
            };

            if (id == null)
            {
                //this is for create
                return View(productVM);
            }
            else
            {
                productVM.Product = _prodRepo.Find(id.GetValueOrDefault());
                if (productVM.Product == null)
                {
                    return NotFound();
                }
                return View(productVM);
            }
        }
        //Upsert-Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Upsert(ProductVM productVM)
        {
            if (ModelState.IsValid)
            {
                var files = HttpContext.Request.Form.Files;
                string webRootPath = _webHostEnvironment.WebRootPath;
                if (productVM.Product.Id == 0)
                {
                    string upload = webRootPath + WC.ImagePath;
                    string fileName = Guid.NewGuid().ToString();
                    string extension = Path.GetExtension(files[0].FileName);
                    using (var fileStream = new FileStream(Path.Combine(upload, fileName + extension), FileMode.Create))
                    {
                        files[0].CopyTo(fileStream);
                    }
                    productVM.Product.Image = fileName + extension;
                    _prodRepo.Add(productVM.Product);
                }
                else
                {
                    //update
                    var objFromDb = _prodRepo.FirstOrDefault(u => u.Id == productVM.Product.Id, isTracking: false);
                    if (files.Count > 0)
                    {
                        string upload = webRootPath + WC.ImagePath;
                        string fileName = Guid.NewGuid().ToString();
                        string extension = Path.GetExtension(files[0].FileName);
                        var oldFile = Path.Combine(upload, objFromDb.Image);
                        if (System.IO.File.Exists(oldFile))
                        {
                            System.IO.File.Delete(oldFile);
                        }
                        using (var fileStream = new FileStream(Path.Combine(upload, fileName + extension), FileMode.Create))
                        {
                            files[0].CopyTo(fileStream);
                        }
                        productVM.Product.Image = fileName + extension;
                    }
                    else
                    {
                        productVM.Product.Image = objFromDb.Image;
                    }
                    _prodRepo.Update(productVM.Product);
                }
                TempData[WC.Success] = "Action Completed Successfully";

                _prodRepo.Save();

                return RedirectToAction("Index");
            }
            productVM.CategorySelectList = _prodRepo.GetAllDropDownitems(WC.CategoryName);
            productVM.ApplicationTypeSelectList = _prodRepo.GetAllDropDownitems(WC.ApplicationTypeName);
            return View();
        }

        //Delete - Get
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            Product product = _prodRepo.FirstOrDefault(u => u.Id == id, includeProperties: "Category,ApplicationType");
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        //Delete - Post
        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _prodRepo.Find(id.GetValueOrDefault());
            if (obj == null) return NotFound();
            string upload = _webHostEnvironment.WebRootPath+ WC.ImagePath;
            var oldFile = Path.Combine(upload, obj.Image);
            if (System.IO.File.Exists(oldFile))
            {
                System.IO.File.Delete(oldFile);
            }
            _prodRepo.Remove(obj);
            _prodRepo.Save();
            TempData[WC.Success] = "Action Completed Successfully";

            return RedirectToAction("Index");
        }
    }
}
