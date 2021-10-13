package servlet;

import model.User;
import service.custom.Impl.LoginServiceImpl;
import service.custom.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            System.out.println("Hello");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            LoginService loginService = new LoginServiceImpl();

            boolean login = loginService.checkUser(email, password);
            System.out.println(login);
            User userTYpe = loginService.checkUserType(email, password);
            String type = userTYpe.getType();
            System.out.println(type);

            if (login) {
                switch (type) {
                    case "Admin":
                        HttpSession loginSession = req.getSession();
                        loginSession.setAttribute("userType", "Admin");
                        loginSession.setAttribute("loignMessage", "loginSuccess");
                        resp.sendRedirect(req.getContextPath() + "/views/admin/dashboard.jsp");
                        break;
                    case "Seller":
                        HttpSession loginSession1 = req.getSession();
                        loginSession1.setAttribute("userType", "Seller");
                        loginSession1.setAttribute("loignMessage", "loginSuccess");
                        resp.sendRedirect(req.getContextPath() + "/index.jsp");
                        break;
                    default:
                        break;
                }

            } else {
                HttpSession loginSessionElse = req.getSession();
                loginSessionElse.setAttribute("userType", "Admin");
                loginSessionElse.setAttribute("loignMessage", "LoginError");
                resp.sendRedirect(req.getContextPath() + "/views/admin/index.jsp");
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession logOutSession = req.getSession(false);
        if (logOutSession != null) {
            logOutSession.invalidate();
            resp.sendRedirect(req.getContextPath() + "/views/admin/index.jsp");
        }

    }
}
