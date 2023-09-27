package com.onlinelearning.Services.Impl;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.onlinelearning.DAL.CartDAO;
import com.onlinelearning.DAL.Impl.CartDAOImpl;
import com.onlinelearning.Models.Cart;
import com.onlinelearning.Services.CartService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartServiceImpl implements CartService {

    private final CartDAO cartDAO = new CartDAOImpl();

    @Override
    public List<Cart> getCartsByUserId(Integer userId) {
        if (userId == null) {
            return null;
        }
        return cartDAO.getCartsByUserId(userId);
    }

    @Override
    public Cart getCartsByUserIdAndCourseId(Integer userId, Integer courseId) {
        if (userId == null || courseId == null) {
            return null;
        }
        return cartDAO.getCartByUserIdAndCourseId(userId, courseId);
    }

    private void validateCart(Cart cart) throws Exception {
        if (cartDAO.getCartByUserIdAndCourseId(cart.getUserId(), cart.getCourseId()) != null) {
            throw new Exception("Cart: " + cart + " is already exist!");
        }
    }

    @Override
    public Cart createCart(Cart cart) throws Exception {
        validateCart(cart);
        return cartDAO.createCart(cart);
    }

    @Override
    public Cart deleteCart(Cart cart) throws Exception {
        try {
            validateCart(cart);
        } catch (Exception ex) {
            return cartDAO.deleteCart(cart);
        }
        throw new Exception("Cart: " + cart + "doesn't exist");
    }

    @Override
    public List<Cart> getCartsFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        Gson gson = new Gson();
        List<Cart> carts = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("carts")) {
                    String cartsJson = cookie.getValue();
                    carts = gson.fromJson(cartsJson, new TypeToken<List<Cart>>() {
                    }.getType());
                    break;
                }
            }
        }
        return carts;
    }

    @Override
    public void addCartsToCookie(HttpServletResponse response, List<Cart> carts) {
        Gson gson = new Gson();
        String cartsJson = gson.toJson(carts);
        Cookie cartCookie = new Cookie("carts", cartsJson);
        cartCookie.setPath("/");    //For all pages in website
        cartCookie.setMaxAge(7 * 24 * 60 * 60); //7 days
        response.addCookie(cartCookie);
    }

    @Override
    public void removeCartsFromCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cartsCookie = request.getCookies();
        for (Cookie cookie : cartsCookie) {
            if (cookie.getName().equals("carts")) {
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                System.out.println("Remove success");
                break;
            }
        }
    }

}