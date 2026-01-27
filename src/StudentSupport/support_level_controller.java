package StudentSupport;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.attendrecord;
import Bean.supportlevel;
import Dao.attendrecord_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/studentsupport/support_level", "/studentsupport/support_level_update" })
public class support_level_controller extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	    // 戻るボタンでも、IDがあればデータを取得するようにする
	    String studentIdStr = req.getParameter("studentId");

	    if (studentIdStr != null) {
	        int studentId = Integer.parseInt(studentIdStr);
	        supportlevel_dao supLevDao = new supportlevel_dao();

	        // DBから最新情報を取得してセット
	        supportlevel supLev = supLevDao.idFilter(studentId);
	        attendrecord_dao attRecoDao = new attendrecord_dao();
	        attendrecord attReco = attRecoDao.idFilter(studentId);

	        req.setAttribute("supLev", supLev);
	        req.setAttribute("attReco", attReco);
	    }

	    req.getRequestDispatcher("/StudentSupport/support_level.jsp").forward(req, resp);
	}

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String servletPath = req.getServletPath();

        String studentIdStr = req.getParameter("studentId");
        if (studentIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/studentinfo/studentinfo_list");
            return;
        }
        int studentId = Integer.parseInt(studentIdStr);

        supportlevel_dao supLevDao = new supportlevel_dao();

        if ("/studentsupport/support_level_update".equals(servletPath)) {
            int updateValue = Integer.parseInt(req.getParameter("updateValue"));
            supLevDao.change(studentId, updateValue);

            // 変更完了画面に遷移
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=support&studentId=" + studentId);
            return;
        }

        supportlevel supLev = supLevDao.idFilter(studentId);
        attendrecord_dao attRecoDao = new attendrecord_dao();
        attendrecord attReco = attRecoDao.idFilter(studentId);

        req.setAttribute("supLev", supLev);
        req.setAttribute("attReco", attReco);

        req.getRequestDispatcher("/StudentSupport/support_level.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    }
}