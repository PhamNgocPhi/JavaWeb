$(".btnDangKyHoc").click(function () {
    var id = $(this).attr("data-id");
    $.ajax({
        url: "dang-ky-hoc/loadModal.html",
        type: "get",
        data: {id: id},
        dataType: "html",
        beforSend: function () {
            //                    $(".img-detail").html('<p>waitting......</p>')
        },
        success: function (html) {
            $("#modalData").html(html);
        }
    });
});

