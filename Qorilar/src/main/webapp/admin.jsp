<%@ page import="uz.pdp.qorilar.repo.QoriRepo" %>
<%@ page import="uz.pdp.qorilar.entity.Qori" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Admin</title>
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
    </style>
</head>
<body>
<%
    QoriRepo qoriRepo = new QoriRepo();
    List<Qori> qoriList = qoriRepo.findAll();
    String qoriError = null;
    String contentError = null;
    Object qerror = request.getAttribute("qoriError");
    Object ctError = request.getAttribute("contentError");
    if (qerror != null) {
        qoriError = (String) qerror;
    }
    if (ctError != null) {
        contentError = (String) ctError;
    }
%>

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

    <div class="flex-grow-1">
        <div class="row">
            <div class="col-6 offset-3" style="margin-top: 5px">
                <div class="card">
                    <div class="card-header">Qori Qo'shish</div>
                    <div class="card-body">
                        <form action="/addQori" method="post" enctype="multipart/form-data">
                            <%-- Agar xatolik bo'lsa, ularni ko'rsatish --%>
                            <%= (qoriError != null) ? "<div class='alert alert-danger'>" + qoriError + "</div>" : "" %>

                            <input class="form-control mb-2" type="text" name="name" placeholder="Qori nomini kiriting">
                            <input class="form-control mb-2" type="file" name="image" placeholder="Qori rasmi">
                            <div class="text-end">
                                <button class="btn btn-success">Qo'shish</button>
                            </div>
                        </form>
                        <a href="/" class="btn btn-primary">Asosiy sahifaga qaytish</a>
                    </div>
                </div>
            </div>

            <div class="col-6 offset-3" style="margin-top: 50px">
                <div class="card">
                    <div class="card-header">Sura Qo'shish</div>
                    <div class="card-body">
                        <form action="/addContent" method="post" enctype="multipart/form-data">
                            <%-- Agar xatolik bo'lsa, ularni ko'rsatish --%>
                            <%= (contentError != null) ? "<div class='alert alert-danger'>" + contentError + "</div>" : "" %>

                            <input class="form-control mb-2" type="text" name="name" placeholder="Surah nomini kiriting">
                            <input class="form-control mb-2" type="file" name="surah" placeholder="Surahni tanlang">
                            <select name="qoriId" class="form-select mb-2">
                                <option selected disabled>Qori tanlang</option>
                                <%
                                    for (Qori qori : qoriList) {
                                %>
                                <option value="<%=qori.getId()%>"><%=qori.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <div class="text-end">
                                <button class="btn btn-success">Qo'shish</button>
                            </div>
                        </form>
                        <a href="/" class="btn btn-primary">Asosiy sahifaga qaytish</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
