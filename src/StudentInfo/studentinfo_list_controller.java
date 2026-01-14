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
    	// 検索バーに入力された値の受け取り
    	String search = req.getParameter("search");
    	// true=ID検索
    	boolean conversion = true;

    	studentinfo_dao studentInfoDao = new studentinfo_dao();
    	List<studentinfo> stuInfoList = studentInfoDao.idFilter(search);

    	// 受け取った値がidなのか、名前なのかを判断
    	// 変換しようとしたときにエラーをキャッチしたら名前で検索をかける
    	// エラーが起こらなかったらidで検索をかける
    	try {
    		Integer.parseInt(search);
    	} catch(NumberFormatException nfe) {
    		conversion = false;
    		System.out.println("変換に失敗しました。");
    	}

    	if (conversion==true) {

    	}
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
