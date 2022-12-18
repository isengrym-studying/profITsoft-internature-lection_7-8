package controller.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserRepositoryImpl;
import service.UserService;
import service.UserServiceImpl;

import java.io.IOException;

public class UsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl(
                new UserRepositoryImpl()
        );

        req.setAttribute("users", userService.findAll());
        req.getRequestDispatcher("WEB-INF/templates/users.jsp").forward(req, resp);
    }
}
