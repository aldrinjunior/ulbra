#pragma checksum "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "49deea82ebf2d9db791de297b32d6c3ae670e4d0"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_People_Index), @"mvc.1.0.view", @"/Views/People/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/People/Index.cshtml", typeof(AspNetCore.Views_People_Index))]
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
#line 1 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/_ViewImports.cshtml"
using Aula07CrudPeopleEF;

#line default
#line hidden
#line 2 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/_ViewImports.cshtml"
using Aula07CrudPeopleEF.Models;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"49deea82ebf2d9db791de297b32d6c3ae670e4d0", @"/Views/People/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6d4f84981ceb731a43b64414d054b25cd61d8926", @"/Views/_ViewImports.cshtml")]
    public class Views_People_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<Aula07CrudPeopleEF.Models.Person>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(53, 373, true);
            WriteLiteral(@"    
</br></br>
<a href=""People/Create"" class=""btn btn-primary"">Nova Pessoa</a>
</br></br>

<div class=""container"">
    <table class=""table"">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Endereço</th>
                <th></th>
                <th></th>
            </tr>
            </tr>
        </thead>

");
            EndContext();
#line 20 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
         foreach(var item in Model)
        {

#line default
#line hidden
            BeginContext(472, 37, true);
            WriteLiteral("            <tr>\n                <td>");
            EndContext();
            BeginContext(510, 7, false);
#line 23 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
               Write(item.id);

#line default
#line hidden
            EndContext();
            BeginContext(517, 26, true);
            WriteLiteral("</td>\n                <td>");
            EndContext();
            BeginContext(544, 9, false);
#line 24 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
               Write(item.name);

#line default
#line hidden
            EndContext();
            BeginContext(553, 26, true);
            WriteLiteral("</td>\n                <td>");
            EndContext();
            BeginContext(580, 12, false);
#line 25 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
               Write(item.address);

#line default
#line hidden
            EndContext();
            BeginContext(592, 51, true);
            WriteLiteral("</td>\n                <td><a class=\"btn btn-danger\"");
            EndContext();
            BeginWriteAttribute("href", "\n                    href=\"", 643, "\"", 692, 2);
            WriteAttributeValue("", 670, "People/Delete/", 670, 14, true);
#line 27 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
WriteAttributeValue("", 684, item.id, 684, 8, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(693, 64, true);
            WriteLiteral(">Delete</a> </td>\n                <td><a class=\"btn btn-primary\"");
            EndContext();
            BeginWriteAttribute("href", " \n                    href=\"", 757, "\"", 805, 2);
            WriteAttributeValue("", 785, "People/Edit/", 785, 12, true);
#line 29 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
WriteAttributeValue("", 797, item.id, 797, 8, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(806, 36, true);
            WriteLiteral(">Editar</a> </td>\n            </tr>\n");
            EndContext();
#line 31 "/home/razor1911/ulbra/lpComercial/Aula07CrudPeopleEF/Views/People/Index.cshtml"
        }

#line default
#line hidden
            BeginContext(852, 19, true);
            WriteLiteral("    </table>\n</div>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<Aula07CrudPeopleEF.Models.Person>> Html { get; private set; }
    }
}
#pragma warning restore 1591
