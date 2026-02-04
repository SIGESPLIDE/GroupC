package LoginLogout;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.CommonServlet;

@WebServlet(urlPatterns = { "/loginlogout/logout" })
public class LogoutController extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// ログアウト処理
		// セッションを取得
		HttpSession session = req.getSession(false);

		if (session != null) {
			// セッションそのものを無効化（破棄）する
			session.invalidate();
		}

		// ログイン画面へリダイレクト（URLを確実に上書きする）
		resp.sendRedirect(req.getContextPath() + "/LoginLogout/login.jsp");
	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

}
