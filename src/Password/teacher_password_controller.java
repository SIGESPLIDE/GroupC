package Password;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.password;
import Dao.password_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/password/teacher_password" })
public class teacher_password_controller extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 別室担任パスワード変更画面に遷移
		req.getRequestDispatcher("/Password/teacher_password.jsp").forward(req, resp);

	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 別室担任パスワードの変更処理
		String newPass = req.getParameter("newPassword");

	    password p = new password();
	    p.setPassword(newPass);
	    password_dao dao = new password_dao();

	    // 別室担任(ID=2)を更新
	    if (dao.updateRoomTPass(p)) {
	        // 成功したら完了画面へ。目印(?from=teacher)を付ける
	        resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=teacher");
	    }

	}

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// ログインされているかのチェック

	}

}
