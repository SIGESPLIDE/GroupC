package Timetable;

import java.util.ArrayList;
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

// 時間割変更のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_change" })
public class timetable_change_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	String className = req.getParameter("class_name");
        timetable_dao dao = new timetable_dao();

        // 現在のデータを取得してMapに変換
        List<timetable> timetableList = dao.findByClass(className);
        Map<String, Map<Integer, String>> timetableMap = new HashMap<>();
        for (timetable t : timetableList) {
            timetableMap.computeIfAbsent(t.getWeekday(), k -> new HashMap<>())
                        .put(t.getPeriod(), t.getSubject());
        }

        req.setAttribute("className", className);
        req.setAttribute("timetableMap", timetableMap);
        req.setAttribute("weekdayList", Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日"));

     // 時間割詳細画面に遷移
        req.getRequestDispatcher("/Timetable/timetable_change.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 時間割変更時に使用
    	req.setCharacterEncoding("UTF-8");
        String className = req.getParameter("class_name");

        timetable_dao dao = new timetable_dao();
        List<timetable> newList = new ArrayList<>();
        List<String> weekdays = Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日");

        // 30コマ分のデータを取得してListに詰める
        for (String wd : weekdays) {
            for (int p = 1; p <= 6; p++) {
                String subject = req.getParameter("subject_" + wd + "_" + p);

                timetable t = new timetable();
                t.setClasses(className); // Beanのメソッド名に合わせてください
                t.setWeekday(wd);
                t.setPeriod(p);
                t.setSubject(subject);
                newList.add(t);
            }
        }

        try {
            // 古いデータを削除
            dao.deleteAllByClass(className);
            // 新しいデータを一括挿入
            dao.insertAll(newList);

            // 完了画面へ
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=time");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
