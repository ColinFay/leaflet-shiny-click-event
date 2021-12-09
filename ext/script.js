$(document).ready(function() {
    Shiny.addCustomMessageHandler('bindleaflet', function(arg) {
        $("#" + arg).find("path").remove();
        wait_for_path(arg);
    })
});

var wait_for_path = function(id) {
    if ($("#" + id).find("path").length !== 0) {
        $("#" + id).find(".leaflet-interactive").on("click", function(x) {
            alert("hey")
        })
    } else {
        setTimeout(function() {
            wait_for_path(id);
        }, 500);
    }
}
