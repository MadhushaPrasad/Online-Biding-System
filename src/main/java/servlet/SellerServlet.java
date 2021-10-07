package servlet;

import model.Bid;
import model.User;
import service.custom.BidService;
import service.custom.Impl.BidServiceImpl;
import service.custom.Impl.SellerServiceImpl;
import service.custom.SellerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/seller")
public class SellerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buttonType = req.getParameter("option");
        switch (buttonType) {
            case "submit":
                try {

                    String userName = req.getParameter("userName");
                    String firstName = req.getParameter("firstName");
                    String lastName = req.getParameter("lastName");
                    String email = req.getParameter("email");
                    String tel = req.getParameter("tel");
                    String address = req.getParameter("Address");

                    User user = new User();
                    user.setUserName(userName);
                    user.setF_Name(firstName);
                    user.setL_Name(lastName);
                    user.setEmail(email);
                    user.setTelephone(tel);
                    user.setAddress(address);
                    user.setPassword("1234");
                    user.setImg("profile.jpg");
                    user.setType("Seller");
                    user.setStatus("offline");
                    SellerService service = new SellerServiceImpl();
                    boolean add = service.add(user);

                    if (add) {
                        System.out.println("Added");
                    } else {
                        System.out.println("error");
                    }

                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "update":
                doPut(req, resp);
                break;
            default:
                break;
        }



    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String userID = req.getParameter("userID");
            int id = Integer.parseInt(userID);
            String userName = req.getParameter("userName");
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String email = req.getParameter("email");
            String tel = req.getParameter("tel");
            String address = req.getParameter("Address");

            User user = new User();
            user.setUserID(id);
            user.setUserName(userName);
            user.setF_Name(firstName);
            user.setL_Name(lastName);
            user.setEmail(email);
            user.setTelephone(tel);
            user.setAddress(address);
            user.setPassword("1234");
            user.setImg("profile.jpg");
            user.setType("Seller");
            user.setStatus("offline");
            SellerService service = new SellerServiceImpl();
            boolean add = service.update(user);

            if (add) {
                System.out.println("Updated");
            } else {
                System.out.println("error");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buttonType = req.getParameter("option");
        if (buttonType == null) {
            buttonType = "getAll";
        }
        switch (buttonType) {
            case "search":
                String userID = req.getParameter("userID");
                int id = Integer.parseInt(userID);
                try {
                    SellerService service = new SellerServiceImpl();
                    User search = service.search(id);
                    ArrayList<User> searchAll = new ArrayList<>();
                    searchAll.add(search);

                    req.setAttribute("userDetails", searchAll);
                    RequestDispatcher userDetails = req.getRequestDispatcher("/views/admin/seller.jsp");
                    userDetails.forward(req, resp);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getAll":
                try {
                    SellerService service = new SellerServiceImpl();
                    ArrayList<User> all = service.getAll();
                    req.setAttribute("userDetails", all);
                    RequestDispatcher userDetails = req.getRequestDispatcher("/views/admin/seller.jsp");
                    userDetails.forward(req, resp);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                doDelete(req, resp);
                break;
            default:
                break;
        }



    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        int id = Integer.parseInt(userID);
        try {
            SellerService service = new SellerServiceImpl();
            boolean delete = service.delete(id);

            if (delete) {
                System.out.println("Deleted");
            } else {
                System.out.println("error");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
