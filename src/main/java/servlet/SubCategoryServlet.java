package servlet;

import model.Category;
import model.SubCategory;
import service.SubCategoryService;
import serviceImpl.SubCategoryServiceImpl;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            Connection connection = DBConnection.getInstance().getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Sub_Category");
            ResultSet rst = pstm.executeQuery();
            ArrayList<Category> allCategory = new ArrayList<>();
            while (rst.next()) {
                Category category = new Category();
                category.setCategory_ID(rst.getInt(1));
                category.setName((rst.getString(2)));
                allCategory.add(category);
                System.out.println(rst.getInt(1));
                System.out.println(rst.getString(2));
            }
            System.out.println(allCategory);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int subCategoryID = Integer.parseInt(request.getParameter("categoryID"));
            String subCategoryName = request.getParameter("subCategoryName");
            System.out.println("servlet Sub " + subCategoryName);
            SubCategory subCategory = new SubCategory();
            subCategory.setCategory_ID(subCategoryID);
            subCategory.setSubCategoryName(subCategoryName);

            SubCategoryService subCategoryService = new SubCategoryServiceImpl();
            boolean addSubCategory = subCategoryService.addSubCategory(subCategory);
            if (addSubCategory) {
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
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
