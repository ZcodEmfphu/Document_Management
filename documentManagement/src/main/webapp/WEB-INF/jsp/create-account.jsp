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
                <h1>Tạo tài khoản</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item">
                    <a href="#">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Create Account</li>
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
              <div class="card card-outline card-primary">
                <div class="card-body">
                  <form action="/register" method="post">
                      <c:if test="${not empty error}">
                          <div style="color: red" class="error-message">${error}</div>
                      </c:if>
                    <div class="input-group mb-3">
                      <input id="name" name="name" type="text" class="form-control" placeholder="Họ và tên">
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-user"></span>
                        </div>
                      </div>
                    </div>
                    <div class="input-group mb-3">
                      <input type="email" class="form-control" placeholder="Email" id="email" name="email">
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-envelope"></span>
                        </div>
                      </div>
                    </div>
                    <div class="input-group mb-3">
                      <input type="password" class="form-control" placeholder="Mật khẩu" id="password" name="password"  >
                      <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-lock"></span>
                        </div>
                      </div>
                    </div>
<%--                    <div class="input-group mb-3">--%>
<%--                      <input type="password" class="form-control" placeholder="Nhập lại mật khẩu">--%>
<%--                      <div class="input-group-append">--%>
<%--                        <div class="input-group-text">--%>
<%--                          <span class="fas fa-lock"></span>--%>
<%--                        </div>--%>
<%--                      </div>--%>
<%--                    </div>--%>

                      <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="Số điện thoại" id="phone" name="phone">
                          <div class="input-group-append">
                              <div class="input-group-text">
                                  <span class="fas fa-phone"></span>
                              </div>
                          </div>
                      </div>
                      <div class="input-group mb-3">
<%--                          <input type="text" class="form-control" placeholder="Vai trò">--%>
<%--                          <div class="input-group-append">--%>
<%--                              <div class="input-group-text">--%>
<%--                                  <span class="fas fa-user"></span>--%>
<%--                              </div>--%>
<%--                          </div>--%>

    <select class="form-control" id="role" name="role">
        <option selected disabled >-- Vai trò --</option>
        <option value="1">Người quản trị</option>
        <option value="2">Biên tập viên</option>
    </select><br>
                      </div>
                      <div class="input-group mb-3">

                          <select class="form-control" id="accessLevel" name="accessLevel">
                              <option selected disabled>-- Quyền hạn --</option>
                              <option value="1">Quyền đọc 1</option>
                              <option value="2">Quyền đọc 2</option>
                              <option value="3">Quyền đọc 3</option>
                          </select><br>
                      </div>
                    <div class="row">
                      <div class="col-10"></div>
                      <!-- /.col -->
                      <div class="col-2">
                        <button type="submit" class="btn btn-primary btn-block">Create</button>
                      </div>
                      <!-- /.col -->
                    </div>
                  </form>
                </div>
                <!-- /.form-box -->
                <!-- /.card -->
              </div>
              <!-- /.register-box -->
            </div>
            <!-- /.col-->
          </div>
          <!-- ./row -->
        </section>
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
  </body>
</html>