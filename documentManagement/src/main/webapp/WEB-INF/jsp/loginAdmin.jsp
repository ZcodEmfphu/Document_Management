<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Login</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../css/adminlte.min.css">
  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <!-- /.login-logo -->
      <div class="card card-outline card-primary">
        <div class="card-header text-center">
          <a href="#" class="h1">
            <b>Chinhphu.vn</b> </a>
        </div>
        <div class="card-body">
          <p class="login-box-msg">Sign in to start your session</p>
          <form action="/login" method="post">
            <div class="input-group mb-3">
              <input id="email" name="email" type="email" class="form-control" placeholder="Email" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-envelope"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input id="password" name="password" type="password" class="form-control" placeholder="Password" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-lock"></span>
                </div>
              </div>
            </div>
            <c:if test="${not empty error}">
              <div style="color: red" class="error-message">${error}</div>
            </c:if>
            <div class="row">
<%--              <div class="col-8">--%>
<%--                <div class="icheck-primary">--%>
<%--                  <input type="checkbox" id="remember">--%>
<%--                  <label for="remember"> Remember Me </label>--%>
<%--                </div>--%>
<%--              </div>--%>
              <!-- /.col -->
              <div style="margin-bottom: 10px" class="col-4">
                <button type="submit" class="btn btn-primary btn-block">Signin</button>
              </div>
              <!-- /.col -->
            </div>

          </form>
          <!-- /.social-auth-links -->
          <p class="mb-1">
            <a href="#">I forgot my password</a>
          </p>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.login-box -->
    <!-- jQuery -->
    <script src="../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../js/adminlte.min.js"></script>
  </body>
</html>