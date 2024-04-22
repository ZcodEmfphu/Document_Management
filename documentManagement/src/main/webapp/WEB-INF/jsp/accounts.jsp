<%@ page import="com.boot.music.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                <h1>Danh sách tài khoản</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item">
                    <a href="#">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Account List</li>
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
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Quyền hạn</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>

                    <% List<User> users = (List<User>) request.getAttribute("users"); %>
                    <% for (User user : users) { %>
                      <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= getRoleLabel(user.getRole()) %></td>
                        <td> <%= getAccessLevelLabel(user.getAccessLevel()) %></td>
                        <td>

                          <div class="btn-toolbar" role="toolbar">
                              <% if (user.getId() != 17) { %>
                              <% if (user.getAccessLevel() != 0) { %>
                            <div class="btn-group mr-2" role="group">
                              <button type="button" class="btn btn-info" data-toggle="modal" data-target="#accountEditModal"
                                      onclick="viewUserInfo(<%= user.getId() %>, '<%= user.getName() %>', '<%= user.getEmail() %>', '<%= user.getRole() %>', '<%= user.getAccessLevel() %>')"
                              >Chỉnh sửa</button>
                            </div>
                              <% } %>
<%--                            <div class="btn-group mr-2" role="group">--%>
<%--                              <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#accountEditModal">Khóa tài khoản</button>--%>
<%--                            </div>--%>
                              <% if (user.getAccessLevel() != 0) { %>
                            <div class="btn-group" role="group">
                                <form class="button-container" action="disableAccount" method="post">
                                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                                    <button class="btn btn-danger" type="submit">Khóa tài khoản</button>
                                </form>
                            </div>
                              <% } else { %>
                              <div class="btn-group" role="group">
                                  <form class="button-container" action="enableAccount" method="post">
                                      <input type="hidden" name="userId" value="<%= user.getId() %>">
                                      <button class="btn btn-warning" type="submit">Mở khóa</button>
                                  </form>
                              </div>
                              <% } %>
                              <% } %>
                          </div>
                        </td>
                      </tr>

                    <% } %>
                    <%!
                      public String getRoleLabel(Integer role) {
                        if (role != null) {
                          return role.intValue() == 1 ? "Quản trị viên" : (role.intValue() == 2 ? "Biên tập viên" : "Không xác định");
                        } else {
                          return "Không xác định";
                        }
                      }
                      public String getAccessLevelLabel(Integer accessLevel) {
                        if (accessLevel != null) {
                          switch (accessLevel.intValue()) {
                            case 0:
                              return "Tài khoản bị khóa";
                            case 1:
                              return "Quyền đọc 1";
                            case 2:
                              return "Quyền đọc 2";
                            case 3:
                              return "Quyền đọc 3";
                            default:
                              return "Không xác định";
                          }
                        } else {
                          return "Không xác định";
                        }
                      }
                    %>
                    </tbody>
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
          <script>
              function viewUserInfo(id, name, email, role, accessLevel) {
                  // Hiển thị thông tin người dùng trong modal
                  document.getElementById("userId").value = id;
                  document.getElementById("userName").value = name;
                  document.getElementById("userEmail").value = email;
                  document.getElementById("userRole").value = role;
                  document.getElementById("userAccessLevel").value = accessLevel;
              }
          </script>
        <!-- Modal view -->
        <div class="modal fade" id="accountViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin người dùng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body"> ... </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cập nhật</button>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal edit -->
          <!-- Modal edit -->
          <!-- Modal edit -->
          <div class="modal fade" id="accountEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title" >Chỉnh sửa thông tin người dùng</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                      </div>
                      <div class="modal-body">
                          <!-- Form chỉnh sửa thông tin người dùng -->
                          <form id="editForm" action="/saveUser" method="post">
                              <div class="form-group">
                                  <label for="userId">ID:</label>
                                  <input type="text" class="form-control" id="userId" name="id" readonly>
                              </div>
                              <div class="form-group">
                                  <label for="userName">Họ và tên:</label>
                                  <input type="text" class="form-control" id="userName" name="name">
                              </div>
                              <div class="form-group">
                                  <label for="userEmail">Email:</label>
                                  <input type="email" class="form-control" id="userEmail" name="email">
                              </div>
                              <div class="form-group">
                                  <label for="userRole">Vai trò:</label>
                                  <select class="form-control" id="userRole" name="role">
                                      <option value="1">Quản trị viên</option>
                                      <option value="2">Biên tập viên</option>
                                  </select>
                              </div>
                              <div class="form-group">
                                  <label for="userAccessLevel">Quyền hạn:</label>
                                  <select class="form-control" id="userAccessLevel" name="accessLevel">
                                      <option value="1">Quyền đọc 1</option>
                                      <option value="2">Quyền đọc 2</option>
                                      <option value="3">Quyền đọc 3</option>
                                  </select>
                              </div>
                              <!-- Thêm một trường ẩn để xác định action cho controller -->
                              <input type="hidden" name="action" value="edit">
                          </form>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                          <button type="submit" form="editForm" class="btn btn-primary">Cập nhật</button>
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
    <!-- DataTables  & Plugins -->
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
    <!-- AdminLTE App -->
    <script src="../js/adminlte.min.js"></script>
    <script>
      $(function() {
        $("#example1").DataTable({
          "responsive": true,
          "lengthChange": false,
          "autoWidth": false,
          "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $("#removeRecords").click(function() {
          confirm("Remove?");
        });
      });
    </script>
  </body>
</html>