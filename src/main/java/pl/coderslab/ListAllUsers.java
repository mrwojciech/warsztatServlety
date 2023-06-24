package pl.coderslab;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/list")
public class ListAllUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/*
        resp.setContentType("text/html");
        resp.getWriter().println("lista wszystkich uzytkownikow");
        resp.getWriter().println("<br>");
        resp.getWriter().println("<form action='/user/add' method='get'>");

        resp.getWriter().println("<button type='submit'> Dodaj</button>");
        resp.getWriter().println("</form>");
        resp.getWriter().println("<br>");
*/

        UserDao userDao = new UserDao();
        List<User> users = userDao.findAll();

        req.setAttribute("users", users);
        getServletContext().getRequestDispatcher("/showAllUsers.jsp").forward(req, resp);

/*
        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            resp.getWriter().print(user);
            resp.getWriter().print(String.format("<a href='/user/edit?id=%s' />Edytuj </a>", user.getId()));
            resp.getWriter().print(String.format("<a href='/user/delete?id=%s' />Usun </a>", user.getId()));
            resp.getWriter().print(String.format("<a href='/user/show?id=%s' />Zobacz </a>", user.getId()));
            resp.getWriter().println("<br>");

        }
*/
    }
}
