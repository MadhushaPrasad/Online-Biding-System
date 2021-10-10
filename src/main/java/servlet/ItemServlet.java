package servlet;

import model.Item;
import service.custom.ItemService;
import service.custom.Impl.ItemServiceImpl;
import util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
			String buttonType = request.getParameter("option");
		
			switch (buttonType) {
				case "search":
					String ItemID = request.getParameter("itemID");
					int id = Integer.parseInt(ItemID);
					ItemService itemService1 = new ItemServiceImpl();
					try {
		
					Item itemSearch = itemService1.search(id);
					
		} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
				
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			ItemService itemService = new ItemServiceImpl();
			
			String category_ID = request.getParameter("categoryID");
			String name = request.getParameter("userName");
			String description = request.getParameter("description");
			String price = request.getParameter("amount");
			String image = request.getParameter("itemImage"); 
			
			int catID = Integer.parseInt(category_ID);
			int amount = Integer.parseInt(price);
			
			Item item = new Item();
			
			item.setCategory_ID(catID);
			item.setName(name);
			item.setDescription(description);
			item.setPrice(amount);
			item.setImage(image);
		
			boolean itemAdd = itemService.add(item);
			
			System.out.println(itemAdd);
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
try {
			
			ItemService itemService = new ItemServiceImpl();
			
			String ItemID = req.getParameter("itemID");
			String category_ID = req.getParameter("categoryID");
			String name = req.getParameter("userName");
			String description = req.getParameter("description");
			String price = req.getParameter("amount");
			String image = req.getParameter("itemImage"); 
			
			int catID = Integer.parseInt(category_ID);
			int amount = Integer.parseInt(price);
			int itemId = Integer.parseInt(ItemID);
			
			Item item = new Item();
			
			item.setItemID(itemId);
			item.setCategory_ID(catID);
			item.setName(name);
			item.setDescription(description);
			item.setPrice(amount);
			item.setImage(image);
		
			boolean itemUpdate = itemService.update(item);
			
			System.out.println(itemUpdate);
			
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
			
			System.out.println(itemDelete);
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	

}
