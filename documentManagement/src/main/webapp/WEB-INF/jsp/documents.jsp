<%@ page import="com.boot.music.entity.Document" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="admin-header.jsp" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách tài liệu</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="#">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active">Danh sách tài liệu</li>
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
                <div class="card">
                    <div class="card-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên tài liệu</th>
                                <th>Phiên bản</th>
                                <th>Trạng Thái</th>
                                <th>Tác vụ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% List<Document> documents = (List<Document>) request.getAttribute("documents");
                                for (Document document : documents) { %>
                            <tr>
                                <td><%= document.getId() %>
                                </td>
                                <td><%= document.getTitle() %>
                                </td>
                                <td>${document.version}</td>
                                <td><%
                                    String status = "";
                                    switch (document.getStatus()) {
                                        case 1:
                                            status = "Đang chờ duyệt";
                                            break;
                                        case 2:
                                            status = "Ẩn";
                                        case 3:
                                            status = "Đã được duyệt";
                                            break;
                                        case 4:
                                            status = "Từ chối duyệt";
                                            break;
                                    }
                                    out.print(status);
                                %></td>
                                <td>
                                    <div class="btn-toolbar" role="toolbar">
                                        <div class="btn-group mr-2" role="group">
                                            <button type="button" class="btn btn-primary btn-view" data-toggle="modal"
                                                    data-target="#documentViewModal" data-id="<%= document.getId() %>"
                                                    data-title="<%= document.getTitle() %>"
                                                    data-summary="<%= document.getSumary() %>">
                                                Xem
                                            </button>
                                        </div>
                                        <div class="btn-group mr-2" role="group">
                                            <button type="button" class="btn btn-warning btn-edit" data-toggle="modal"
                                                    data-target="#documentEditModal" data-id="<%= document.getId() %>"
                                                    data-title="<%= document.getTitle() %>"
                                                    data-summary="<%= document.getSumary() %>">
                                                Sửa
                                            </button>


                                        </div>

                                        <%--                                        <div class="btn-group mr-2" role="group">--%>
                                        <%--                                            <% if (document.getStatus() != 3 && document.getStatus() != 4) { %>--%>
                                        <%--                                            <button type="button" class="btn btn-warning" data-toggle="modal"--%>
                                        <%--                                                    data-target="#documentEditModal${document.id}">Phản hồi--%>
                                        <%--                                            </button>--%>
                                        <%--                                            <% } %>--%>
                                        <%--                                        </div>--%>
                                        <div class="btn-group mr-2" role="group">
                                            <% if (document.getStatus() != 3 && document.getStatus() != 4) { %>
                                            <form id="approveForm${document.id}" action="/updateDocumentStatus"
                                                  method="post"
                                                  onsubmit="return confirm('Bạn có chắc chắn duyệt tài liệu này?');">
                                                <input type="hidden" name="documentId" value="<%= document.getId() %>">
                                                <input type="hidden" name="status" value="3">
                                                <button type="submit" class="btn btn-primary">Duyệt</button>
                                            </form>
                                            <% } %>

                                        </div>
                                        <div class="btn-group" role="group">
                                            <% if (document.getStatus() != 3 && document.getStatus() != 4) { %>
                                            <button id="declineBtn${document.id}" type="button" class="btn btn-danger"
                                                    data-toggle="modal" data-target="#documentDeclineModal">Từ chối
                                            </button>
                                            <% } %>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <% } %>

                            </tbody>
                            <tfoot>

                            </tfoot>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col-->
        </div>
        <!-- ./row -->
    </section>

    <!-- Modal view -->
    <div class="modal fade" id="documentViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewModelTitle"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="documentContent">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal edit -->
    <div class="modal fade" id="documentEditModal" tabindex="-1" role="dialog" aria-labelledby="editModalTitle"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalTitle">Chỉnh sửa văn bản</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="editTitle">Tiêu đề</label>
                        <input type="text" class="form-control" id="editTitle" placeholder="Nhập tiêu đề">
                    </div>
                    <div class="form-group">
                        <label for="editSummary">Tóm tắt</label>
                        <textarea class="form-control" id="editSummary" rows="3" placeholder="Nhập tóm tắt"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="saveChangesBtn">Lưu thay đổi</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal confirm -->
        <div class="modal fade" id="documentApproveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="col-12 modal-title text-center" id="exampleModalLabel">Tên văn bản</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                      <span>
                        <i>Người kiểm duyệt</i>
                      </span>
                            <span style="float:right;">
                        <i>Create date: 2024/04/10</i>
                      </span>
                            <hr>
                        </div>
                        <div class="form-group">
                            <label>Văn bản</label>
                            <textarea class="form-control" rows="3" placeholder="Nội dung Tài liệu ..."></textarea>
                        </div>
                        <div class="form-group">
                            <label>Phản hồi</label>
                            <textarea class="form-control" rows="3" placeholder="Nội dung phản hồi ..."></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>

</div>

<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
        <b>DACNPM</b>
    </div>
    <strong>Copyright &copy; 2024 Chinhphu.vn.</strong> All rights reserved.
</footer>

<aside class="control-sidebar control-sidebar-dark"></aside>

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../plugins/jszip/jszip.min.js"></script>
<script src="../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../js/adminlte.min.js"></script>
<script src="../js/script.js"></script>

</html>