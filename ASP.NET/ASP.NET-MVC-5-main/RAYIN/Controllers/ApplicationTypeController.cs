using Microsoft.AspNetCore.Mvc;
using RAYIN_DataAccess.Data;
using RAYIN_Models;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using RAYIN_Utility;
using RAYIN_DataAccess.Repository.IRepository;

namespace RAYIN.Controllers
{
    [Authorize(Roles = WC.AdminRole)]
    public class ApplicationTypeController : Controller
    {
        private readonly IApplicationTypeRepository _appTypeRepo;

        public ApplicationTypeController(IApplicationTypeRepository appTypeRepo)
        {
            _appTypeRepo = appTypeRepo;
        }
        public IActionResult Index()
        {
            IEnumerable<ApplicationType> objList = _appTypeRepo.GetAll();
            return View(objList);
        }
        // Create-get
        public IActionResult Create()
        {
            return View();
        }
        //Create-Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(ApplicationType obj)
        {
            if (ModelState.IsValid) 
            {
                _appTypeRepo.Add(obj);
                _appTypeRepo.Save();
                TempData[WC.Success] = "Action Completed Successfully";

                return RedirectToAction("Index");
            }
            TempData[WC.Error] = "ERROR!!! Action Can't Be Completed!!!";

            return View(obj);
        }

        //Edit - Get
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var obj = _appTypeRepo.Find(id.GetValueOrDefault());
            if (obj == null)
            {
                return NotFound();
            }
            return View(obj);
        }

        //Edit - Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(ApplicationType obj)
        {
            if (ModelState.IsValid)
            {
                _appTypeRepo.Update(obj);
                _appTypeRepo.Save();
                TempData[WC.Success] = "Action Completed Successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }

        //Delete - Get
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var obj = _appTypeRepo.Find(id.GetValueOrDefault());
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
            var obj = _appTypeRepo.Find(id.GetValueOrDefault());
            if (obj == null) return NotFound();
            _appTypeRepo.Remove(obj);
            _appTypeRepo.Save();
            TempData[WC.Success] = "Action Completed Successfully";

            return RedirectToAction("Index");            
        }
    }
}
