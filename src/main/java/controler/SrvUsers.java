package controler;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOcrud;
import model.users;

@WebServlet(name = "srvUsers", urlPatterns = {"/admins/SrvUsers"})
public class SrvUsers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action.equals("add")) {
            this.add(request, response);
        }

        if (action.equals("update")) {
            this.update(request, response);
        }

        if (action.equals("delete")) {
            this.delete(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String DPI = request.getParameter("DPI");
        String name = request.getParameter("name");
        String lastName = request.getParameter("last_name");
        String rol = request.getParameter("rol");
        users u = new users(DPI, name, lastName, rol, 1, "Activo");
        DAOcrud udao = new DAOcrud();
        boolean validation = false;
        validation = udao.validation(DPI);
        if (validation == true) {
            System.out.println("El usuario ya existe");
        } else {
            System.out.println(udao.add(u));
            udao.add(u);
            if (validation == true) {
                System.err.println("Usuario agregado con exito");
            } else {
                System.out.println("No se pudo agregar");
            }

        }
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String DPI = request.getParameter("DPIupdate");
        String state = request.getParameter("stateUpdate");
        DAOcrud udao = new DAOcrud();
        boolean validation = false;
        validation = udao.validation(DPI);
        if (validation == true) {
            udao.update(DPI, state);
        }
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String DPI = request.getParameter("DPIdelete");
        DAOcrud udao = new DAOcrud();
        boolean validation = false;
        validation = udao.validation(DPI);
        if (validation == true) {
            udao.delete(DPI);
        }
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

}
