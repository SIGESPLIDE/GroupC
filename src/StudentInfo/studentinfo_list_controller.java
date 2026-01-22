package StudentInfo;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.studentinfo_dao;
import tool.CommonServlet;

// 生徒情報一覧のコントローラ

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_list" })
public class studentinfo_list_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// daoを起動し、生徒情報一覧を取得
    	studentinfo_dao studentInfoDao = new studentinfo_dao();
    	List<studentinfo> stuInfoList = studentInfoDao.selectAll();

    	// 学生情報が一つも存在していない場合
    	if (stuInfoList.isEmpty()) {
    		req.setAttribute("emptyError", "まだ学生情報が存在していません");
    	}

    	// 受け取った一覧をjspに渡す
    	req.setAttribute("stuInfoList", stuInfoList);

    	// 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 入力値の受け取り
        String searchId = req.getParameter("searchId");
        String searchName = req.getParameter("searchName");

        studentinfo_dao studentInfoDao = new studentinfo_dao();
        List<studentinfo> stuInfoList = null;

        try {
            // 数値チェック
            // IDが入力されている場合のみ、数値として正しいかチェックする
            if (searchId != null && !searchId.isEmpty()) {
                Integer.parseInt(searchId);
            }

            // 検索実行
            stuInfoList = studentInfoDao.search(searchId, searchName);

            // ヒット件数ゼロの判定
            if (stuInfoList.isEmpty()) {
                req.setAttribute("searchMessage", "検索に引っかかりませんでした");
            }

        } catch (NumberFormatException e) {
            // IDに文字が入っていた場合のエラー処理
            req.setAttribute("errorMessage", "生徒IDには数値を入力してください");
            stuInfoList = studentInfoDao.selectAll();
        }



        // 結果をJSPに届ける
        req.setAttribute("stuInfoList", stuInfoList);
        req.setAttribute("searchId", searchId);
        req.setAttribute("searchName", searchName);

        // 一覧画面へ戻る
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
