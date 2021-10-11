package servlet;

import model.Bid;
import model.User;
import service.custom.BidService;
import service.custom.Impl.BidServiceImpl;
import service.custom.Impl.SellerServiceImpl;
import service.custom.SellerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@MultipartConfig(location = "D:\\SLIIT\\Computing\\2nd Year\\1st Sem\\OOP\\Online-Biding-System\\src\\main\\webapp\\assets\\uploadImg",
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/seller")
public class SellerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buttonType = req.getParameter("option");
        switch (buttonType) {
            case "submit":

                String userName = req.getParameter("userName");
                String firstName = req.getParameter("firstName");
                String lastName = req.getParameter("lastName");
                String email = req.getParameter("email");
                String tel = req.getParameter("tel");
                String address = req.getParameter("Address");

                //image uploading part
                Part part = req.getPart("file");
                String fileName = extractFileName(part);
                String filePath = "D:\\SLIIT\\Computing\\2nd Year\\1st Sem\\OOP\\Online-Biding-System\\src\\main\\webapp\\assets\\uploadImg";
                if (fileName != "") {
                    String savePath = filePath + File.separator + fileName;
                    File fileSaveDir = new File(savePath);
                    part.write(savePath);

                    try {
                        User user = new User();
                        user.setUserName(userName);
                        user.setF_Name(firstName);
                        user.setL_Name(lastName);
                        user.setEmail(email);
                        user.setTelephone(tel);
                        user.setAddress(address);
                        user.setPassword("1234");
                        user.setImg(fileName);
                        user.setType("Seller");
                        user.setStatus("offline");
                        SellerService service = new SellerServiceImpl();
                        boolean add = service.add(user);
                        HttpSession session = req.getSession();
                        if (add) {
                            session.setAttribute("message", "true");
                            session.setAttribute("type", "add");
                            resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
                        } else {
                            session.setAttribute("message", "false");
                            session.setAttribute("type", "add");
                            resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
                        }

                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    }

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


        String userID = req.getParameter("pSellerID");
        int id = Integer.parseInt(userID);
        String userName = req.getParameter("userName");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel");
        String address = req.getParameter("Address");

        //image uploading part
        Part part = req.getPart("file");
        String fileName = extractFileName(part);
        String filePath = "D:\\SLIIT\\Computing\\2nd Year\\1st Sem\\OOP\\Online-Biding-System\\src\\main\\webapp\\assets\\uploadImg";
        if (fileName != "") {
            String savePath = filePath + File.separator + fileName;
            File fileSaveDir = new File(savePath);
            part.write(savePath);

            try {
                User user = new User();
                user.setUserID(id);
                user.setUserName(userName);
                user.setF_Name(firstName);
                user.setL_Name(lastName);
                user.setEmail(email);
                user.setTelephone(tel);
                user.setAddress(address);
                user.setPassword("1234");
                user.setImg(fileName);
                user.setType("Seller");
                user.setStatus("offline");
                SellerService service = new SellerServiceImpl();
                boolean update = service.update(user);

                HttpSession session = req.getSession();
                if (update) {
                    session.setAttribute("message", "true");
                    session.setAttribute("type", "update");
                    resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
                } else {
                    session.setAttribute("message", "false");
                    session.setAttribute("type", "update");
                    resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
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
                String userID = req.getParameter("sellerId");
                int id = Integer.parseInt(userID);
                try {
                    SellerService service = new SellerServiceImpl();
                    User search = service.search(id);
                    ArrayList<User> searchAll = new ArrayList<>();
                    searchAll.add(search);
                    req.setAttribute("userDetails", searchAll);
                    RequestDispatcher userDetails1 = req.getRequestDispatcher("/views/admin/seller.jsp");
                    userDetails1.forward(req, resp);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getAll":
                SellerService service1 = new SellerServiceImpl();
                try {
                    ArrayList<User> all = service1.getAll();
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
        String userID = req.getParameter("sellerId");
        int id = Integer.parseInt(userID);
        try {
            SellerService service = new SellerServiceImpl();
            boolean delete = service.delete(id);
            HttpSession session = req.getSession();
            if (delete) {
                session.setAttribute("message", "true");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
            } else {
                session.setAttribute("message", "false");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/seller.jsp");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] item = contentDisp.split(";");
        for (String s : item) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
