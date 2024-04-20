<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="icon" href="../assets/icon.png">
        <link rel="stylesheet" href="./stylesRtNChp.css">
        <title>Administradores | Rutas y Puntos de Control</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="d-flex p-2">
                <nav class="navbar bg-body-tertiary fixed-top"
                     data-bs-theme="dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="http://localhost:8080/webAppNew/admins/routesAndCheckpoints.jsp">Rutas y puntos de control</a>
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
                                        <a class="nav-link" href="#">Usuarios</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Tarifas</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Reportes
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Reporte de rutas</a></li>
                                            <li><a class="dropdown-item" href="#">Reporte de ganancias</a></li>
                                            <li><a class="dropdown-item" href="#">Reporte de clientes</a></li>                                        
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
            <div class="search_form">
                <div class="d-flex p-2">
                    <form class="row g-3">
                        <div class="col-auto">
                            <label class="visually-hidden">Ruta</label>
                            <input type="text" readonly class="form-control-plaintext" id="staticText" value="Número de ruta">
                        </div>
                        <div class="col-auto" >
                            <label for="inputID" class="visually-hidden">Número</label>
                            <input type="password" class="form-control" id="inputPassword2" placeholder="ID">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-outline-primary mb-3">Buscar</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="table_routes" >
                <h1 class="tittle">Rutas</h1>
                <div class="d-flex p-2">
                    <div class="container my-4">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <table id="datatable_users" class="table">
                                    <thead>
                                        <tr>
                                            <th class="centered">Inicio</th>
                                            <th class="centered">Final</th>
                                            <th class="centered">ID</th>
                                            <th class="centered">Estado</th>                                            
                                            <th class="centered">Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_users"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="table_checkpoints" >
                <h1 class="tittle2">Puntos de Control de la ruta <strong>---</strong></h1>
                <div class="d-flex p-2">
                    <div class="container my-4">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <table id="datatable_checkpoints" class="table">
                                    <thead>
                                        <tr>
                                            <th class="centered">ID</th>
                                            <th class="centered">Dirección</th>
                                            <th class="centered">Costo de Operaciones</th>
                                            <th class="centered">Límite de paquetes</th>
                                            <th class="centered">Paquetes en cola</th>
                                            <th class="centered">Orden</th>
                                            <th class="centered">Estado</th>
                                            <th class="centered">Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_checkpoints"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script>
        <script src="subMain.js"></script>
    </body>
</html>
