package servlet;

import model.Bid;
import model.Item;
import model.User;
import service.custom.BidService;
import service.custom.Impl.BidServiceImpl;
import service.custom.Impl.ItemServiceImpl;
import service.custom.Impl.SellerServiceImpl;
import service.custom.ItemService;
import service.custom.SellerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/dashboard")
public class dashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SellerService service1 = new SellerServiceImpl();
        try {
            ArrayList<User> all = service1.getAll();
            req.setAttribute("userDetails", all);




            BidService bidService = new BidServiceImpl();

            ArrayList<Bid> all1 = bidService.getAll();
            for (Bid bid : all1) {
                System.out.println(bid.getBid_ID());
            }
            req.setAttribute("bidDetails", all1);



            ItemService itemService = new ItemServiceImpl();

            ArrayList<Item> all3 = itemService.getAll();
            req.setAttribute("itemDetails", all3);
            RequestDispatcher itemDetails = req.getRequestDispatcher("/views/admin/dashboard.jsp");
            itemDetails.forward(req, resp);


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
