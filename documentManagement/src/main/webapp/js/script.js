$(document).ready(function () {

    // View Documents
    $('.btn-view').click(function () {
        var documentTitle = $(this).data('title');
        var documentSummary = $(this).data('summary');

        $('#viewModelTitle').text(documentTitle);
        $('#documentContent').text(documentSummary);
    });

    // Edit Documents
    $('.btn-edit').click(function () {
        var id = $(this).data('id');
        var title = $(this).data('title');
        var summary = $(this).data('summary');

        $('#documentEditModal').data('id', id);
        $('#editTitle').val(title);
        $('#editSummary').val(summary);
        $('#documentEditModal').modal('show');
    });

    // Save Edit Documents
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

    //Approve Document
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

    // Create Documents
    $('#create-document-button').click(function(event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của form

        // Lấy dữ liệu từ các trường input
        var title = $('#title').val();
        var summary = $('#summary').val();

        // Gửi AJAX request lên server
        $.ajax({
            type: 'POST',
            url: '/createDocument',
            data: {
                title: title,
                summary: summary
            },
            success: function(response) {
                // Hiển thị thông báo thành công
                alert("Bạn đã tạo thành công, vui lòng chờ phản hồi");

                // Đặt lại giá trị của các trường input về trạng thái mặc định
                $('#title').val('');
                $('#summary').val('');
            },
            error: function(xhr, status, error) {
                console.error('Lỗi:', error);
            }
        });
    });

    // Xử lý sự kiện click của nút "Cancel"
    $('#cancel-document-button').click(function() {
        // Đặt lại giá trị của các trường input về trạng thái mặc định
        $('#title').val('');
        $('#summary').val('');
    });

});


