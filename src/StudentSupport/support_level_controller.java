package StudentSupport;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.attendrecord;
import Bean.supportlevel;
import Dao.attendrecord_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

// 支援段階一覧のコントローラ

@WebServlet(urlPatterns = { "/studentsupport/support_level" })
public class support_level_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 支援段階一覧に使用
        req.getRequestDispatcher("/StudentSupport/support_level.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	int studentId = Integer.parseInt(req.getParameter("studentId"));

    	supportlevel_dao supLevDao = new supportlevel_dao();
    	// 支援段階を取得
    	 supportlevel supLev = supLevDao.idFilter(studentId);

    	 attendrecord_dao attRecoDao = new attendrecord_dao();
    	 attendrecord attReco = attRecoDao.idFilter(studentId);

    	req.setAttribute("supLev", supLev);
    	req.setAttribute("attReco", attReco);

    	// 支援段階に使用
    	req.getRequestDispatcher("/StudentSupport/support_level.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
