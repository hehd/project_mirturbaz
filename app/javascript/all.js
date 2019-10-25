jQuery(function ($) {

    $(".deleteAction").click( function () {
        var current_line_tr = $(this).parents('tr')[0];
        if(confirm("Точно удалить?")) {
            $.ajax({
                url: $(current_line_tr).attr('data-path'),
                type: 'POST',
                data: { _method: 'DELETE' },
                success: function (result) {
                    $(current_line_tr).fadeOut(200);
                    console.log(result);
                }
            });
        };
    });

});