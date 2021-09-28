package servlet;

import util.DBConnection;

import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buttonType = request.getParameter("option");

        try {
            Connection connection = DBConnection.getInstance().getConnection();
            switch (buttonType) {
                case "Search":
                    String categoryId = request.getParameter("categoryId");
                    PreparedStatement pst = connection.prepareStatement("SELECT * FROM category WHERE category_ID=?");
                    pst.setObject(1, categoryId);
                    ResultSet rst = pst.executeQuery();
                    JsonArrayBuilder categoryArray = Json.createArrayBuilder();
                    while (rst.next()) {
                        JsonObjectBuilder category = Json.createObjectBuilder();
                        int id = rst.getInt(1);
                        String name = rst.getString(2);
                        category.add("id", id);
                        category.add("name", name);
                        categoryArray.add(category.build());
                    }

                    PrintWriter writer = response.getWriter();
                    writer.print(categoryArray.build());
                    break;
                case "GetAll":
                    PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Category");
                    ResultSet rst1 = pstm.executeQuery();
                    JsonArrayBuilder categoryArray2 = Json.createArrayBuilder();
//                    ArrayList<Category> allCategory = new ArrayList<>();
                    while (rst1.next()) {
//                        Category category = new Category();
//                        category.setCategory_ID(rst.getInt(1));
//                        category.setName((rst.getString(2)));
//                        allCategory.add(category);
//                        System.out.println(rst.getInt(1));
//                        System.out.println(rst.getString(2));

                        JsonObjectBuilder category = Json.createObjectBuilder();
                        int id = rst1.getInt(1);
                        String name = rst1.getString(2);
                        category.add("id", id);
                        category.add("name", name);
                        categoryArray2.add(category.build());
                    }
                    PrintWriter writer2 = response.getWriter();
                    writer2.print(categoryArray2.build());
                    break;
                default:
                    break;
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        System.out.println(buttonType);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryName = request.getParameter("categoryNameInput");

        try {
            Connection connection = DBConnection.getInstance().getConnection();
            String sql = "INSERT INTO Category(categoryName) VALUES('" + categoryName + "')";
            PreparedStatement pstm = connection.prepareStatement(sql);
            int i = pstm.executeUpdate();
            if (i > 0) {
                response.getWriter().print("Category Added");
                System.out.println("Added");
            } else {
                response.getWriter().print("Error");
                System.out.println("Error");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonReader reader = Json.createReader(req.getInputStream());
        JsonObject jsonObject = reader.readObject();
        int categoryID = Integer.parseInt(jsonObject.getString("categoryID"));
        String categoryName = jsonObject.getString("categoryName");
        try {
            Connection connection = DBConnection.getInstance().getConnection();
            PreparedStatement pst = connection.prepareStatement("Update category set category_ID = ? ,categoryName=? WHERE category_ID=?");
            pst.setObject(1, categoryID);
            pst.setObject(2, categoryName);
            pst.setObject(3, categoryID);
            resp.getWriter().print((pst.executeUpdate() > 0));
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonReader reader = Json.createReader(req.getInputStream());
        JsonObject jsonObject = reader.readObject();
        String categoryID = jsonObject.getString("categoryId");
        System.out.println(categoryID);

        try {
            Connection connection = DBConnection.getInstance().getConnection();
            PreparedStatement pst = connection.prepareStatement("DELETE FROM Category WHERE category_ID=?");
            pst.setObject(1, categoryID);
            resp.getWriter().print(pst.executeUpdate() > 0);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
