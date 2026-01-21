package StudentSupport;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.activitylog;
import Dao.activitylog_dao;
import tool.CommonServlet;

// 会話履歴のコントローラ

@WebServlet(urlPatterns = { "/studentsupport/communicate_detail" })
public class communicate_detail_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        req.getRequestDispatcher("/StudentSupport/communicate_detail.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 学生IDと日時を取得
    	int studentId = Integer.parseInt(req.getParameter("studentId"));
    	LocalDateTime datetime = LocalDateTime.parse(req.getParameter("datetime"));

    	// 会話履歴の取得
    	activitylog_dao acDao = new activitylog_dao();
    	List<activitylog> chatLogList = acDao.chatFilter(studentId, datetime);

    	// 会話履歴を渡す
    	req.setAttribute("chatLogList", chatLogList);
    	req.getRequestDispatcher("/StudentSupport/communicate_detail.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
