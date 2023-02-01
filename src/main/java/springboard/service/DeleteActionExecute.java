package springboard.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;

@Service
public class DeleteActionExecute implements IBoardService {
	
	@Autowired
	JDBCTemplateDAO dao;
	
	@Override
	public void execute(Model model) {
		
		//모든 요청을 한꺼번에 받아온다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//일련번호와 패스워드를 파라미터로 받아온다.
		String idx= req.getParameter("idx");
		String pass= req.getParameter("pass");
		
		boolean isDelete = dao.deleteConfirm(idx);
		
		if(isDelete==true) {
			//답변글이 없다면 즉시 삭제한다.
			dao.delete(idx, pass);
		}
		else {
			System.out.println("삭제할 수 없습니다.");
		}
		
	}
}
