#pragma checksum "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "b65945c0eb5cc04225a94624254c8f0deba26a8d"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Restaurante_Create), @"mvc.1.0.view", @"/Views/Restaurante/Create.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Restaurante/Create.cshtml", typeof(AspNetCore.Views_Restaurante_Create))]
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
#line 1 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/_ViewImports.cshtml"
using Proj.Web;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b65945c0eb5cc04225a94624254c8f0deba26a8d", @"/Views/Restaurante/Create.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1e9cc475dedf69725ad704917a7b52ecccd00cef", @"/Views/_ViewImports.cshtml")]
    public class Views_Restaurante_Create : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Proj.Domain.Entities.Restaurante>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(40, 44, true);
            WriteLiteral("\n<h2 class=\"text-center\">Restaurantes</h2>\n\n");
            EndContext();
#line 5 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
 using (Html.BeginForm())
{
    

#line default
#line hidden
            BeginContext(117, 28, false);
#line 7 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
Write(Html.ValidationSummary(true));

#line default
#line hidden
            EndContext();
            BeginContext(156, 33, false);
#line 9 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
   Write(Html.HiddenFor(model => model.id));

#line default
#line hidden
            EndContext();
            BeginContext(191, 198, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                id\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(390, 90, false);
#line 16 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.id, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(480, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(534, 44, false);
#line 17 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.id));

#line default
#line hidden
            EndContext();
            BeginContext(578, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(622, 212, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Nome Restaurante\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(835, 92, false);
#line 26 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.nome, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(927, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(981, 46, false);
#line 27 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.nome));

#line default
#line hidden
            EndContext();
            BeginContext(1027, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(1071, 204, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Endereço\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(1276, 96, false);
#line 36 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.endereco, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(1372, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(1426, 50, false);
#line 37 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.endereco));

#line default
#line hidden
            EndContext();
            BeginContext(1476, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(1520, 202, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Estado\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(1723, 94, false);
#line 46 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.estado, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(1817, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(1871, 48, false);
#line 47 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.estado));

#line default
#line hidden
            EndContext();
            BeginContext(1919, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(1963, 202, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Cidade\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(2166, 94, false);
#line 56 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.cidade, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(2260, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(2314, 48, false);
#line 57 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.cidade));

#line default
#line hidden
            EndContext();
            BeginContext(2362, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(2406, 202, true);
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Numero\n            </div>\n            <div class=\"editor-field\">\n                ");
            EndContext();
            BeginContext(2609, 91, false);
#line 66 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.num, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
            EndContext();
            BeginContext(2700, 53, true);
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
            EndContext();
            BeginContext(2754, 45, false);
#line 67 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.num));

#line default
#line hidden
            EndContext();
            BeginContext(2799, 43, true);
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            EndContext();
            BeginContext(2843, 153, true);
            WriteLiteral("        <div class=\"d-block text-center\">\n            <button type=\"submit\" class=\"btn btn-primary d-block my-4 mx-auto\">Adicionar</button>\n\n            ");
            EndContext();
            BeginContext(2997, 93, false);
#line 74 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
       Write(Html.ActionLink("Voltar para listagem", "Index", null, null, new { @class = "mt-2 d-block" }));

#line default
#line hidden
            EndContext();
            BeginContext(3090, 16, true);
            WriteLiteral("\n        </div>\n");
            EndContext();
#line 76 "/Users/aldrinjr/ulbra/lpComercial/Aula17-ProjetoContaDeLuz-Test/Proj.Web/Views/Restaurante/Create.cshtml"
    }

#line default
#line hidden
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Proj.Domain.Entities.Restaurante> Html { get; private set; }
    }
}
#pragma warning restore 1591
