<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="stylesReports.css">
        <link rel="icon" href="../../assets/icon.png">
        <title>Reportes | Rutas</title>
    </head>
    <body>
        <div id="wrapper">
            <div class="d-flex p-2">
                <nav class="navbar bg-body-tertiary fixed-top"
                     data-bs-theme="dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="http://localhost:8080/webAppNew/admins/reports/routes.jsp">Reporte de rutas</a>
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
                                        <a class="nav-link" href="http://localhost:8080/webAppNew/admins/admins.jsp">Inicio</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/webAppNew/admins/users.jsp">Usuarios</a>
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
                                        <a class="nav-link" href="http://localhost:8080/webApp/">Cerrar Sesión</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>

            <div class="popular_routes">
                <h2>Rutas más populares</h2>
            </div>

            <div class="routes_reports">
                <h2>Reportes y estadísticas de rutas</h2>
                <div class="table_routes" >                    
                    <div class="d-flex p-2">
                        <div class="container my-4">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <table id="datatable_routes" class="table">
                                        <thead>
                                            <tr>
                                                <th class="centered">ID Ruta</th>
                                                <th class="centered">ID Punto de Control</th>
                                                <th class="centered">Paquetes Activos</th>
                                                <th class="centered">Paquetes Inactivos</th>
                                                <th class="centered">Estado de ruta</th>                                                                                            
                                            </tr>
                                        </thead>
                                        <tbody id="table_routes"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!<!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!<!-- Tablas -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script>
        <script src="routes.js"></script>
    </body>
</html>
