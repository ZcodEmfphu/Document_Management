<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
    <title>Cổng Thông tin điện tử Chính phủ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
      .DropdownMenu {
        width: 100%;
        border-bottom: 1px solid #C3D0E0;
        border-top: 1px solid #F2F2F2;
        text-align: center;
        margin-bottom: 20px;
        padding: 0;
        height: 48px;
      }

      .DropdownMenu .MenuList {
        display: block;
        margin: 0 auto;
        padding: 0;
        position: relative;
      }

      .DropdownMenu .MenuList .TopMenu,
      .DropdownMenu .MenuList .TopMenuActive {
        float: left;
        padding: 0 15px;
        position: relative;
        list-style: outside none none;
        transition: ease 0.5s;
        height: 48px;
      }

      .DropdownMenu a {
        text-decoration: none !important;
      }

      .DropdownMenu .MenuList li a img {
        margin-right: 10px;
        margin-bottom: 3px;
        width: 19px;
      }

      .DropdownMenu .TopMenu span,
      .DropdownMenu .TopMenuActive span {
        font-size: 15px;
        line-height: 45px;
        font-family: Merriweather;
        font-size: 15px;
        text-transform: uppercase;
        color: #182940;
      }

      .header {
        background: #fff none repeat scroll 0 0;
        width: 85%;
        margin: 0 auto;
      }

      .content {
        background: #fff none repeat scroll 0 0;
        width: 85%;
        margin: 0 auto;
      }

      .footer {
        margin: 0 auto;
        text-align: center;
        background-color: rgba(0, 102, 188, 1);
      }

      .UIFooterControl {
        color: #fff;
        margin: 0 auto;
        width: 85%;
        padding: 0;
      }

      table {
        border-collapse: collapse;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <div class="header">
        <div class="text-center" style="width: 100%; margin-top: 15px; margin-bottom: 15px;">
          <a href="#">
            <img loading="lazy" alt="Cổng thông tin điện tử Chính phủ" src="https://datafiles.chinhphu.vn/cpp/1/banner/svg.png">
          </a>
        </div>
        <div class="layout-flex">
          <div class="DropdownMenu">
            <ul class="MenuList">
              <li class="TopMenu" style="display:inline-block">
                <a href="index.html">
                  <img src="https://datafiles.chinhphu.vn/cpp/1/Logo/quoc-huy.png" class="image">
                  <span class="trang-chu-68147">Trang chủ</span>
                </a>
              </li>
              <li class="TopMenu" style="display:inline-block">
                <a href="chinh-phu.html">
                  <span class="chinh-phu-70544">Chính phủ</span>
                </a>
              </li>
              <li class="TopMenu" style="display:inline-block">
                <a href="cong-dan.html">
                  <span class="cong-dan-68149">Công dân</span>
                </a>
              </li>
            </ul>
            <div class="navbar-button" onclick="onToggleNavbar()">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <div class="navbar-overlay"></div>
          </div>
        </div>
      </div>