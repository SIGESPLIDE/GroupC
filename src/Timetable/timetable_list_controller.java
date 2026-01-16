package Timetable;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.classes;
import Dao.classes_dao;
import tool.CommonServlet;

// 時間割一覧のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_list" })
public class timetable_list_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// DAOの準備
    	classes_dao cDao = new classes_dao();

    	// クラスの一覧取得
    	List<classes> classList = cDao.findAll();

    	// データセット
    	req.setAttribute("classList", classList);

        // 時間割一覧画面に遷移
        req.getRequestDispatcher("/Timetable/timetable_list.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

}
