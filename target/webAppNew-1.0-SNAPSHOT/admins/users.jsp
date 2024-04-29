<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.users"%>
<%@page import="model.DAOcrud"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./stylesUsers.css">
        <link rel="icon" href="../assets/icon.png">
        <title>Usuarios</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="d-flex p-2">
                <nav class="navbar bg-body-tertiary fixed-top"
                     data-bs-theme="dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="http://localhost:8080/webAppNew/admins/users.jsp">Usuarios</a>
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

            <div class="modals">

                <form action="SrvUsers" method="POST">
                    <!-- Button trigger modal -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                        <button type="button" class="btn btn-success btnModal" data-bs-toggle="modal" data-bs-target="#addModal" style="margin-top: 5%; margin-right: 3%">
                            <i class="bi bi-person-add"> Agregar</i>
                        </button>

                        <button type="button" class="btn btn-primary btnModal" data-bs-toggle="modal" data-bs-target="#editModal" style="margin-top: 5%; margin-right: 3%">
                            <i class="bi bi-pencil-square"> Activar o desactivar</i>
                        </button>

                        <button type="button" class="btn btn-danger btnModal" data-bs-toggle="modal" data-bs-target="#deleteModal" style="margin-top: 5%; margin-right: 3%">
                            <i class="bi bi-person-dash"> Eliminar</i>
                        </button>

                    </div>                    

                    <!-- Modal Add -->
                    <div class="modal fade" id="addModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Agregar nuevo usuario</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">DPI</span>
                                        <input type="number" class="form-control" name="DPI" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Nombre(s)</span>
                                        <input type="text" class="form-control" name="name" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Apellido(s)</span>
                                        <input type="text" class="form-control" name="last_name" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Rol</span>
                                        <select class="form-select" aria-label="Default select example" name="rol">
                                            <option selected value="administrador">Administrador</option>
                                            <option value="operador">Operador</option>
                                            <option value="recepcionista">Recepcionista</option>
                                        </select>
                                    </div>                                    

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" name="action" value="add">Agregar</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>

                <form action="SrvUsers" method="POST">

                    <!-- Modal edit -->
                    <div class="modal fade" id="editModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Editar Usuario</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">DPI</span>
                                        <input type="number" class="form-control" name="DPIupdate" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Estado</span>
                                        <select class="form-select" aria-label="Default select example" name="stateUpdate">
                                            <option selected value="1">Activo</option>
                                            <option value="0">Inactivo</option>
                                        </select>
                                    </div>                                    

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" name="action" value="update">Confirmar</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>

                <form action="SrvUsers" method="POST">                   

                    <!-- Modal delete -->
                    <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar usuario</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <p>¿Está seguro de <strong>ELIMINAR</strong> a un usuario?</p>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">DPI</span>
                                        <input type="number" class="form-control" name="DPIdelete" placeholder="DPI del usuario a eliminar" required>
                                    </div>                                                                       

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-outline-danger" name="action" value="delete">Confirmar</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>

            </div>

            <div class="tables">
                <div class="d-flex p-2">
                    <div class="container my-4">
                        <table id="users" class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="centered">DPI</th>
                                    <th class="centered">Nombre(s)</th>
                                    <th class="centered">Apellido(s)</th>
                                    <th class="centered">Rol</th>
                                    <th class="centered">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    DAOcrud dao = new DAOcrud();
                                    List<users> List = dao.list();
                                    Iterator<users> iter = List.iterator();
                            
                                    users usr = null;
                            
                                    while(iter.hasNext()){
                                        usr=iter.next();                                
                                %>

                                <tr>
                                    <td class="centered"><%=usr.getDPI()%></td>
                                    <td class="centered"><%=usr.getName()%></td>
                                    <td class="centered"><%=usr.getLastName()%></td>
                                    <td class="centered"><%=usr.getRol()%></td>
                                    <%
                                        if(usr.getStateString().equals("Activo")) {
                                    %>
                                    <td class="centered" style="color: green;"><i class="bi bi-check-lg"> <%=usr.getStateString()%></i></td>
                                    <%
                                        } else {
                                    %>
                                    <td class="centered" style="color: red;"><i class="bi bi-x-lg"> <%=usr.getStateString()%></i></td>
                                    <%
                                        }
                                    %>                                                               
                                </tr>
                                <%}%>
                            </tbody>                        
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!<!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!<!-- Tables -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script>
        <script>
            new DataTable('#users', {
                lengthMenu: [10, 25, 50],
                columnDefs: [
                    {orderable: false, targets: [3, 4]}
                ],
                language: {
                    lengthMenu: "Mostrar _MENU_ registros por página",
                    zeroRecords: "Ningún usuario encontrado",
                    info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
                    infoEmpty: "Ningún usuario encontrado",
                    infoFiltered: "(filtrados desde _MAX_ registros totales)",
                    search: "Buscar",
                    loadingRecords: "Cargando..."
                },
                layout: {
                    bottomEnd: {
                        paging: {
                            boundaryNumbers: false
                        }
                    }
                }
            });
        </script>
    </body>
</html>
