package StudentInfo;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.attendrecord_dao;
import Dao.studentinfo_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_regist" })
public class studentinfo_regist_controller extends CommonServlet {

	// 数字のみを全角から半角に変換するメソッド
	private String convertDigit(String text) {
		if (text == null)
			return "";
		StringBuilder sb = new StringBuilder(text);
		for (int i = 0; i < sb.length(); i++) {
			char c = sb.charAt(i);
			if (c >= '０' && c <= '９') {
				sb.setCharAt(i, (char) (c - '０' + '0'));
			}
		}
		return sb.toString();
	}

	@Override
	protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 生徒情報登録画面へ遷移
		req.getRequestDispatcher("/StudentInfo/studentinfo_register.jsp").forward(req, resp);
	}

	@Override
	protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 値のセット
		String studentName = req.getParameter("studentName");
		String rawGrade = req.getParameter("grade");
		String rawCla = req.getParameter("cla");

		// 数字のみ全角を半角に変換
		String grade = convertDigit(rawGrade);
		String cla = convertDigit(rawCla);
		String classes = grade + "年" + cla + "組";

		// 生徒IDが文字で入力された場合
		int studentId;
		try {
			studentId = Integer.parseInt(req.getParameter("studentId"));
		} catch (NumberFormatException nfex) {
			req.setAttribute("numError", "IDは数値で入力してください");
			req.setAttribute("studentId", req.getParameter("studentId"));
			req.setAttribute("studentName", studentName);
			req.setAttribute("grade", rawGrade);
			req.setAttribute("cla", rawCla);
			req.getRequestDispatcher("/StudentInfo/studentinfo_register.jsp").forward(req, resp);
			return;
		}

		// 値のセット
		studentinfo stuInfo = new studentinfo();
		stuInfo.setStudentId(studentId);
		stuInfo.setStudentName(studentName);
		stuInfo.setClasses(classes);

		// DAOの準備
		studentinfo_dao stuInfoDao = new studentinfo_dao();

		// 現存している生徒IDの取得
		List<Integer> stuIdList = stuInfoDao.getAllID();
		boolean overlapping = stuIdList.contains(studentId);

		// 生徒IDが3桁以上だった場合
		if (String.valueOf(studentId).length() > 3) {
			req.setAttribute("lengthError", "入力は3桁までです");
			req.setAttribute("studentId", studentId);
			req.setAttribute("studentName", studentName);
			req.setAttribute("grade", rawGrade);
			req.setAttribute("cla", rawCla);
			req.getRequestDispatcher("/StudentInfo/studentinfo_register.jsp").forward(req, resp);
			return;
		}

		// 生徒IDが既に存在している場合
		if (overlapping) {
			req.setAttribute("overlappError", "この生徒IDは存在しています");
			req.setAttribute("studentId", studentId);
			req.setAttribute("studentName", studentName);
			req.setAttribute("grade", rawGrade);
			req.setAttribute("cla", rawCla);
			req.getRequestDispatcher("/StudentInfo/studentinfo_register.jsp").forward(req, resp);
			return;
		} else if (stuInfoDao.save(stuInfo)) {
			// 生徒情報登録処理
			new supportlevel_dao().regist(studentId);
			new attendrecord_dao().regist(studentId);
			// 登録完了画面へ遷移
			resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=student");
		}
	}
}