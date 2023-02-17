using Microsoft.AspNetCore.Mvc;
using RAYIN_DataAccess.Data;
using RAYIN_Models;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using RAYIN_Utility;
using RAYIN_DataAccess.Repository.IRepository;

namespace RAYIN.Controllers
{
    [Authorize(Roles = WC.AdminRole)]
    public class CategoryController : Controller
    {
        private readonly ICategoryRepository _catRepo;

        public CategoryController (ICategoryRepository catRepo)
        {
            _catRepo = catRepo;
        }
        public IActionResult Index()
        {
            IEnumerable<Category> objList = _catRepo.GetAll();
            return View(objList);
        }


        //Create-Get
        public IActionResult Create()
        {
            return View();
        }
        //Create-Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Category obj)
        {
            if (ModelState.IsValid)
            {
                _catRepo.Add(obj);
                _catRepo.Save();
                TempData[WC.Success] = "Action Completed Successfully";
                return RedirectToAction("Index");
            }
            TempData[WC.Error] = "ERROR!!! Action Can't Be Completed!!!";
            return View(obj);
        }
        //Edit - Get
        public IActionResult Edit(int? id)
        {
            if (id == null || id ==0)
            {
                return NotFound();
            }
            var obj = _catRepo.Find(id.GetValueOrDefault());
            if(obj == null)
            {
                return NotFound();
            }
            return View(obj);
        }
        //Edit - Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Category obj)
        {
            if (ModelState.IsValid)
            {
                _catRepo.Update(obj);
                _catRepo.Save();
                TempData[WC.Success] = "Action Completed Successfully";
                return RedirectToAction("Index");
            }
            TempData[WC.Error] = "ERROR!!! Action Can't Be Completed!!!";
            return View(obj);
        }
        //Delete - Get
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var obj = _catRepo.Find(id.GetValueOrDefault());
            if (obj == null)
            {
                return NotFound();
            }
            return View(obj);
        }
        //Delete - Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _catRepo.Find(id.GetValueOrDefault());
            if (obj == null)
            {
                TempData[WC.Error] = "ERROR!!! Action Can't Be Completed!!!";

                return NotFound();
            }
            _catRepo.Remove(obj);
            _catRepo.Save();
            TempData[WC.Success] = "Action Completed Successfully";

            return RedirectToAction("Index");            
        }

    }
}
