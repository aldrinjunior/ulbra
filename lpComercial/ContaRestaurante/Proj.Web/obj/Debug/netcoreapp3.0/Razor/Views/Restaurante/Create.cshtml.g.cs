#pragma checksum "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7a6f5ccea197ebbb66c3fe65d7c823acbaffea25"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Restaurante_Create), @"mvc.1.0.view", @"/Views/Restaurante/Create.cshtml")]
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
#line 1 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/_ViewImports.cshtml"
using ContaRestaurante;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/_ViewImports.cshtml"
using ContaRestaurante.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7a6f5ccea197ebbb66c3fe65d7c823acbaffea25", @"/Views/Restaurante/Create.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0ffab0c3120dd2d6e5d2b57166ff7bca16c73737", @"/Views/_ViewImports.cshtml")]
    public class Views_Restaurante_Create : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Proj.Domain.Entities.Restaurante>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n<h2 class=\"text-center\">Restaurantes</h2>\n\n");
#nullable restore
#line 5 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
 using (Html.BeginForm())
{
    

#line default
#line hidden
#nullable disable
#nullable restore
#line 7 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
Write(Html.ValidationSummary(true));

#line default
#line hidden
#nullable disable
#nullable restore
#line 9 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
   Write(Html.HiddenFor(model => model.id));

#line default
#line hidden
#nullable disable
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Id\n            </div>\n            <div class=\"editor-field\">\n                ");
#nullable restore
#line 16 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.id, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
#nullable restore
#line 17 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.id));

#line default
#line hidden
#nullable disable
            WriteLiteral("</small>\n            </div>\n        </div>\n");
            WriteLiteral("        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Nome\n            </div>\n            <div class=\"editor-field\">\n                ");
#nullable restore
#line 26 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.nome, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
#nullable restore
#line 27 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.nome));

#line default
#line hidden
#nullable disable
            WriteLiteral("</small>\n            </div>\n        </div>\n        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Endereço\n            </div>\n            <div class=\"editor-field\">\n                ");
#nullable restore
#line 35 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.endereco, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
#nullable restore
#line 36 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.endereco));

#line default
#line hidden
#nullable disable
            WriteLiteral("</small>\n            </div>\n        </div>\n        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Numero\n            </div>\n            <div class=\"editor-field\">\n                ");
#nullable restore
#line 44 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.numero, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
#nullable restore
#line 45 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.numero));

#line default
#line hidden
#nullable disable
            WriteLiteral("</small>\n            </div>\n        </div>\n        <div class=\"form-group col-12 col-sm-8 col-md-6 mx-auto\">\n            <div class=\"editor-label\">\n                Cidade\n            </div>\n            <div class=\"editor-field\">\n                ");
#nullable restore
#line 53 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
           Write(Html.EditorFor(model => model.cidade, new { htmlAttributes = new { @class = "form-control"} }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                <small class=\"form-text text-muted\">");
#nullable restore
#line 54 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
                                               Write(Html.ValidationMessageFor(model => model.cidade));

#line default
#line hidden
#nullable disable
            WriteLiteral("</small>\n            </div>\n        </div>\n        <div class=\"d-block text-center\">\n            <button type=\"submit\" class=\"btn btn-primary d-block my-4 mx-auto\">Adicionar</button>\n\n            ");
#nullable restore
#line 60 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
       Write(Html.ActionLink("Voltar para listagem", "Index", null, null, new { @class = "mt-2 d-block" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n        </div>\n");
#nullable restore
#line 62 "/Users/aldrinjr/ulbra/lpComercial/ContaRestaurante/Proj.Web/Views/Restaurante/Create.cshtml"
    }

#line default
#line hidden
#nullable disable
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
