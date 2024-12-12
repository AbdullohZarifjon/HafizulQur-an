<%@ page import="uz.pdp.qorilar.repo.QoriRepo" %>
<%@ page import="uz.pdp.qorilar.entity.Qori" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.qorilar.entity.Surah" %>
<%@ page import="uz.pdp.qorilar.repo.SurahRepo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quron audio</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
        }
        .navbar-brand .name {
            margin-left: 10px;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .table thead th {
            text-align: center;
            vertical-align: middle;
        }
        .table tbody td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-download {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-download:hover {
            background-color: #218838;
        }
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%
    String qoriId = request.getParameter("qoriId");
    int id = 0;
    if (qoriId != null && !qoriId.isEmpty()) {
        id = Integer.parseInt(qoriId);
    }
    Qori qori = QoriRepo.getQori(id);
    List<Surah> surahList = SurahRepo.getSurahByQori(qori.getId());
%>
<div class="container">
    <nav class="navbar navbar-light bg-light px-5 d-flex justify-content-between align-items-center">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="/file/get?qoriId=<%=qori.getId()%>" alt="Qorini rasmi">
            <span class="name"><%=qori.getName()%></span>
        </a>
        <a href="/" class="btn btn-dark">Orqaga</a>
    </nav>
    <div class="table-container">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th style="width: 40%;">Name</th>
                <th style="width: 30%;">Surah</th>
                <th style="width: 25%;">Download</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Surah surah : surahList) {
            %>
            <tr>
                <td><%=surah.getName()%></td>
                <td>
                    <audio controls>
                        <source src="/file/get?audioId=<%=surah.getId()%>" type="audio/mpeg">
                        <source src="/file/get?audioId=<%=surah.getId()%>" type="audio/ogg">
                    </audio>
                </td>
                <td>
                    <a href="/file/get2?audioId=<%=surah.getId()%>" class="btn-download">Download</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
