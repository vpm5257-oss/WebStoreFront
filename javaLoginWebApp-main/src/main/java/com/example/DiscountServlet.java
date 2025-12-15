package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/product")
public class DiscountServlet extends HttpServlet {

    private static final double PRICE = 120.00;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int qty = Integer.parseInt(req.getParameter("qty"));
        double discount = 0.0;

        if (qty >= 10) {
            discount = 0.10;
        } else if (qty >= 5) {
            discount = 0.05;
        }

        double subtotal = PRICE * qty;
        double finalPrice = subtotal - (subtotal * discount);

        String msg = String.format(
                "Quantity: %d<br/>Discount: %.0f%%<br/>Final Price: $%.2f",
                qty,
                discount * 100,
                finalPrice
        );

        req.setAttribute("result", msg);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}

