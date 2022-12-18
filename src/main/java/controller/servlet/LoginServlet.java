package controller.servlet;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import repository.UserRepositoryImpl;
import service.UserService;
import service.UserServiceImpl;
import java.io.IOException;

import static utils.ParameterNames.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/templates/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();

        String login = req.getParameter(LOGIN.getName());
        String password = req.getParameter(PASSWORD.getName());

        User user = new User(login, password);
        UserService userService = new UserServiceImpl(
                new UserRepositoryImpl()
        );

        if (userService.isRegistered(user)) {
            httpSession.setAttribute(IS_LOGGED_IN.getName(), true);

            String token = userService.generateAuthToken();

            httpSession.setAttribute(AUTH_TOKEN.getName(), token);
            Cookie authCookie = new Cookie(AUTH_TOKEN.getName(), token);

            resp.addCookie(authCookie);
            resp.sendRedirect("/success");
        }
        else {
            httpSession.setAttribute(IS_LOGGED_IN.getName(), false);

            req.setAttribute("loginError", true);
            req.getRequestDispatcher("WEB-INF/templates/login.jsp").forward(req,resp);
        }
    }
}
