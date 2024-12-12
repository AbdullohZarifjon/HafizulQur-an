<%@ page import="uz.pdp.qorilar.entity.Qori" %>
<%@ page import="uz.pdp.qorilar.repo.QoriRepo" %>
<%@ page import="java.util.List" %>
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content button {
            margin-top: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            width: 100%;
            max-width: 400px;
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
    <div class="content flex-grow-1">
        <h1>Update for Hafiz</h1>
        <%
            if (qori == null) {
        %>
        <form action="/getQori" method="post">
            <input type="hidden" name="name" value="Hafiz">
            <select class="form-control" name="qoriId">
                <option selected disabled>Qorini tanlang:</option>
                <%
                    for (Qori qori1 : qoriList) {
                %>
                <option value="<%=qori1.getId()%>"><%=qori1.getName()%></option>
                <%
                    }
                %>
            </select>
            <%=(error != null) ? "<h5 style='color: red'>" + error + "</h5>" : ""%>
            <button class="btn btn-success">Submit</button>
        </form>
        <%
            } else if (qori != null) {
        %>
        <form action="/updateQori" method="post" enctype="multipart/form-data">
            <img class="mb-2" src="/file/get?qoriId=<%=qori.getId()%>" alt="rasm topilmadi" height="100" width="100">
            <input class="form-control mb-2" type="file" name="image">
            <h5><%=qori.getName()%></h5>
            <input class="form-control" type="text" name="name" placeholder="Enter a new name">
            <button class="btn btn-warning" name="qoriId" value="<%=qori.getId()%>">ok</button>
        </form>
        <%
            }
        %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
