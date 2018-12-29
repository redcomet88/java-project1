package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Employee;
import daoImpl.EmployeeDaoImpl;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String employeeName = request.getParameter("employeeName");
		String employeePassword = request.getParameter("employeePassword");
		if ("anonymous".equals(employeeName) ||check(employeeName, employeePassword)) {
			if("anonymous".equals(employeeName)) {
				Employee emp = new Employee();
				emp.setEmployeeName("游客（匿名登录）");
				request.getSession().setAttribute("employee", emp);// 将employee保存到session
				request.setAttribute("employee", emp);
			}
			else{
				request.getSession().setAttribute("employee", new EmployeeDaoImpl().findEmployeeByName(employeeName));// 将employee保存到session
				request.setAttribute("employee", new EmployeeDaoImpl().findEmployeeByName(employeeName));
			}
			if("admin".equals(employeeName) ){
				response.sendRedirect("layui.html");
			} else
			{
				response.sendRedirect("nineindex.jsp");
			}
		} else {
			request.setAttribute("error", "账号或者密码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

	protected boolean check(String employeeName, String employeePassword) {
		EmployeeDaoImpl employeeDaoImpl = new EmployeeDaoImpl();
		if (employeeDaoImpl.findEmployeeByName(employeeName) == null
				|| !(employeeDaoImpl.findEmployeeByName(employeeName).getEmployeePassword().equals(employeePassword))) {
			return false;
		}
		return true;
	}

}
