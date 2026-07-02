package org.example.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.example.dao.EmployeeDAO;
import org.example.model.Employee;

import java.io.IOException;
import java.util.List;

@WebServlet("/employees")
public class EmployeeServlet extends HttpServlet {

    EmployeeDAO dao = new EmployeeDAO();
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Employee> list = dao.getEmployees();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        resp.getWriter().write(gson.toJson(list));
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Employee e = gson.fromJson(req.getReader(), Employee.class);

        dao.addEmployee(e);

        resp.getWriter().write("Add Success");
    }
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Employee e = gson.fromJson(req.getReader(), Employee.class);

        dao.updateEmployee(e);

        resp.getWriter().write("Update Success");
    }

}