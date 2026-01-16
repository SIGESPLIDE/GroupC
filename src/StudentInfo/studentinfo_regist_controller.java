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
        // 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_regist.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//    	} else {
			// 登録処理
			// フォームから学生情報を取得
	    	int studentId = Integer.parseInt(req.getParameter("studentId"));
	    	String studentName = req.getParameter("studentName");
	    	String classes = req.getParameter("classes");

	    	// 入力された内容で学生インスタンス作成
	    	studentinfo stuInfo = new studentinfo();

	    	stuInfo.setStudentId(studentId);
	    	stuInfo.setStudentName(studentName);
	    	stuInfo.setClasses(classes);

	    	// 登録処理
	    	studentinfo_dao stuInfoDao = new studentinfo_dao();

	    	// 重複確認 入力内容が既に存在していた場合、登録処理を行わず、画面に戻る
	    	boolean flg = true;
	    	List<Integer> stuIdList = stuInfoDao.getAllID();

	    	for (int i = 0; i < stuIdList.size(); i++) {
	    		if (studentId == stuIdList.get(i)) {
	    			flg = false;
	    			break; //内容が同じだったらループを抜ける
	    		}
	    	}

	    	// 登録の実行
	        if (stuInfoDao.save(stuInfo)){
	            // 成功したら完了画面へ（合言葉 from=student を付ける）
	            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=student");
	        }
//    	}
    }

    @Override
    protected void execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// ログインしているかの確認
    }

}
