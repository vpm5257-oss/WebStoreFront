package com.example;

import entity.ProductDAO;
import entity.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ProductServlet extends HttpServlet {
    private ProductDAO dao;

    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:8080/yourdb", "user", "password"
            );
            dao = new ProductDAO(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "create":
                    Product newProduct = new Product(
                            0,
                            request.getParameter("product_name"),
                            request.getParameter("product_description"),
                            request.getParameter("product_color"),
                            Integer.parseInt(request.getParameter("product_size")),
                            Double.parseDouble(request.getParameter("product_price"))
                    );
                    dao.addProduct(newProduct);
                    break;
                case "update":
                    Product updatedProduct = new Product(
                            Integer.parseInt(request.getParameter("product_id")),
                            request.getParameter("product_name"),
                            request.getParameter("product_description"),
                            request.getParameter("product_color"),
                            Integer.parseInt(request.getParameter("product_size")),
                            Double.parseDouble(request.getParameter("product_price"))
                    );
                    dao.updateProduct(updatedProduct);
                    break;
                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.deleteProduct(id);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
        response.sendRedirect("read.jsp");
    }

    public class AppContextListener implements ServletContextListener {
        @Override
        public void contextInitialized(ServletContextEvent sce) {
            try {
                // Example: MySQL connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/yourdb", "user", "password"
                );

                ProductDAO dao = new ProductDAO(conn);
                sce.getServletContext().setAttribute("productDAO", dao);

            } catch (Exception e) {
                throw new RuntimeException("Failed to initialize DAO", e);
            }
        }

        @Override
        public void contextDestroyed(ServletContextEvent sce) {
            // close connection if needed
        }
    }

}
