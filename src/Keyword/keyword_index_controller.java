package Keyword;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.keyword;
import Dao.keyword_dao;
import tool.CommonServlet;

//キーワード一覧のコントローラ

@WebServlet(urlPatterns = { "/keyword/keyword_index" })
public class keyword_index_controller extends CommonServlet {

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// DAOのインスタンス化
		keyword_dao dao = new keyword_dao();
		// キーワードの取得
		List<keyword> keywordList = dao.findAll();
		// 保存
		req.setAttribute("keywords", keywordList);
		// キーワード一覧画面へ遷移
		req.getRequestDispatcher("/Keyword/keyword_index.jsp").forward(req, resp);

	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 削除処理
		// フォームから削除したいキーワードのIDを取得
		String idStr = req.getParameter("id");

		if (idStr != null) {
			int id = Integer.parseInt(idStr);

			// DAOを呼んで削除実行
			keyword_dao dao = new keyword_dao();
			if (dao.delete(id)) {
				// 成功したら完了画面へ
				resp.sendRedirect(req.getContextPath() + "/ModalCompletion/delete_completed.jsp?from=keyword");
			}
		}

	}
}
