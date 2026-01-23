package tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * CoomonServlet extends HttpServlet 全サーブレット共通の処理を表す抽象クラス
 *
 */
public abstract class CommonServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            // 最初の入口を設定
			// ここでログインしているかどうかの確認をする
            execute(req, resp);

            // execute内でリダイレクト（ログイン画面へ飛ばす等）が行われた場合は
            // すでにレスポンスが「確定」しているので、後続の処理を行わない
            if (!resp.isCommitted()) {
                get(req, resp);
            }
        } catch (Exception e) {
        	// 開発用エラー表示
            PrintWriter out = resp.getWriter();
            e.printStackTrace(out);

            // 本番用エラー表示
         	// e.printStackTrace();
         	// resp.sendRedirect("/shop/error");
        }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            // 最初の入口を設定
            execute(req, resp);

            if (!resp.isCommitted()) {
                post(req, resp);
            }
        } catch (Exception e) {
        	// 開発用エラー表示
            PrintWriter out = resp.getWriter();
            e.printStackTrace(out);

            // 本番用エラー表示
         	// e.printStackTrace();
         	// resp.sendRedirect("/shop/error");
        }
	}

	/**
	 * ページごとのGETの処理を記述
	 *
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	protected abstract void get(HttpServletRequest req, HttpServletResponse resp) throws Exception;

	/**
	 * ページごとのPOSTの処理を記述
	 *
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	protected abstract void post(HttpServletRequest req, HttpServletResponse resp) throws Exception;

	/**
     * 【デフォルトの共通処理】
     * ログインしていない場合はログイン画面へリダイレクトする
     */
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        // セッションに userAuth がなければログイン画面へ
        if (session.getAttribute("userAuth") == null) {
            resp.sendRedirect(req.getContextPath() + "/loginlogout/login");
        }
    }
}
