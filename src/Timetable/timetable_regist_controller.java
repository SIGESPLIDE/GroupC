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

       //空かどうかのチェック
        boolean hasAnyData = false;

        //時間割が全て空かの確認
        for (String wd : weekdays) {
            for (int p = 1; p <= 6; p++) {
                String subject = req.getParameter("subject_" + wd + "_" + p);

                // 空文字やハイフン以外が入力されているか
                if (subject != null && !subject.trim().isEmpty() && !subject.equals("-")) {
                    hasAnyData = true;
                } else {
                    subject = "-";
                }

                timetable t = new timetable();
                t.setClasses(className);
                t.setWeekday(wd);
                t.setPeriod(p);
                t.setSubject(subject);
                registList.add(t);
            }
        }

        // 全てハイフン（または空）だった場合
        if (!hasAnyData) {
            req.setAttribute("error", "すべてのコマが空です。正しく登録できません。");
            // 登録画面を再表示
            req.getRequestDispatcher("/Timetable/timetable_regist.jsp").forward(req, resp);
            return;
        }

        try {
            dao.insertAll(registList);
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=time");
        } catch (Exception e) {
            e.printStackTrace();
            // 必要に応じてエラー画面へ
        }
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

}
