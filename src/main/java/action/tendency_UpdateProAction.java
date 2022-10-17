package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tendency.*;

public class tendency_UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		     request.setCharacterEncoding("UTF-8");//한글처리
		     TendencyDTO tend=new TendencyDTO();
		     
		     //tend.setId_no(Integer.parseInt(request.getParameter("id_no")));
		     tend.setStarttime(request.getParameter("starttime"));
		     tend.setEndtime(request.getParameter("endtime"));
		     tend.setSleeptime(request.getParameter("sleeptime"));
		     tend.setShowertime(request.getParameter("showertime"));
		     tend.setSleepinghabbit(request.getParameter("sleepinghabbit"));
		     tend.setSmoking(request.getParameter("smoking"));
		     tend.setPet(request.getParameter("pet"));
		     System.out.println("Tendency_UpdateProAction에서 id_no=>"+request.getParameter("id_no"));
		     
		     TendencyDAO tenDao=new TendencyDAO();
		     boolean check=tenDao.updateTendency(tend);
		     
		     request.setAttribute("check", check);//데이터 수정성공유무
		     
		return "/free/tendency_updatePro.jsp";
	}
}