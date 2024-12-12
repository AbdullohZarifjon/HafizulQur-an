<%@ page import="uz.pdp.qorilar.repo.QoriRepo" %>
<%@ page import="uz.pdp.qorilar.entity.Qori" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.*" %>
<%@ page import="uz.pdp.qorilar.entity.Counter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Saodat Yo'li</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .box2, .box3, .box1 {
            border-radius: 10px;
        }

        .box2 {
            border: 1px solid;
            margin-top: 3px;
            margin-left: 3px;
            height: 600px;
            width: 99%;
            background-color: #36060c;
        }

        .box3 {
            border: 1px solid;
            margin-top: 3px;
            margin-right: 3px;
            height: 600px;
            width: 99%;
            background-color: #36060c;
            display: flex;
            flex-direction: column; /* Ichki kontent vertikal bo'lsin */
            align-items: center;
            justify-content: flex-start;
            background-image: url("https://s3.stroi-news.ru/img/kartinki-kuran-5.jpg");
            background-size: cover;
            background-position: center;
            border-radius: 8px;
            padding: 20px;
            overflow-y: auto; /* Vertikal scroll qo'shildi */
            overflow-x: hidden; /* Gorizontal scroll o'chiriladi */
        }

        .box1 {
            background-color: #36060c;
            height: 68px;
            width: 99%;
            margin-top: 3px;
            margin-left: 3px;
            margin-right: 3px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .prayer-times {
            font-size: 18px;
            color: #fff;
            text-align: center;
        }

        .btn-warning {
            border: 1px solid;
            height: 50px;
            width: 100%;
            margin-top: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .tasbih-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
            width: 100%;
            margin: 0;
        }

        .tasbih-counter {
            font-size: 5rem;
            color: white;
            margin-bottom: 20px;
        }

        .increment-btn {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #006400;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            cursor: pointer;
            border: none;
        }

        .reset-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .course-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 15px;
        }

        .btn-module {
            width: 150px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%
        String categoryName = request.getParameter("categoryName");
        if (categoryName == null) {
            categoryName = "Qorilar";
        }
        QoriRepo qoriRepo = new QoriRepo();
        List<Qori> qoriList = qoriRepo.findAll();

    %>
<div>
    <div class="row">
        <div class="col-12">
            <div class="box1 navbar-expand-lg">
                <h3 style="margin-left: 15%; color: white">Namoz vaqtlari:</h3>
                <ul class="navbar-nav mx-auto prayer-times">
                    <li class="nav-item px-3">Bomdod: 06:17</li>
                    <li class="nav-item px-3">Quyosh: 07:40</li>
                    <li class="nav-item px-3">Peshin: 12:22</li>
                    <li class="nav-item px-3">Asr: 15:13</li>
                    <li class="nav-item px-3">Shom: 16:56</li>
                    <li class="nav-item px-3">Xufton: 18:19</li>
                </ul>
                <a href="/Login.jsp" class="btn btn-danger" style="margin-right: 2%">KIRISH</a>
            </div>
        </div>

        <div class="col-3">
            <div class="box2">
                <h4 style="text-align: center; color: white;">Bo'limlar</h4>
                <form action="https://islom.uz/mano_tarjima/1" method="get">
                    <button class="btn btn-warning"><h6>Qur'on</h6></button>
                </form>
                <form action="#" method="get">
                    <input type="hidden" name="categoryName" value="Qorilar">
                    <button class="btn btn-warning" style="background-color: <%="Qorilar".equals(categoryName) ? "chocolate; color:white": ""%>"><h6>Qur'on audio</h6></button>
                </form>
                <form action="https://islom.uz/maqolalar/51/1" method="get">
                    <button class="btn btn-warning" style="background-color: <%="Hadis".equals(categoryName) ? "chocolate; color:white" : ""%>"><h6>Hadis</h6></button>
                </form>
                <form action="/">
                    <input type="hidden" name="categoryName" value="Tasbeh">
                    <button class="btn btn-warning" style="background-color: <%="Tasbeh".equals(categoryName) ? "chocolate; color:white" : ""%>" type="submit"><h6>Tasbeh</h6></button>
                </form>


            </div>
        </div>

        <div class="col-9">
            <div class="box3" id="content">
                <div class="container">
                    <%
                        if (categoryName.equals("Qorilar")) {
                    %>
                    <h1 class="text-center mb-4" style="color: white">Qur'on hofizlari</h1>
                    <%
                        for (Qori qori : qoriList) {
                    %>
                    <div class="course-item">
                        <img src="/file/get?qoriId=<%=qori.getId()%>" alt="rasm topilmadi" width=100px height=100px class="img-fluid">
                        <h4 style="color: white"><%=qori.getName()%></h4>
                        <form action="/QuronAudio.jsp" method="post">
                            <input type="hidden" name="qoriId" value="<%=qori.getId()%>">
                            <button class="btn btn-primary btn-module">OK</button>
                        </form>
                    </div>
                    <%
                        }
                        } else if (categoryName.equals("Tasbeh")) {
                    %>
                    <div class="tasbih-container">
                        <form action="/counter" method="post">
                            <h1 class="tasbih-counter"><%=Counter.counter%></h1>
                            <input type="hidden" name="plus" value="++">
                            <button name="categoryName" value="Tasbeh" class="increment-btn">boss</button>
                        </form>
                        <form action="/counter" method="post">
                            <input type="hidden" name="nol" value="00">
                            <button class="reset-btn" name="categoryName" value="Tasbeh">reset</button>
                        </form>
                    </div>

                    <%
                        }
                    %>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
