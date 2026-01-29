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

        // 未入力（空文字）をnullとして扱うための共通処理
        boolean isIdEmpty = (searchId == null || searchId.isEmpty());
        boolean isNameEmpty = (searchName == null || searchName.isEmpty());

        try {
            //  両方空の場合は全件検索
            if (isIdEmpty && isNameEmpty) {
                stuInfoList = studentInfoDao.selectAll();
            } else {
                // IDが入力されている場合のみ数値チェック
                if (!isIdEmpty) {
                    Integer.parseInt(searchId); // 数値でない場合はNumberFormatExceptionへ
                }

                // 検索実行
                stuInfoList = studentInfoDao.search(searchId, searchName);
            }

            // ヒット件数ゼロの判定
            if (stuInfoList == null || stuInfoList.isEmpty()) {
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
}
