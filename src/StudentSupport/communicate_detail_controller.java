package StudentSupport;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    	// 学生IDと日付から会話履歴を取り出す
    	int studentId = Integer.parseInt(req.getParameter("studentId"));



    	req.getRequestDispatcher("/StudentSupport/communicate_detail.jsp").forward(req, resp);
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
