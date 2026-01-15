package Keyword;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.keyword;
import Dao.keyword_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/keyword/keyword_register" })
public class keyword_register_controller extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// キーワード新規登録画面へ遷移
		req.getRequestDispatcher("/Keyword/keyword_register.jsp").forward(req, resp);

	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 登録処理
		// フォームからキーワードを取得
        String phrase = req.getParameter("keyword");

        // Beanにセット
        keyword k = new keyword();
        k.setPhrase(phrase);

        // DAOで保存
        keyword_dao dao = new keyword_dao();
        if (dao.insert(k)) {
            // 成功したら完了画面へ（合言葉 from=keyword_index を付ける）
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=keyword");
        }

	}

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// ログインしているかどうかの確認

	}

}
