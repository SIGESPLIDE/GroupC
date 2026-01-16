package Timetable;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.timetable;
import Dao.timetable_dao;
import tool.CommonServlet;

// 時間割詳細のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_detail" })
public class timetable_detail_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// クラス名の取得
        String className = req.getParameter("class_name");

        // DAOの準備と検索
        timetable_dao dao = new timetable_dao();
        List<timetable> timetableList = dao.findByClass(className);

        // 表示用Mapの作成（Map<曜日, Map<時限, 科目名>>）
        Map<String, Map<Integer, String>> timetableMap = new HashMap<>();
        for (timetable t : timetableList) {
            timetableMap.computeIfAbsent(t.getWeekday(), k -> new HashMap<>())
                        .put(t.getPeriod(), t.getSubject());
        }

        // 曜日リスト（ループ用）
        List<String> weekdayList = Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日");

        // データをリクエスト属性にセット
        req.setAttribute("className", className);
        req.setAttribute("timetableList", timetableList);
        req.setAttribute("timetableMap", timetableMap);
        req.setAttribute("weekdayList", weekdayList);

        // 詳細画面に遷移
        req.getRequestDispatcher("/Timetable/timetable_detail.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
