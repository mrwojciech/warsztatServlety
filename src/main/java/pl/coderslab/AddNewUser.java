package pl.coderslab;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/add")
public class AddNewUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/*
        req.setAttribute("id", req.getParameter("id"));
        getServletContext().getRequestDispatcher("/a")
*/
        getServletContext().getRequestDispatcher("/addUser.jsp").forward(req,resp);
//        resp.sendRedirect("/addUser.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        //resp.getWriter().println("Name: " + name + " email: " + email + " Password: " + password);
        UserDao userDao = new UserDao();
        userDao.create(new User(name, email, password));
        resp.sendRedirect("/user/list");

    }
}
