using Microsoft.AspNetCore.Mvc;
using ProjetoCopa.Models;
using System.Diagnostics;

namespace ProjetoCopa.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            List<Figurinha> listaDeFigurinhas = new List<Figurinha>();

            for(int i = 000; i<=027; i++)
            {
                Figurinha fig = new Figurinha();
                fig.Id = i;

                listaDeFigurinhas.Add(fig);
            }
            return View(listaDeFigurinhas);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
