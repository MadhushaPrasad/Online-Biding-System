package servlet;

import model.Bid;
import service.custom.BidService;
import service.custom.Impl.BidServiceImpl;

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


@WebServlet("/bid")
public class BidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buttonType = req.getParameter("option");
        if (buttonType == null) {
            buttonType = "getAll";
        }
        switch (buttonType) {
            case "search":
                String bidID = req.getParameter("bidID");
                int id = Integer.parseInt(bidID);
                BidService bidService1 = new BidServiceImpl();
                try {
                    Bid search = bidService1.search(id);
                    ArrayList<Bid> all = new ArrayList<>();
                    all.add(search);
                    req.setAttribute("bidDetails", all);
                    RequestDispatcher bidDetails = req.getRequestDispatcher("/views/admin/bid.jsp");
                    bidDetails.forward(req, resp);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getAll":
                BidService bidService = new BidServiceImpl();
                try {
                    ArrayList<Bid> all1 = bidService.getAll();
                    for (Bid bid : all1) {
                        System.out.println(bid.getBid_ID());
                    }
                    req.setAttribute("bidDetails", all1);
                    RequestDispatcher bidDetails1 = req.getRequestDispatcher("/views/admin/bid.jsp");
                    bidDetails1.forward(req, resp);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buttonType = req.getParameter("option");
        switch (buttonType) {
            case "submit":
                try {
                    String userID = req.getParameter("userID");
                    String itemID = req.getParameter("itemId");
                    String amount = req.getParameter("amount");
                    int uid = Integer.parseInt(userID);
                    int itemId = Integer.parseInt(itemID);
                    double price = Double.parseDouble(amount);
                    String status = "running";

                    Bid bid = new Bid();
                    bid.setUserID(uid);
                    bid.setItemID(itemId);
                    bid.setAmount(price);
                    bid.setStatus(status);
                    System.out.println(userID);
                    System.out.println(itemID);
                    System.out.println(amount);
                    System.out.println(status);

                    BidService bidService = new BidServiceImpl();
                    boolean add = bidService.add(bid);
                    HttpSession session = req.getSession();
                    if (add) {
                        session.setAttribute("message", "true");
                        session.setAttribute("type", "add");
                        resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
                    } else {
                        session.setAttribute("message", "false");
                        session.setAttribute("type", "add");
                        resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
                    }

                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
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
            String bidID = req.getParameter("bidID");
            String itemID = req.getParameter("itemId");
            String amount = req.getParameter("amount");
            int id = Integer.parseInt(bidID);
            int uid = Integer.parseInt(userID);
            int itemId = Integer.parseInt(itemID);
            double price = Double.parseDouble(amount);
            String status = "running";

            Bid bid = new Bid();
            bid.setBid_ID(id);
            bid.setUserID(uid);
            bid.setItemID(itemId);
            bid.setAmount(price);
            bid.setStatus(status);

            BidService bidService = new BidServiceImpl();
            boolean update = bidService.update(bid);
            HttpSession session = req.getSession();
            if (update) {
                session.setAttribute("message", "true");
                session.setAttribute("type", "update");
                resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
            } else {
                session.setAttribute("message", "false");
                session.setAttribute("type", "update");
                resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bidID = req.getParameter("bidID");
            int id = Integer.parseInt(bidID);
            BidService bidService = new BidServiceImpl();

            boolean delete = bidService.delete(id);
            HttpSession session = req.getSession();
            if (delete) {
                session.setAttribute("message", "true");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
            } else {
                session.setAttribute("message", "false");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/bid.jsp");
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}

