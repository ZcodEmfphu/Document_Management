<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="admin-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>
<body>
<div class="content-wrapper">
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
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-outline card-info">
                    <div class="card-header">
                        <h3 class="card-title"> Văn bản </h3>
                    </div>
                    <div class="card-body">
                        <div class="container">
                            <div class="document-filter">
                                <label for="document-type">Document Type:</label>
                                <select id="document-type" name="document-type" class="form-control">
                                    <option value="all">All</option>
                                    <option value="pdf">PDF</option>
                                    <option value="doc">DOC</option>
                                    <option value="txt">TXT</option>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>
                            <div class="government-filter">
                                <label for="government">Government:</label>
                                <select id="government" name="government" class="form-control">
                                    <option value="all">All</option>
                                    <option value="local">Local</option>
                                    <option value="state">State</option>
                                    <option value="federal">Federal</option>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>

                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <input type="text" id="title" name="title" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="summary">Summary:</label>
                                    <textarea id="summary" name="summary" class="form-control" rows="4" required></textarea>
                                </div>
                                <div class="form-group btn-group">
                                    <button id="cancel-document-button" class="btn btn-secondary">Cancel</button>
                                    <button id="create-document-button" class="btn btn-primary" onclick="createDocument()">Confirm</button>
                                </div>

                            <div id="success-message" style="display: none;" class="alert alert-success">Tạo tài liệu thành công!</div>

                        </div>
                    </div>
                    <div class="card-footer">Hướng dẫn sử dụng</div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>




<jsp:include page="footer.jsp" />

<aside class="control-sidebar control-sidebar-dark"></aside>
<script src="../plugins/jquery/jquery.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../js/adminlte.min.js"></script>
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<script src="../plugins/codemirror/codemirror.js"></script>
<script src="../plugins/codemirror/mode/css/css.js"></script>
<script src="../plugins/codemirror/mode/xml/xml.js"></script>
<script src="../plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/script.js"></script>

</html>



