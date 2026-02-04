package StudentSupport;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.attendrecord_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/studentsupport/support_level", "/studentsupport/support_level_update" })
public class support_level_controller extends CommonServlet {
	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// POST経由で来た場合もGET経由で来た場合も、ここでIDを受け取る
		String studentIdStr = req.getParameter("studentId");

		if (studentIdStr != null) {
			// 生徒IDとDAOのセット
			int studentId = Integer.parseInt(studentIdStr);
			supportlevel_dao supLevDao = new supportlevel_dao();
			attendrecord_dao attRecoDao = new attendrecord_dao();

			// データの取得とセット
			req.setAttribute("supLev", supLevDao.idFilter(studentId));
			req.setAttribute("attReco", attRecoDao.idFilter(studentId));
		}

		// 支援段階画面へ遷移
		req.getRequestDispatcher("/StudentSupport/support_level.jsp").forward(req, resp);
	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String servletPath = req.getServletPath();
		String studentIdStr = req.getParameter("studentId");

		// 更新処理の場合
		if ("/studentsupport/support_level_update".equals(servletPath)) {
			// 生徒IDの取得
			int studentId = Integer.parseInt(studentIdStr);
			// DAOのインスタンス化
			supportlevel_dao supLevDao = new supportlevel_dao();
			// 支援段階の値取得
			int updateValue = Integer.parseInt(req.getParameter("updateValue"));
			supLevDao.change(studentId, updateValue);

			resp.sendRedirect(
					req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=support&studentId=" + studentId);
			return;
		}

		// 更新目的ではない場合はGETで処理
		get(req, resp);
	}
}