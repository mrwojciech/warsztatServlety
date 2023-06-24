package pl.coderslab;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/delete")
public class DeleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao userDao = new UserDao();
        userDao.delete(id);
        resp.sendRedirect("/user/list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("id");
        resp.getWriter().println("<form method='post'>");
        resp.getWriter().println("<button type='submit'> Are you sure?</button>");
        resp.getWriter().println("</form>");
        resp.getWriter().println("<form action='/user/list' method='get'>");
        resp.getWriter().println("<button type='submit'> Cancel?</button>");


    }
}
