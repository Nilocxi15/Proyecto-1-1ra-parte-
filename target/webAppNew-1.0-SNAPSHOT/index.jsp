<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./styles.css">
        <link rel="icon" href="./assets/icon.png">
    </head>
    <body>
        <div class="wrapper">
            <i class="bi bi-person-circle"></i>
            <form action="srvIndex" method="POST">
                <h1><strong>Bienvenido</strong></h1>
                <div class="input-box">
                    <input class="form-control" type="text" placeholder="ID Usuario" name="DPI" required>
                    <i class="bi bi-person-fill"></i>
                </div>
                <button type="submit" class="login-bttn" name="verify" value="login">Iniciar Sesión</button>                
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
