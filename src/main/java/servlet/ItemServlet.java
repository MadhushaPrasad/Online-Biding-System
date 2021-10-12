package servlet;

import model.Bid;
import model.Item;
import service.custom.BidService;
import service.custom.CategoryService;
import service.custom.Impl.BidServiceImpl;
import service.custom.Impl.CategoryServiceImpl;
import service.custom.ItemService;
import service.custom.Impl.ItemServiceImpl;
import util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ItemServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buttonType = request.getParameter("option");
        if (buttonType == null) {
            buttonType = "getAll";
        }
        switch (buttonType) {
            case "search":
                String iID = request.getParameter("itemID");
                int id = Integer.parseInt(iID);
                ItemService itemService1 = new ItemServiceImpl();
                try {
                    Item search = itemService1.search(id);
                    ArrayList<Item> all1 = new ArrayList<>();
                    all1.add(search);
                    request.setAttribute("itemDetails", all1);
                    RequestDispatcher bidDetails = request.getRequestDispatcher("/views/admin/item.jsp");
                    bidDetails.forward(request, response);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getAll":
                ItemService itemService = new ItemServiceImpl();
                try {
                    ArrayList<Item> all = itemService.getAll();
                    request.setAttribute("itemDetails", all);
                    RequestDispatcher itemDetails = request.getRequestDispatcher("/views/admin/item.jsp");
                    itemDetails.forward(request, response);
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getItemID":
                try {
                    ItemService itemService2 = new ItemServiceImpl();

                    ArrayList<Item> allItem = itemService2.getAll();
                    JsonArrayBuilder allitemJson = Json.createArrayBuilder();

                    for (Item item : allItem) {

                        JsonObjectBuilder itemJson = Json.createObjectBuilder();
                        int itemID = item.getItemID();
                        String itemName = item.getName();
                        itemJson.add("itemID", itemID);
                        itemJson.add("itemName", itemName);
                        allitemJson.add(itemJson.build());

                    }
                    System.out.println(allitemJson);
                    PrintWriter writer2 = response.getWriter();
                    writer2.print(allitemJson.build());
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                doDelete(request, response);
                break;
            default:
                break;
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String buttonType = request.getParameter("option");
        switch (buttonType) {
            case "submit":
                try {

                    String userID = request.getParameter("userID");
                    String category_ID = request.getParameter("categoryID");
                    String itemName = request.getParameter("itemName");
                    String description = request.getParameter("description");
                    String price = request.getParameter("amount");
                    String image = request.getParameter("itemImage");
                    image = "itemIcon.jpg";
                    String status = "running";

                    int catID = Integer.parseInt(category_ID);
                    double amount = Double.parseDouble(price);
                    int userId = Integer.parseInt(userID);

                    Item item = new Item();

                    item.setCategory_ID(catID);
                    item.setUserID(userId);
                    item.setName(itemName);
                    item.setDescription(description);
                    item.setPrice(amount);
                    item.setImage(image);
                    item.setStatus(status);

                    ItemService itemService = new ItemServiceImpl();
                    boolean itemAdd = itemService.add(item);

                    HttpSession session = request.getSession();
                    if (itemAdd) {
                        session.setAttribute("message", "true");
                        session.setAttribute("type", "add");
                        response.sendRedirect(request.getContextPath() + "/views/admin/item.jsp");
                    } else {
                        session.setAttribute("message", "false");
                        session.setAttribute("type", "add");
                        response.sendRedirect(request.getContextPath() + "/views/admin/item.jsp");
                    }

                } catch (ClassNotFoundException | SQLException e) {

                    e.printStackTrace();
                }
                break;
            case "update":
                doPut(request, response);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            String ItemID = req.getParameter("itemID");
            String userID = req.getParameter("userID");
            String category_ID = req.getParameter("categoryID");
            String itemName = req.getParameter("itemName");
            String description = req.getParameter("description");
            String price = req.getParameter("amount");
            String image = req.getParameter("itemImage");
            image = "itemIcon.jpg";
            String status = "running";

            int catID = Integer.parseInt(category_ID);
            double amount = Double.parseDouble(price);
            int itemId = Integer.parseInt(ItemID);
            int userId = Integer.parseInt(userID);

            Item item = new Item();

            item.setItemID(itemId);
            item.setCategory_ID(catID);
            item.setUserID(userId);
            item.setName(itemName);
            item.setDescription(description);
            item.setPrice(amount);
            item.setImage(image);
            item.setStatus(status);

            ItemService itemService = new ItemServiceImpl();
            boolean itemUpdate = itemService.update(item);
            HttpSession session = req.getSession();
            if (itemUpdate) {
                session.setAttribute("message", "true");
                session.setAttribute("type", "update");
                resp.sendRedirect(req.getContextPath() + "/views/admin/item.jsp");
            } else {
                session.setAttribute("message", "false");
                session.setAttribute("type", "update");
                resp.sendRedirect(req.getContextPath() + "/views/admin/item.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }

    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String ItemId = req.getParameter("itemID");
            int id = Integer.parseInt(ItemId);
            ItemService itemService = new ItemServiceImpl();

            boolean itemDelete = itemService.delete(id);
            HttpSession session = req.getSession();
            if (itemDelete) {
                session.setAttribute("message", "true");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/item.jsp");
            } else {
                session.setAttribute("message", "false");
                session.setAttribute("type", "delete");
                resp.sendRedirect(req.getContextPath() + "/views/admin/item.jsp");
            }


        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }
    }


}
