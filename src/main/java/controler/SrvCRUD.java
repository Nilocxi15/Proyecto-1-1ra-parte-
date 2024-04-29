package controler;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "srvCRUD", urlPatterns = {"/srvCRUD"})
public class SrvCRUD extends HttpServlet {

    String list = "/admins/users.jsp";
    String add = "/admins/users.jsp";
    String edit = "/admins/users.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acces="";
        String action=request.getParameter("action");
        
        if (action.equalsIgnoreCase("list")) {
            acces=list;
        } 
        RequestDispatcher view=request.getRequestDispatcher(acces);
        view.forward(request, response);
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
