$(document).ready(function() {
    $(document).on('change', '.observaciones-accion', function(){
        var id_accion = $(this).data('id');
        var observaciones =  $(this).val();
        $.ajax({
            method : "GET",
            url : "/evaluar/producto/metricas/accioncorrectiva/observacion",
            data : { id_accion: id_accion, observaciones:observaciones},
            failure : function(response) {
                alert("Ocurrio un error al actualizar los datos.");
          },
        });
    });
    $('#add_action').on('click',function(){
        $('#modal-content').html('<img class="add_button" src="/static/images/loading.gif">');
        $('#modal').fadeIn(200);
        var id_metrica = $(this).data('id');
        $.ajax({
            method :"GET",
            url : "/evaluar/producto/metricas/accioncorrectiva/agregar",
            data:{ id_metrica: id_metrica},
            success : function(response) {
                html = $.parseHTML(response);
                $('#modal-content').html(html);
                $('#exampleModalLong').fadeOut();
                console.log(html);
          },
        });
    });
    $('.modal-window-action').on('click', function () {
        var id_metrica = $(this).data('id');
        $('#modal-body').html('<img class="add_button" src="/static/images/loading.gif" %}">');
        $.ajax({
            method : "GET",
          url : "/evaluar/producto/metricas/accionescorrectivas/",
          data : { id_metrica: id_metrica},
          success : function(response) {
                $('#modal-body').html(response);
                $('#add_action').data('id',id_metrica);
          },
        });

    });
    $('.modalwindow').on('click',function(){
        $('#modal').fadeIn(200);
        return false;
    });

    $('.modalbackground, .close-modal').on('click',function(){
        $('#modal').fadeOut(200);
        $('#exampleModalLong').fadeIn(100);
    });

    $(document).on('submit', '#acctionForm', function(){
        var id_metrica = $('#id_metrica_de_producto').val();
        var id_responsable = $('#id_responsable').val();
        var day_limit = $('#id_fecha_limite_day').val();
        var month_limit = $('#id_fecha_limite_month').val();
        var year_limit = $('#id_fecha_limite_year').val();
        var fecha_limite = year_limit+"-"+month_limit+"-"+day_limit;
        var accion = $('#id_accion').val();
        var r = confirm('Confirma insertar la accion "'+accion+'"?, una vez insertada no se podrá eliminar.');
        if (r == true) {
            $.ajax({
                method :'GET',
                url : '/evaluar/accion/insert/',
                data : {id_metrica: id_metrica, accion: accion,id_responsable:id_responsable, fecha_limite:fecha_limite},
                success : function(data){
                    if (data.success){
                        $.ajax({
                            method : "get",
				            url : "/evaluar/producto/metricas/accionescorrectivas/",
				            data : { id_metrica: id_metrica},
				            success : function(response) {
                                $('#modal-body').html(response);
                                $('#add_action').data('id',id_metrica);
                                $('#modal').fadeOut();
                                $('#exampleModalLong').fadeIn(100);
				            },
                            failure : function (argument) {
                                console.log(argument);
                            }
				        });
                    }else{
                        console.log(data)
                        form.parent().find('span').html('Ocurrio un error intenta más tarde.');
                    }
                },
                failure : function (argument) {
                    console.log(argument);
                }
            });
        }
        return false;
    });
    $('#item_update_form').on('submit',function(){
        var form = $(this);
        var id_metrica = form.find('input[name="metrica"]').val();
        var value = form.find('input[name="dato"]').val();
        var r = confirm('Confirma insertar el valor de '+value+' en el historial?');
        if (r == true) {
            $.get(
                '/evaluar/metrica/update/',
                {id_metrica: id_metrica, value: value},
                function(data){
                    if (data.success){
                        form.parent().fadeOut();
                        location.reload();
                    }else{
                        form.parent().find('div[name="message"]').html('<span style="color:red;">Ocurrio un error intenta más tarde.</span>');
                    }
                }
            );
        }
        return false;
    });

    $('.check_criteria').click(function(){
        var id_criterio = $(this).data('id');
        var value = $(this).is(':checked');
        $.get(
            '/evaluar/criterio/update/',
            {id_criterio: id_criterio, value: value},
            function(data){
                 console.log(data);
            }
        );
    });
});