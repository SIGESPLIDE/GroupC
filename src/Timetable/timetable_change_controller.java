package Timetable;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.CommonServlet;

// 時間割詳細のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_change" })
public class timetable_change_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 時間割詳細画面に遷移(ここでクラスを受け取って、そのクラスのモノを表示)
        req.getRequestDispatcher("/Timetable/timetable_change.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 時間割変更時に使用
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
