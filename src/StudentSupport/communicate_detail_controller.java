package StudentSupport;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.activitylog;
import Bean.keyword;
import Dao.activitylog_dao;
import Dao.keyword_dao;
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

    	// keywordListを取得し、一つずつ出して検索
    	// 検証後の会話履歴を挿入する用のリスト
    	keyword_dao keyDao = new keyword_dao();
    	List<keyword> keywords = keyDao.findAll();

    	for (activitylog acLog : chatLogList) {
    		// 交流履歴リストから会話履歴のみを取り出し
    		String chatLog = acLog.getChatLog();
    		if (chatLog != null) {
    			// 取り出した会話履歴と、キーワードを比較
    			for (keyword key : keywords) {
    				if (chatLog.contains(key.getPhrase())) {
    					// キーワードの部分に赤文字にするためのタグを付ける
    					chatLog = chatLog.replace(key.getPhrase(), "<span style=\"color:red; font-weight:bold;\">" + key.getPhrase() + "</span>");
    				}
    			}
    			// 元に戻す
    			acLog.setChatLog(chatLog);
    		}
    	}

    	// 会話履歴を渡す
    	req.setAttribute("chatLogList", chatLogList);
    	req.getRequestDispatcher("/StudentSupport/communicate_detail.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
