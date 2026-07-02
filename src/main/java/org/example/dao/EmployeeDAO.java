package org.example.dao;

import org.example.model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO extends DBContext {

    public List<Employee> getEmployees() {

        List<Employee> list = new ArrayList<>();

        try {

            String sql = "select * from Employee";

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("salary")
                ));

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;

    }

    public void addEmployee(Employee e) {

        try {

            String sql = "insert into Employee values(?,?,?)";

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, e.getId());
            ps.setString(2, e.getName());
            ps.setDouble(3, e.getSalary());

            ps.executeUpdate();

        } catch (Exception ex) {

            ex.printStackTrace();

        }

    }

    public void updateEmployee(Employee e) {

        try {

            String sql = "update Employee set name=?,salary=? where id=?";

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, e.getName());
            ps.setDouble(2, e.getSalary());
            ps.setInt(3, e.getId());

            ps.executeUpdate();

        } catch (Exception ex) {

            ex.printStackTrace();

        }

    }

}