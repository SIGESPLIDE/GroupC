package LoginLogout;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.attendrecord_dao;
import Dao.password_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/loginlogout/loginexecute" })
public class LoginExecuteController extends CommonServlet {

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String pass = req.getParameter("password");

        password_dao dao = new password_dao();
        int authId = dao.login(pass);

        if (authId != -1) {
            // ログイン成功：セッションに権限IDを保存
            HttpSession session = req.getSession();
            session.setAttribute("userAuth", authId);

            // 昨日までの統計情報を自動計算して更新
            attendrecord_dao attRecoDao = new attendrecord_dao();
            try {
                attRecoDao.updateAttendStats(authId);
            } catch (Exception e) {
            	// ログ出力（ログイン処理は続行）
                e.printStackTrace();
            }

            // メイン画面へ遷移
            resp.sendRedirect(req.getContextPath() + "/loginlogout/mainmenu");
        } else {
            // ログイン失敗
            req.setAttribute("error", "パスワードが正しくありません。");
            req.getRequestDispatcher("/LoginLogout/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }
}