$(document).ready(function () {
    $('.btn-view').click(function () {
        var documentTitle = $(this).data('title');
        var documentSummary = $(this).data('summary');

        $('#viewModelTitle').text(documentTitle);
        $('#documentContent').text(documentSummary);
    });

    $('.btn-edit').click(function () {
        var id = $(this).data('id');
        var title = $(this).data('title');
        var summary = $(this).data('summary');

        $('#documentEditModal').data('id', id);
        $('#editTitle').val(title);
        $('#editSummary').val(summary);
        $('#documentEditModal').modal('show');
    });

    $('#saveChangesBtn').click(function () {
        var id = $('#documentEditModal').data('id');
        var newTitle = $('#editTitle').val();
        var newSummary = $('#editSummary').val();

        $.ajax({
            type: "POST",
            url: "/updateDocument",
            data: {
                id: id,
                title: newTitle,
                summary: newSummary
            },
            success: function (response) {
                alert(response);
                location.reload();
            },
            error: function (xhr, status, error) {
                alert("Đã xảy ra lỗi: " + error);
            }
        });
    });

    $(function () {
        $("#example1").DataTable({
            "responsive": true,
            "lengthChange": false,
            "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $("#approveBtn").click(function () {
            confirm("Bạn có chắc chắn duyệt tài liệu này?");
        });
        $("#declineBtn").click(function () {
            // Hiển thị confirm dialog
            confirm("Bạn có chắc chắn từ chối tài liệu này?");
        });
    });
});


