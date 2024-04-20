package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOuser;
import model.users;

@WebServlet(name = "srvUser", urlPatterns = {"/srvUser"})
public class srvUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        try {
            if (action != null) {
                switch (action) {
                    case "verify":
                        verify(request, response);
                        break;
                    case "logout":
                        logout(request, response);
                        break;
                    default:
                        response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println("");
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

    private void verify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session;
        DAOuser dao;
        users usr;
        usr = this.getUser(request);
        dao = new DAOuser();
        usr = dao.identify(usr);
        if (usr != null && usr.getRol().equals("administrador")) {
            session = request.getSession();
            session.setAttribute("admin", usr);
            this.getServletConfig().getServletContext().getRequestDispatcher("/admins/admins.jsp").forward(request, response);
        } else if (usr != null && usr.getRol().equals("operador")) {
            session = request.getSession();
            session.setAttribute("operator", usr);
            this.getServletConfig().getServletContext().getRequestDispatcher("/operators/operators.jsp").forward(request, response);
        } else if (usr != null && usr.getRol().equals("recepcionista")) {
            session = request.getSession();
            session.setAttribute("recepcionist", usr);
            this.getServletConfig().getServletContext().getRequestDispatcher("/recepcionists/recepcionists.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        session.setAttribute("admin", null);
        session.invalidate();
        response.sendRedirect("index.jsp");
    }

    private users getUser(HttpServletRequest request) {
        users u = new users();
        u.setDPI(request.getParameter("DPI"));
        return u;
    }

}
