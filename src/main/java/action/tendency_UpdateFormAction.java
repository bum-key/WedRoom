package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import free.board.*;
import tendency.*;

public class tendency_UpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		  int id_no=Integer.parseInt(request.getParameter("id_no"));//게시물번호
		 
		  TendencyDAO tenDao=new TendencyDAO();
		  TendencyDTO tend=tenDao.getTendency(id_no);
		  
		  //2.서버의 메모리에 저장
		  request.setAttribute("tend",tend);
		
		return "/free/free_updateForm.jsp";
	}
}
