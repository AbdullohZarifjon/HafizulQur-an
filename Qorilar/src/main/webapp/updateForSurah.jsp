<%@ page import="uz.pdp.qorilar.entity.Qori" %>
<%@ page import="uz.pdp.qorilar.repo.QoriRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.qorilar.entity.Surah" %>
<%@ page import="uz.pdp.qorilar.repo.SurahRepo" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .sidebar {
      height: 100vh;
      background-color: #f4f4f4;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }

    .sidebar button {
      width: 100%;
      margin-bottom: 10px;
    }

    .navbar {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 60px;
      font-size: 24px;
      font-weight: bold;
    }

    .content {
      flex-grow: 1;
      overflow-y: auto;
      padding: 20px;
    }

    .qori-info {
      text-align: center;
      margin-bottom: 20px;
    }

    .qori-info img {
      max-width: 100px;
      max-height: 100px;
    }

    table {
      width: 100%;
    }

    thead th {
      text-align: center;
    }

    tbody td {
      vertical-align: middle;
    }

    form {
      margin: 0;
    }
  </style>
</head>
<body>
<%
  String error = null;
  Qori qori = null;
  QoriRepo qoriRepo = new QoriRepo();
  List<Qori> qoriList = qoriRepo.findAll();
  Object object = request.getAttribute("qori");
  if (object != null && object instanceof Qori) {
    qori = (Qori) object;
  } else if (object != null && object instanceof String) {
    error = (String) object;
  }
  String id = request.getParameter("qoriId");
  if (id != null && !id.isEmpty()) {
    qori = QoriRepo.getQori(Integer.parseInt(id));
}
%>
<div class="navbar bg-dark text-white">Update</div>
<div class="d-flex">
  <div class="sidebar p-3">
    <form action="/admin.jsp" method="post">
      <button class="btn btn-outline-primary">Hafiz yoki Sura qo'shish</button>
    </form>
    <form action="/updateForHafiz.jsp" method="post">
      <button class="btn btn-outline-secondary" style="color: black">Hafizni tahrirlash</button>
    </form>
    <form action="/updateForSurah.jsp" method="post">
      <button class="btn btn-outline-success">Surani tahrirlash</button>
    </form>
    <form action="/" method="post">
      <button class="btn btn-outline-danger">Asosiy Menyu</button>
    </form>
  </div>
  <div class="content">
    <h1>Update for Surah</h1>
    <% if (qori == null) { %>
    <form action="/getQori" method="post">
      <h5>Sura uchun Hofizni tanlang:</h5>
      <input type="hidden" name="name" value="Surah">
      <select class="form-control" name="qoriId">
        <option selected disabled>Qorini tanlang:</option>
        <% for (Qori qori1 : qoriList) { %>
        <option value="<%= qori1.getId() %>"><%= qori1.getName() %></option>
        <% } %>
      </select>
      <%=(error != null) ? "<h5 style='color: red'>" + error + "</h5>" : "" %>
      <button class="btn btn-success mt-2">Submit</button>
    </form>
    <% } else {
      List<Surah> surahList = SurahRepo.getSurahByQori(qori.getId());
    %>
    <div class="qori-info">
      <img src="/file/get?qoriId=<%=qori.getId()%>" alt="rasm topilmadi">
      <h5><%=qori.getName()%></h5>
    </div>
    <table class="table table-bordered">
      <thead class="table-dark">
      <tr>
        <th>Name</th>
        <th>New Name</th>
        <th>Audio</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <%
        for (Surah surah : surahList) {
      %>
      <tr>
        <td><%= surah.getName() %></td>
        <td>
          <form action="/updateOrDelete" method="post">
            <input type="text" name="name" class="form-control" placeholder="Enter new name">
            <input type="hidden" name="qoriId" value="<%=qori.getId()%>">
            <input type="hidden" name="surahId" value="<%= surah.getId() %>">
            <button name="why" value="update" class="btn btn-warning mt-2">Update</button>
          </form>
        </td>
        <td>
          <audio controls>
            <source src="/file/get?audioId=<%=surah.getId()%>" type="audio/mpeg">
            <source src="/file/get?audioId=<%=surah.getId()%>" type="audio/ogg">
          </audio>
        </td>
        <td>
          <form action="/updateOrDelete" method="post">
            <input type="hidden" name="why" value="delete">
            <input type="hidden" name="qoriId" value="<%=qori.getId()%>">
            <button name="surahId" value="<%=surah.getId()%>" class="btn btn-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
    <% } %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>