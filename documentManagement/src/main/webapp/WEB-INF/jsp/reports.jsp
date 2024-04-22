<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.boot.music.entity.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%@ include file="admin-header.jsp" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%String json= (String)request.getAttribute("json"); %>
  <% ArrayList<Document> list=(ArrayList<Document>) request.getAttribute("pending list"); %>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1>Report List</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item">
                    <a href="#">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Report List</li>
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
                        <th>Title</th>
                        <th>Summary</th>
                        <th>Date</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                   
                     <%for(int i=0;i<list.size();i++){ %>
                      <tr>  <% Integer size=list.get(i).getVersionList().size();%>
                        <td><%=list.get(i).getId() %></td>
                        <td><%=list.get(i).getTitle() %></td>
                        <td><%=list.get(i).getSumary() %></td>
                        <td><%=list.get(i).getDateStart() %></td>
                        <td>
                          <div class="btn-toolbar" role="toolbar">
                            <div class="btn-group mr-2" role="group">
                            <button onclick="view()" id="buttonview" type="button" class="btn btn-info btn-view" data-toggle="modal"  	
                               data-target="#reportViewModal" data-id="<%=list.get(i).getId() %>"
                               data-content="<%=list.get(i).getVersionList().get(size-1).getContent() %>"
                               data-title="<%=list.get(i).getTitle() %>"
                               data-summary="<%=list.get(i).getSumary() %>"
                               >view</button>
                              
                            </div>
                       
                          </div>
                        </td>
                      </tr>
                        <%} %>
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
        <!-- Modal view -->
        <div class="modal fade" id="reportViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">View</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

              <div  class="modal-body" id="documentContent"> 
              
				
				
				</div>
			<form action="addComment" method="post">
			<input name="idinput" id="idinput" S value="">
              <textarea name="comment" rows="5" cols="60"></textarea>
              
              <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
              </form>
              
            </div>
          </div>
        </div>
        <!-- Modal edit -->
       
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
      });
    </script>

<script>

    $('.btn-view').click(function () {
        var documentTitle = $(this).data('title'); // Lấy tiêu đề từ thuộc tính data-title của button "View"
        var documentSummary = $(this).data('content'); // Lấy summary từ thuộc tính data-summary của button "View"
    	
        $('#exampleModalLabel').text(documentTitle); // Thiết lập tiêu đề của modal bằng tiêu đề của văn bản
        $('#documentContent').text(documentSummary); // Thiết lập nội dung summary của modal bằng nội dung summary của văn bản
        var documentID = $(this).data('id');
        document.getElementById("idinput").value = documentID;
    });
    	
    </script>
  </body>
</html>