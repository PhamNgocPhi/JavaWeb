$(".btnHuy").click(function () {
    var id = $(this).attr("data-id");
    $.ajax({
        url: "huyDangKy.html",
        type: "post",
        data: {id: id},
        beforSend: function () {
            //                    $(".img-detail").html('<p>waitting......</p>')
        },
        success: function (data) {
            $("#" + id).remove();
            $('.modal').modal('hide');
        }
    });
});