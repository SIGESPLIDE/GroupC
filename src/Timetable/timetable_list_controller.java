package Timetable;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.classes;
import Dao.studentinfo_dao;
import tool.CommonServlet;

// 時間割一覧のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_list" })
public class timetable_list_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //生徒情報DAOを準備
        studentinfo_dao sDao = new studentinfo_dao();
        // 生徒が所属しているクラスのみを重複なしで取得
        List<classes> classList = sDao.findActiveClasses();

        // データセット
        req.setAttribute("classList", classList);

        // 時間割一覧画面に遷移
        req.getRequestDispatcher("/Timetable/timetable_list.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 必要に応じて実装
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 必要に応じて実装
    }
}