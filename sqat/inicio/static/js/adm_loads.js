$(document).ready(function() {
  $('#id_metrica').on('change',function(){
    var id_metrica = $(this).val()
    $.ajax({
          method: 'GET',
          url: "/administrar/proyecto/fase/producto/metrica/asociacion",
          dataType: 'json',
          data : { id_metrica: id_metrica},
          success : function(response) {
              $('#msgForm').fadeOut();
              $('#msgForm').html(" ");
              if (response.success==true){
                $('#msgForm').fadeIn(500);
                $('#msgForm').html("Se <strong>agregarán</strong> las siguientes métricas relacionadas: <strong>"+response.metricas+'</strong>');
              }
              if (response.success==false){
                console.log('Sin métricas');
              }
          },
      });
  });
  $( ".delete_item" ).click(function() {
		//alert($(this).data("id")+$(this).data("type"));
		$.ajax({
	        method: 'POST',
	        url: "/item/delete/",
    	    dataType: 'json',
        	data : { id_registro: $(this).data("id"), case:$(this).data("type")},
        	success : function(json) {
        	    alert("requested access complete");
       	 	},
       	 	failure : function(json) {
        	    alert("requested access not complete");
       	 	},
    	});
	});
})