package com.onlinelearning.Controllers.Instructor;

import com.onlinelearning.Models.User;
import com.onlinelearning.Services.Impl.UserServiceImpl;
import com.onlinelearning.Services.UserService;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="InstructorSearchLearner", urlPatterns={"/search-learner"})
public class InstructorSearchLearner extends HttpServlet {
    
    private final UserService userService = new UserServiceImpl();
    
     private static final String VIEW_PATH = "/dashboard/instructor/learner-manage.jsp";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    } 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String userName = request.getParameter("userName");
        System.out.println(userName);
        List<User> learnerList = new ArrayList<>();
        User learner = userService.getUserByUsername(userName);
        learnerList.add(learner);
        System.out.println(learnerList);
        request.setAttribute("learnerList", learnerList);
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

}