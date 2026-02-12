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
			timetableMap.computeIfAbsent(t.getWeekday(), k -> new HashMap<>()).put(t.getPeriod(), t.getSubject());
		}

		req.setAttribute("className", className);
		req.setAttribute("timetableMap", timetableMap);
		req.setAttribute("weekdayList", Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日"));

		// 時間割変更画面に遷移
		req.getRequestDispatcher("/Timetable/timetable_change.jsp").forward(req, resp);
	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String action = req.getParameter("action");

		if (action != null) {
			get(req, resp);
			return;
		} else {
			// 時間割変更時に使用
			req.setCharacterEncoding("UTF-8");
			String className = req.getParameter("class_name");

			timetable_dao dao = new timetable_dao();
			List<timetable> newList = new ArrayList<>();
			List<String> weekdays = Arrays.asList("月曜日", "火曜日", "水曜日", "木曜日", "金曜日");

			// 空であるかのフラグ
			boolean hasAnyData = false;

			for (String wd : weekdays) {
				for (int p = 1; p <= 6; p++) {
					String subject = req.getParameter("subject_" + wd + "_" + p);

					// 有効なデータ（空でもハイフンでもない）があるかチェック
					if (subject != null && !subject.trim().isEmpty() && !subject.equals("-")) {
						hasAnyData = true;
					} else {
						// 空ならハイフンに統一
						subject = "-";
					}

					timetable t = new timetable();
					t.setClasses(className);
					t.setWeekday(wd);
					t.setPeriod(p);
					t.setSubject(subject);
					newList.add(t);
				}
			}

			// すべて空の場合の処理
			if (!hasAnyData) {
				// 画面表示に必要なデータを再取得してリ送付
				req.setAttribute("error", "すべてのコマが空です。変更を保存できません。");
				req.setAttribute("className", className);

				// 入力値を保持させるためにnewListからMapを再構成
				Map<String, Map<Integer, String>> timetableMap = new HashMap<>();
				for (timetable t : newList) {
					timetableMap.computeIfAbsent(t.getWeekday(), k -> new HashMap<>()).put(t.getPeriod(),
							t.getSubject());
				}
				req.setAttribute("timetableMap", timetableMap);
				req.setAttribute("weekdayList", weekdays);

				req.getRequestDispatcher("/Timetable/timetable_change.jsp").forward(req, resp);
				return;
			}

			try {
				// 元のデータを削除
				dao.deleteAllByClass(className);
				// 新しい時間割を登録
				dao.insertAll(newList);

				resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=time");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
