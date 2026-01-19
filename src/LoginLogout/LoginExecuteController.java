package LoginLogout;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.password_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/loginlogout/loginexecute" })
public class LoginExecuteController extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// ログイン処理
		String pass = req.getParameter("password");

		password_dao dao = new password_dao();
		// DAOのメソッドを呼び出し
		int authId = dao.login(pass);

		if (authId != -1) {
			// ログイン成功：セッションに権限IDを保存
			HttpSession session = req.getSession();
			session.setAttribute("userAuth", authId);

			// メインメニューへ
			resp.sendRedirect(req.getContextPath() + "/loginlogout/mainmenu");
			} else {
			    // ログイン失敗
			    req.setAttribute("error", "パスワードが正しくありません。");
			    req.getRequestDispatcher("/LoginLogout/login.jsp").forward(req, resp);
			}

	}

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

}
