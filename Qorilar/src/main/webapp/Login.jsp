<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2024
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Login</title>
</head>
<body>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">Login</div>
            <div class="card-body">
                <form action="/checkLogin" method="post">
                    <input class="form-control mb-2" type="text" name="admin" placeholder="Enter the secret keyword">
                    <input class="form-control mb-2" type="password" name="password" placeholder="Password">
                    <div class="text-end">
                        <button class="btn btn-success">Press</button>
                    </div>
                </form>
                <a href="/" class="btn btn-primary">back</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
