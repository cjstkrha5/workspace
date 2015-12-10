package java76.pms.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import java76.pms.dao.ProjectDao;
import java76.pms.domain.Project;

public class ProjectAddServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  try {
			response.setContentType("text/html;charset=UTF-8");

			Project project = new Project();
			project.setTitle(request.getParameter("title"));
			project.setStartDate(Date.valueOf(request.getParameter("startDate")));
			project.setEndDate(Date.valueOf(request.getParameter("endDate")));
			project.setMember(request.getParameter("memger"));
			
			ApplicationContext iocContainer = (ApplicationContext) this.getServletContext()
					.getAttribute("iocContainer");
			ProjectDao projectDao = iocContainer.getBean(ProjectDao.class);

			if(projectDao.insert(project) > 0) {
				response.sendRedirect("list");
				return;
			}

			request.setAttribute("errorCode", "401");
			response.setContentType("text/html;charset=UTF-8");

			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectAuthError.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			request.setAttribute("errorCode", "401");
			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectAuthError.jsp");
			rd.include(request, response);
		}
  }

}
