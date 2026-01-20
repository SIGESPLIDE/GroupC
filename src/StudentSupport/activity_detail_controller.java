package StudentSupport;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.activitylog;
import Dao.activitylog_dao;
import tool.CommonServlet;

// 交流詳細のコントローラ

@WebServlet(urlPatterns = { "/studentsupport/activity_detail" })
public class activity_detail_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //
        req.getRequestDispatcher("/StudentSupport/activity_detail.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    	int studentId = Integer.parseInt(req.getParameter("studentId"));
    	// 画面表示用
    	// 受け取った学生IDで交流詳細を特定
    	activitylog_dao acDao = new activitylog_dao();
    	List<activitylog> acLogList = acDao.idFilter(studentId);

    	// 受け取った日時から日付を取得
    	// DAOに着けるか、コントローラーに付けるか
    	// 日付で管理をする→DAOを変更
    	req.setAttribute("acLogList", acLogList);
    	req.getRequestDispatcher("/StudentSupport/activity_detail.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
