package Timetable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.timetable;
import Dao.timetable_dao;
import tool.CommonServlet;

// 時間割登録のコントローラ

@WebServlet(urlPatterns = { "/timetable/timetable_regist" })
public class timetable_regist_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// クラス名を取得
        String className = req.getParameter("class_name");

        // 画面表示に必要なデータをセット
        req.setAttribute("className", className);

        // 時間割登録画面に遷移
        req.getRequestDispatcher("/Timetable/timetable_regist.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 時間割の登録処理
    	req.setCharacterEncoding("UTF-8");

        // どのクラスの登録か取得
        String className = req.getParameter("class_name");

        timetable_dao dao = new timetable_dao();
        List<timetable> registList = new ArrayList<>();
        List<String> weekdays = Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日");

        // 5曜日 × 6時限 = 30コマ分のデータをループで取得
        for (String wd : weekdays) {
            for (int p = 1; p <= 6; p++) {
                // JSPのname属性「subject_曜日_時限」に合わせて値を取得
                String subject = req.getParameter("subject_" + wd + "_" + p);

                // 空文字やnullの場合はハイフンなどを入れるか、そのまま保存
                if (subject == null || subject.isEmpty()) {
                    subject = "-";
                }

                // Beanにセット
                timetable t = new timetable();
                t.setClasses(className);
                t.setWeekday(wd);
                t.setPeriod(p);
                t.setSubject(subject);

                registList.add(t);
            }
        }

        try {
            // 一括登録
            dao.insertAll(registList);

            // 完了画面へ
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=time");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

}
