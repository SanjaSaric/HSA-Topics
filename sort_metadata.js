$(document).ready(function () {
//////////////////////////////////// Filter für ID //////////////////////////////////// 
    $("#searchFilter_id").parent('th').parent('tr').nextAll().find('.id').css('color', 'red'); //Text von ID rot färben//   
      $("#searchFilter_id").on("keyup", function () {
        var value = $(this).val().toLowerCase(); //Alle Buchstaben des Inputs aus dem Filterfenster klein setzen = Variable value //
         $(this).parent('th').parent('tr').nextAll().filter(function () { 
            $(this).toggle($(this).find('.id').text().toLowerCase().indexOf(value) > -1) //Vergleiche jeden Tabelleneintrag mit dem Wert der Variable value//
        });         
    });
//////////////////////////////////// Filter für AbsenderIn ////////////////////////////////////        
   $("#searchFilter_sender").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.sender').text().toLowerCase().indexOf(value) > -1)
        });         
    });
//////////////////////////////////// Filter für EmpfängerIn ////////////////////////////////////     
    $("#searchFilter_reciever").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.reciever').text().toLowerCase().indexOf(value) > -1)
        });         
    });
//////////////////////////////////// Filter für Datum ////////////////////////////////////     
    $("#searchFilter_date").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.date').text().toLowerCase().indexOf(value) > -1)
        });          
    });
//////////////////////////////////// Filter für Orte ////////////////////////////////////     
     $("#searchFilter_place").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.place').text().toLowerCase().indexOf(value) > -1)
        });          
    });
//////////////////////////////////// Filter für Sprachen ////////////////////////////////////      
      $("#searchFilter_language").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.language').text().toLowerCase().indexOf(value) > -1)
        });          
    });
//////////////////////////////////// Filter für Absendetypen ////////////////////////////////////      
     $("#searchFilter_type").on("keyup", function () {
        var value = $(this).val().toLowerCase();
         $(this).parent('th').parent('tr').nextAll().filter(function () {
            $(this).toggle($(this).find('.type').text().toLowerCase().indexOf(value) > -1)
        });          
    });
//////////////////////////////////// Alle Tabellenreihen zählen ////////////////////////////////////         
    var n = $( "tr" ).length - 1;
    $("#count").text( "Anzahl der Einträge " + n );
//////////////////////////////////// Gefilterte Tabellenreihen zählen ////////////////////////////////////   
    $("button").click(function(){
    var m = $( "tr:not([style*='display: none'])").length - 1; 
    $("#result").text(m);
  });    
});