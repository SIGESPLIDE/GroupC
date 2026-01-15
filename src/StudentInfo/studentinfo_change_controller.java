package StudentInfo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.studentinfo_dao;
import tool.CommonServlet;

// 生徒情報変更のコントローラ

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_change" })
public class studentinfo_change_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	int studentId = Integer.parseInt(req.getParameter("studentId"));

    	// 生徒IDから生徒情報を取り出す
    	studentinfo_dao studentInfoDao = new studentinfo_dao();
    	studentinfo stuInfo = studentInfoDao.idPickUp(studentId);

    	req.setAttribute("stuInfo", stuInfo);

    	// 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_change.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 送られてきた学生IDを獲得
    	int studentId = Integer.parseInt(req.getParameter("studentId"));

    	// 生徒IDから生徒情報を取り出す
    	studentinfo_dao studentInfoDao = new studentinfo_dao();
    	studentinfo stuInfo = studentInfoDao.idPickUp(studentId);

    	req.setAttribute("stuInfo", stuInfo);


    	// 生徒情報変更画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_change.jsp").forward(req, resp);

    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
