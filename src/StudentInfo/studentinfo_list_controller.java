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

    	List<studentinfo> stuInfoList;

    	studentinfo_dao studentInfoDao = new studentinfo_dao();

    	// idでの検索をtry、無理だったら名前検索
    	try {
    		stuInfoList = studentInfoDao.idFilter(Integer.parseInt(search));
    	} catch(NumberFormatException nfe) {
    		stuInfoList = studentInfoDao.nameFilter(search);
    	}

    	System.out.println(search);

    	// 受け取った一覧をjspに渡す
    	req.setAttribute("stuInfoList", stuInfoList);

    	// 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
