package servlet;

import model.Category;
import service.custom.CategoryService;
import service.custom.Impl.CategoryServiceImpl;
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
import java.sql.SQLException;
import java.util.ArrayList;

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
                    int id = Integer.parseInt(categoryId);
                    CategoryService categoryService = new CategoryServiceImpl();
                    Category search = categoryService.search(id);
                    JsonObjectBuilder subCategoryJson1 = Json.createObjectBuilder();
                    subCategoryJson1.add("id", search.getCategory_ID());
                    subCategoryJson1.add("name", search.getCategoryName());
                    response.getWriter().print(subCategoryJson1.build());
                    break;
                case "GetAll":
                    CategoryService categoryService2 = new CategoryServiceImpl();
                    ArrayList<Category> allCategory = categoryService2.getAll();
                    JsonArrayBuilder allCategoryJson = Json.createArrayBuilder();

                    for (Category category : allCategory) {

                        JsonObjectBuilder categoryJson = Json.createObjectBuilder();
                        int categoryID = category.getCategory_ID();
                        String categoryName = category.getCategoryName();
                        categoryJson.add("id", categoryID);
                        categoryJson.add("name", categoryName);

                        allCategoryJson.add(categoryJson.build());

                    }
                    PrintWriter writer1 = response.getWriter();
                    writer1.print(allCategoryJson.build());
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

        try {
            String categoryName = request.getParameter("categoryNameInput");
            Category category = new Category();
            category.setCategoryName(categoryName);
            CategoryService categoryService = new CategoryServiceImpl();

            boolean add = categoryService.add(category);
            response.getWriter().print(add);

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
            CategoryService categoryService = new CategoryServiceImpl();
            Category category = new Category();
            category.setCategory_ID(categoryID);
            category.setCategoryName(categoryName);
            boolean update = categoryService.update(category);
            resp.getWriter().print(update);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonReader reader = Json.createReader(req.getInputStream());
        JsonObject jsonObject = reader.readObject();
        String categoryID = jsonObject.getString("categoryId");
        int id = Integer.parseInt(categoryID);
        try {
            CategoryService categoryService = new CategoryServiceImpl();
            boolean delete = categoryService.delete(id);
            resp.getWriter().print(delete);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
