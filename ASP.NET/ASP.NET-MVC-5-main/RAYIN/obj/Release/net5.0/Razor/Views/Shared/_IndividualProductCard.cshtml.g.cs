#pragma checksum "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "9a0c3ff5185fdbeffb838117e541590b483ddf7c"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__IndividualProductCard), @"mvc.1.0.view", @"/Views/Shared/_IndividualProductCard.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\_ViewImports.cshtml"
using RAYIN;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\_ViewImports.cshtml"
using RAYIN_Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
using RAYIN_Utility;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"9a0c3ff5185fdbeffb838117e541590b483ddf7c", @"/Views/Shared/_IndividualProductCard.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"96c7602216eee107fa1e86a244c6441399bccf3c", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Shared__IndividualProductCard : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<RAYIN_Models.Product>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Details", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("btn btn-dark form-control btn-sm p-2"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("style", new global::Microsoft.AspNetCore.Html.HtmlString("height:40px"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n    <div");
            BeginWriteAttribute("class", " class=\"", 58, "\"", 133, 5);
            WriteAttributeValue("", 66, "col-lg-4", 66, 8, true);
            WriteAttributeValue(" ", 74, "col-md-6", 75, 9, true);
            WriteAttributeValue(" ", 83, "pb-4", 84, 5, true);
            WriteAttributeValue(" ", 88, "filter", 89, 7, true);
#nullable restore
#line 4 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
WriteAttributeValue(" ", 95, Model.Category.Name.Replace(' ','_'), 96, 37, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\n        <!-- Card-->\n        <div class=\"card bg-white rounded shadow-sm\" style=\"border:1px solid #222\">\n            <div class=\"card-body px-3 pt-3 pb-1 row\">\n                <div class=\"col-7\"><label class=\"float-left\">");
#nullable restore
#line 8 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                                                        Write(Model.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</label></div>\n                <div class=\"col-5\"><label class=\"float-right\"><span class=\"text-info h5\">");
#nullable restore
#line 9 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                                                                                    Write(string.Format("{0:c0}",Model.Price));

#line default
#line hidden
#nullable disable
            WriteLiteral("</span> / sqft</label> </div>\n            </div>\n            <img class=\"card-img-top img-fluid d-block mx-auto mb-3\"");
            BeginWriteAttribute("src", " src=\"", 625, "\"", 656, 2);
#nullable restore
#line 11 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
WriteAttributeValue("", 631, WC.ImagePath, 631, 13, false);

#line default
#line hidden
#nullable disable
#nullable restore
#line 11 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
WriteAttributeValue("", 644, Model.Image, 644, 12, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" alt=\"Card image cap\">\n            <div class=\"card-body p-1 px-3 row\">\n                <div class=\"col-6\">\n                    <span class=\"badge p-2 border w-100 text-dark\" style=\"background-color:lavenderblush\">");
#nullable restore
#line 14 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                                                                                                     Write(Model.Category.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\n                </div>\n                <div class=\"col-6 border-0\">\n                    <span class=\"badge p-2 border w-100 text-dark\" style=\"background-color:aliceblue\">");
#nullable restore
#line 17 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                                                                                                 Write(Model.ApplicationType.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>\n                </div>\n                <div class=\"col-12 pt-2\" style=\"font-size:13px; text-align:justify\">\n                    <p> ");
#nullable restore
#line 20 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                   Write(Model.shortDesc);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\n                </div>\n                <div class=\"col-12 p-1\">\n                    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "9a0c3ff5185fdbeffb838117e541590b483ddf7c8840", async() => {
                WriteLiteral("View Details");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 23 "C:\Users\riygupta\OneDrive - Capgemini\WORK-RIYA\Learning\ASP.NET\ASP.NET-MVC-5-main\RAYIN\Views\Shared\_IndividualProductCard.cshtml"
                                              WriteLiteral(Model.Id);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\n                </div>\n            </div>\n        </div>\n    </div>");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<RAYIN_Models.Product> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
