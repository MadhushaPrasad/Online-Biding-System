package servlet;

import model.SubCategory;
import service.SubCategoryService;
import serviceImpl.SubCategoryServiceImpl;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
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
            SubCategoryService subCategoryService = new SubCategoryServiceImpl();
            ArrayList<SubCategory> allSubCategory = subCategoryService.getAllSubCategory();
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
            PrintWriter writer = response.getWriter();
            writer.print(allSubCategoryJson.build());


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
            boolean addSubCategory = subCategoryService.addSubCategory(subCategory);
            if (addSubCategory) {
                response.getWriter().print("true");
                System.out.println("Added");
            } else {
                response.getWriter().print("false");
                System.out.println("Error");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
