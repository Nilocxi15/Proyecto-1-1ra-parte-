<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../admins/stylesAdmins.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="../assets/icon.png">
        <title>Inicio</title>
    </head>
    <body>
        <div class="d-flex p-2">
            <nav class="navbar bg-body-tertiary fixed-top"
                 data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="http://localhost:8080/webAppNew/admins/admins.jsp">Inicio</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="http://localhost:8080/webAppNew/admins/users.jsp" name="action" value="list">Usuarios</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="http://localhost:8080/webAppNew/routesAndCheckpoints.jsp">
                                        Rutas y Puntos de Control
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="http://localhost:8080/webAppNew/admins/fee.jsp">Tarifas</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Reportes
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="http://localhost:8080/webAppNew/admins/reports/routes.jsp">Reporte de rutas</a></li>
                                        <li><a class="dropdown-item" href="http://localhost:8080/webAppNew/admins/reports/profits.jsp">Reporte de ganancias</a></li>
                                        <li><a class="dropdown-item" href="http://localhost:8080/webAppNew/admins/reports/clients.jsp">Reporte de clientes</a></li>                                        
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#">BONUS</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="http://localhost:8080/webAppNew/">Cerrar Sesión</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="container mt-4">
                <h1 class="welcome-text">Bienvenido al sistema <strong>${name}</strong></h1>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
