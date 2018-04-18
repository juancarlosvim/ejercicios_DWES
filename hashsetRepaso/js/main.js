$(document).ready(() => {
    //$("#lvEtiquetasOriginales_div").on("click", "span", () => {
    //    $("#lvEtiquetasSeleccionadas_div").append($(this));
    //});
    $("#lvEtiquetasOriginales_div").on("click", "span", function () {
        $("#lvEtiquetasSeleccionadas_div").append($(this));
    });
    $("#lvEtiquetasSeleccionadas_div").on("click", "span", function () {
        $("#lvEtiquetasOriginales_div").append($(this));
    });
    $("#form1").submit(function () {
        if ($("#lvEtiquetasSeleccionadas_div span").length !== 0) {
            let elegidos = ":";
            $("#lvEtiquetasSeleccionadas_div span").each(function () {
                elegidos += $(this).text().trim() + ":";

            });
           
            console.log(elegidos)
            $("<input>").attr("type", "hidden")
               .attr("name", "datos")
               .attr("value", elegidos)
               .appendTo("#form1");
            return true
        }
        return false
    })
});