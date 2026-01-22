package StudentInfo;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.studentinfo_dao;
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
		// 生徒情報登録から登録処理を行う為に起動
    	// 入力された情報を取得
    	int studentId = Integer.parseInt(req.getParameter("studentId"));
    	String studentName = req.getParameter("studentName");
    	String classes = req.getParameter("grade") + "年" + req.getParameter("cla") + "組";

    	// 入力された内容で学生インスタンス作成
    	studentinfo stuInfo = new studentinfo();

    	stuInfo.setStudentId(studentId);
    	stuInfo.setStudentName(studentName);
    	stuInfo.setClasses(classes);

    	// 登録処理
    	studentinfo_dao stuInfoDao = new studentinfo_dao();

    	// 重複確認
    	boolean overlapping = false;
    	List<Integer> stuIdList = stuInfoDao.getAllID();

    	// id一覧を見て、重複がないかどうかの確認
    	for (int i = 0; i < stuIdList.size(); i++) {
    		if (studentId == stuIdList.get(i)) {
    			overlapping = true;
    			break; //内容が同じだったらループを抜ける
    		}
    	}

    	// 入力された生徒IDが既に存在していた場合、登録処理を行わず、生徒登録画面に戻る
    	if (overlapping == true) {
    		String overlappError = "この生徒IDは存在しています";
    		req.setAttribute("overlappError", overlappError);

    		// 入力された値を保持
    		req.setAttribute("stuInfo", stuInfo);
    		req.setAttribute("grade", req.getParameter("grade"));
    		req.setAttribute("cla", req.getParameter("cla"));

    		req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
    	} else if (stuInfoDao.save(stuInfo)){ // 登録の実行
            // 成功したら完了画面へ（合言葉 from=student を付ける）
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/register_complete.jsp?from=student");
        }
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
