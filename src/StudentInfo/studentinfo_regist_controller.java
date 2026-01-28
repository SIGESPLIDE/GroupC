package StudentInfo;

import java.text.Normalizer;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.attendrecord_dao;
import Dao.studentinfo_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

// 生徒情報登録のコントローラ

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_regist" })
public class studentinfo_regist_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 生徒情報登録画面を表示
        req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 生徒情報登録処理

        // 入力された情報を取得
        String studentName = req.getParameter("studentName");
        String rawGrade = req.getParameter("grade");
        String rawCla = req.getParameter("cla");

        // 英数字のみ全角を半角に変換
        String grade = Normalizer.normalize(rawGrade, Normalizer.Form.NFKC);
        String cla = Normalizer.normalize(rawCla, Normalizer.Form.NFKC);

        //変換後の値でクラス文字列を作成
        String classes = grade + "年" + cla + "組";

        int studentId;
        try {
            studentId = Integer.parseInt(req.getParameter("studentId"));
        } catch (NumberFormatException nfex) {
            req.setAttribute("numError", "数値で入力してください");

            // 入力された値を保持
            req.setAttribute("studentId", req.getParameter("studentId"));
            req.setAttribute("studentName", studentName);
            req.setAttribute("grade", grade);
            req.setAttribute("cla", cla);

            req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
            return;
        }

        // 入力された内容で学生インスタンス作成
        studentinfo stuInfo = new studentinfo();
        stuInfo.setStudentId(studentId);
        stuInfo.setStudentName(studentName);
        stuInfo.setClasses(classes);

        // 生徒情報dao
        studentinfo_dao stuInfoDao = new studentinfo_dao();

        // 重複確認
        boolean overlapping = false;
        List<Integer> stuIdList = stuInfoDao.getAllID();

        // id一覧を見て、重複がないかどうかの確認
        for (int i = 0; i < stuIdList.size(); i++) {
            if (studentId == stuIdList.get(i)) {
                overlapping = true;
                break;
            }
        }

        // 入力は3桁まで
    	if (String.valueOf(stuInfo.getStudentId()).length() > 3) {
    		req.setAttribute("lengthError", "入力は3桁までです");

    		// 入力された値を保持
    		req.setAttribute("studentId", stuInfo.getStudentId());
    		req.setAttribute("studentName", stuInfo.getStudentName());
    		req.setAttribute("grade", req.getParameter("grade"));
    		req.setAttribute("cla", req.getParameter("cla"));

    		req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
    		return;
    	}

        // 入力された生徒IDが既に存在していた場合、登録処理を行わず、生徒登録画面に戻る
        if (overlapping == true) {
            String overlappError = "この生徒IDは存在しています";
            req.setAttribute("overlappError", overlappError);

            // 入力された値を保持
            req.setAttribute("studentId", stuInfo.getStudentId());
            req.setAttribute("studentName", stuInfo.getStudentName());
            req.setAttribute("grade", grade);
            req.setAttribute("cla", cla);

            req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
            return;
        }
        else if (stuInfoDao.save(stuInfo)) {
        	// 支援段階の登録
        	supportlevel_dao supLevDao = new supportlevel_dao();
        	supLevDao.regist(stuInfo.getStudentId());

        	attendrecord_dao attRecDao = new attendrecord_dao();
        	attRecDao.regist(stuInfo.getStudentId());

            // 完了画面へ
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=student");
        }
    }
}