package servlet;

import model.Category;
import model.SubCategory;
import service.custom.CategoryService;
import service.custom.Impl.CategoryServiceImpl;
import service.custom.Impl.SubCategoryServiceImpl;
import service.custom.SubCategoryService;

import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/subCategory")
public class SubCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SubCategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String buttonType = request.getParameter("option");

            switch (buttonType) {
                case "Search":
                    String subcategoryID = request.getParameter("subCategoryId");
                    int id = Integer.parseInt(subcategoryID);
                    SubCategoryService subCategoryService1 = new SubCategoryServiceImpl();
                    SubCategory search = subCategoryService1.search(id);
                    JsonObjectBuilder subCategoryJson1 = Json.createObjectBuilder();
                    subCategoryJson1.add("subCategoryID", search.getSubCategory_ID());
                    subCategoryJson1.add("categoryID", search.getCategory_ID());
                    subCategoryJson1.add("subCategoryName", search.getSubCategoryName());
                    response.getWriter().print(subCategoryJson1.build());
                    break;
                case "GetAll":
                    SubCategoryService subCategoryService = new SubCategoryServiceImpl();
                    ArrayList<SubCategory> allSubCategory = subCategoryService.getAll();
                    JsonArrayBuilder allSubCategoryJson = Json.createArrayBuilder();

                    for (SubCategory subCategory : allSubCategory) {

                        JsonObjectBuilder subCategoryJson = Json.createObjectBuilder();
                        int subCategoryID = subCategory.getSubCategory_ID();
                        int categoryID = subCategory.getCategory_ID();
                        String subCategoryName = subCategory.getSubCategoryName();
                        subCategoryJson.add("subCategoryID", subCategoryID);
                        subCategoryJson.add("categoryID", categoryID);
                        subCategoryJson.add("subCategoryName", subCategoryName);
                        allSubCategoryJson.add(subCategoryJson.build());

                    }
                    PrintWriter writer1 = response.getWriter();
                    writer1.print(allSubCategoryJson.build());
                    break;
                case "getCategoryID":
                    CategoryService categoryService = new CategoryServiceImpl();
                    ArrayList<Category> allCategory = categoryService.getCatageryNameList();
                    JsonArrayBuilder allCategoryJson = Json.createArrayBuilder();

                    for (Category category : allCategory) {

                        JsonObjectBuilder categoryJson = Json.createObjectBuilder();
                        int categoryID = category.getCategory_ID();
                        String categoryName = category.getCategoryName();
                        categoryJson.add("categoryID", categoryID);
                        categoryJson.add("categoryName", categoryName);
                        allCategoryJson.add(categoryJson.build());


                    }
                    PrintWriter writer2 = response.getWriter();
                    writer2.print(allCategoryJson.build());
                default:
                    break;
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int subCategoryID = Integer.parseInt(request.getParameter("categoryID"));
            String subCategoryName = request.getParameter("subCategoryName");
            SubCategory subCategory = new SubCategory();
            subCategory.setCategory_ID(subCategoryID);
            subCategory.setSubCategoryName(subCategoryName);

            SubCategoryService subCategoryService = new SubCategoryServiceImpl();
            boolean addSubCategory = subCategoryService.add(subCategory);
            if (addSubCategory) {
                response.getWriter().print(true);
                System.out.println("Added");
            } else {
                response.getWriter().print(false);
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
        String subCategoryID = jsonObject.getString("subCategoryID");
        String categoryID = jsonObject.getString("categoryID");
        String subCategoryName = jsonObject.getString("subCategoryName");
        int id = Integer.parseInt(subCategoryID);
        int categoryId = Integer.parseInt(categoryID);

        try {

            System.out.println(subCategoryID);
            System.out.println(categoryID);
            SubCategoryService subCategoryService = new SubCategoryServiceImpl();
            SubCategory subCategory = new SubCategory();
            subCategory.setSubCategory_ID(id);
            subCategory.setCategory_ID(categoryId);
            subCategory.setSubCategoryName(subCategoryName);
            boolean updateSubCategory = subCategoryService.update(subCategory);
            if (updateSubCategory) {
                resp.getWriter().print(true);
                System.out.println("Updated");
            } else {
                resp.getWriter().print(false);
                System.out.println("Not Updated");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonReader reader = Json.createReader(req.getInputStream());
        JsonObject jsonObject = reader.readObject();
        String subCategoryID = jsonObject.getString("subCategory");
        int id = Integer.parseInt(subCategoryID);
        try {
            SubCategoryService subCategoryService = new SubCategoryServiceImpl();
            System.out.println(subCategoryID);
            boolean deleteSubCategory = subCategoryService.delete(id);
            if (deleteSubCategory) {
                resp.getWriter().print(true);
                System.out.println("Added");
            } else {
                resp.getWriter().print(false);
                System.out.println("Error");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
