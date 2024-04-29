package controler;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOroute;
import model.route;

@WebServlet(name = "SrvRoutes", urlPatterns = {"/admins/routesAndCheckpoints/SrvRoute"})
public class SrvRoutes extends HttpServlet {

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
        System.out.println("Entra en el add");
        String initialAddress = request.getParameter("initialAddress");
        String endAddress = request.getParameter("endAddress");
        String priceString = request.getParameter("destinationFee");
        String operationFeeString = request.getParameter("operationFee");
        
        float price = Float.parseFloat(priceString);
        float operationFee = Float.parseFloat(operationFeeString);
        
        route r = new route(initialAddress, endAddress, "Activa", price, operationFee, 0);
        
        DAOroute rdao = new DAOroute();
        
        rdao.add(r);
        
        request.getRequestDispatcher("routesAndCheckpoints.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
