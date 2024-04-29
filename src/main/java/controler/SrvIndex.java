package controler;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOuser;
import model.users;

@WebServlet(name = "srvIndex", urlPatterns = {"/srvIndex"})
public class SrvIndex extends HttpServlet {

    DAOuser dao = new DAOuser();
    users u = new users();
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String verify = request.getParameter("verify");

        if (verify.equals("login")) {
            String DPI = request.getParameter("DPI");
            String name, lastName;
            u.setDPI(DPI);
            r = dao.validate(u);

            if (r == 1 && dao.getRol() == 1) {                
                request.getRequestDispatcher("./admins/admins.jsp").forward(request, response);
                request.getSession().setAttribute("name", dao.getName());
                dao.setR(0);
                dao.setRol(0);
            } else if (r == 1 && dao.getRol() == 2) {
                request.getRequestDispatcher("./operators/operators.jsp").forward(request, response);
                request.getSession().setAttribute("name", dao.getName());
                dao.setR(0);
                dao.setRol(0);
            } else if (r == 1 && dao.getRol() == 3) {
                request.getRequestDispatcher("./recepcionists/recepcionists.jsp").forward(request, response);
                request.getSession().setAttribute("name", dao.getName());
                dao.setR(0);
                dao.setRol(0);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                dao.setR(0);
                dao.setRol(0);
            }
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

}
