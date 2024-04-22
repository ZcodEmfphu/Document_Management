<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="admin-header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Create Document</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Create Document</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-outline card-info">
                    <div class="card-header">
                        <h3 class="card-title"> Văn bản </h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form id="my-form" action="/addDocument"  method="post"
                              style="display: flex; flex-direction: column">
                            <label for="title">Tiêu đề:</label>
                            <input type="text" id="title" name="title" required>
                            <label for="title">Nội dung:</label>
                            <textarea id="not-summernote" name="sumary" rows="4" cols="50" required></textarea>
                            <div class="d-flex justify-content-between my-3">
                                <div>
                                    <label for="dateStart">Ngay bắt đầu:</label>
                                    <input class="mr-3" type="date" id="dateStart" name="dateStart" required>
                                    <label for="dateEnd">Ngày kết thúc:</label>
                                    <input type="date" id="dateEnd" name="dateEnd">
                                </div>
                                <button type="submit"
                                        class="btn btn-primary"
                                        data-toggle="modal"
                                        data-target="#exampleModal"
                                        style="float:right;"
                                >
                                    Xác nhận
                                </button>
                            </div>
                        </form>

                    </div>
                    <div class="card-footer"> hướng dẫn sử dụng =))</div>
                </div>
            </div>
            <!-- /.col-->
        </div>
        <!-- ./row -->
    </section>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Bạn có chắc muốn tạo tài liệu?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>
                    <button type="submit" form="my-form" value="Submit document" class="btn btn-primary">Tạo</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
        <b>DACNPM</b>
    </div>
    <strong>Copyright &copy; 2024 Chinhphu.vn.</strong> All rights reserved.
</footer>
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<!-- CodeMirror -->
<script src="../plugins/codemirror/codemirror.js"></script>
<script src="../plugins/codemirror/mode/css/css.js"></script>
<script src="../plugins/codemirror/mode/xml/xml.js"></script>
<script src="../plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    $(function () {
        // Summernote
        $('#summernote').summernote()
        // CodeMirror
        CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
            mode: "htmlmixed",
            theme: "monokai"
        });
    })
</script>
</body>
</html>