package controller.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

import static utils.ParameterNames.AUTH_TOKEN;

public class AuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Optional<String> sessionAuthToken = readAuthTokenFromSession(request);
        Optional<Cookie> authTokenCookie = readAuthTokenCookie(request);

        if (sessionAuthToken.isEmpty() || authTokenCookie.isEmpty()
                || tokensDoNotMatch(sessionAuthToken.get(), authTokenCookie.get().getValue()))
            response.sendRedirect("/login");
        else
            filterChain.doFilter(servletRequest, servletResponse);

    }

    private static Optional<String> readAuthTokenFromSession(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        return Optional.ofNullable((String)httpSession.getAttribute(AUTH_TOKEN.getName()));
    }

    private static Optional<Cookie> readAuthTokenCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        return Arrays.stream(cookies)
                .filter(cookie -> AUTH_TOKEN.getName().equals(cookie.getName()))
                .findFirst();
    }

    private boolean tokensDoNotMatch(String realToken, String requestToken) {
        return !realToken.equals(requestToken);
    }
}
