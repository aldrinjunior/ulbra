#pragma checksum "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/Home/Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "65786cf3aeaa071653bc03fb8bf69b79f506943f"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Home/Index.cshtml", typeof(AspNetCore.Views_Home_Index))]
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
#line 1 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/_ViewImports.cshtml"
using Aula04MVC;

#line default
#line hidden
#line 2 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/_ViewImports.cshtml"
using Aula04MVC.Models;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"65786cf3aeaa071653bc03fb8bf69b79f506943f", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"53c709dc1d70bba0b4957448b0522717fb93ddd4", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<Aula04MVC.Models.Conta>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(44, 99, true);
            WriteLiteral("\r\n<table class=\"table\">\r\n    <tr>    \r\n        <th>ID</th>\r\n        <th>Titular</th>\r\n    </tr>\r\n\r\n");
            EndContext();
#line 9 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/Home/Index.cshtml"
     foreach (var item in Model)
    {

#line default
#line hidden
            BeginContext(184, 30, true);
            WriteLiteral("        <tr>\r\n            <td>");
            EndContext();
            BeginContext(215, 7, false);
#line 12 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/Home/Index.cshtml"
           Write(item.id);

#line default
#line hidden
            EndContext();
            BeginContext(222, 23, true);
            WriteLiteral("</td>\r\n            <td>");
            EndContext();
            BeginContext(246, 12, false);
#line 13 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/Home/Index.cshtml"
           Write(item.titular);

#line default
#line hidden
            EndContext();
            BeginContext(258, 22, true);
            WriteLiteral("</td>\r\n        </tr>\r\n");
            EndContext();
#line 15 "/home/razor1911/ulbra/lpComercial/Aula04MVC/Views/Home/Index.cshtml"
    }

#line default
#line hidden
            BeginContext(287, 10, true);
            WriteLiteral("</table>\r\n");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<Aula04MVC.Models.Conta>> Html { get; private set; }
    }
}
#pragma warning restore 1591
