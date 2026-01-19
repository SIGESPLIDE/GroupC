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



    	// 受け取った一覧をjspに渡す
    	req.setAttribute("stuInfoList", stuInfoList);

    	// 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 2つの入力欄から値を受け取る
        String searchId = req.getParameter("searchId");
        String searchName = req.getParameter("searchName");

        studentinfo_dao studentInfoDao = new studentinfo_dao();
        List<studentinfo> stuInfoList;

        // DAOの新しい複合検索メソッドを呼び出す
        // IDが空なら名前検索、名前が空ならID検索、両方あれば絞り込み、をDAO内で完結させる
        stuInfoList = studentInfoDao.search(searchId, searchName);

        // JSPへ結果を渡す
        req.setAttribute("stuInfoList", stuInfoList);
        // 入力値を保持させる（検索後に空にならないように）
        req.setAttribute("searchId", searchId);
        req.setAttribute("searchName", searchName);

        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
