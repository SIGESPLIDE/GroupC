package Password;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.password;
import Dao.password_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/password/administrator_password" })
public class administrator_password_controller extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 管理者パスワード変更画面への遷移
		req.getRequestDispatcher("/Password/administrator_password.jsp").forward(req, resp);

	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 管理者パスワードの変更
		String newPass = req.getParameter("newPassword");

	    password p = new password();
	    p.setPassword(newPass);
	    password_dao dao = new password_dao();

	    // 管理者(ID=1)を更新
	    if (dao.updateAdminPass(p)) {
	        // 成功したら完了画面へ
	        resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=admin");
	    }

	}

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

}
