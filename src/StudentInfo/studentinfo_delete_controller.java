package StudentInfo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.activitylog_dao;
import Dao.attendrecord_dao;
import Dao.dailyattend_dao;
import Dao.studentinfo_dao;
import Dao.supportlevel_dao;
import tool.CommonServlet;

// 生徒情報一覧のコントローラ

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_delete" })
public class studentinfo_delete_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {

    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	// 生徒Idを取得
    	int studentId = Integer.parseInt(req.getParameter("studentId"));

    	// 削除用Daoの作成
    	studentinfo_dao stuInfoDao = new studentinfo_dao();
    	supportlevel_dao supLevDao = new supportlevel_dao();
    	attendrecord_dao attRecDao = new attendrecord_dao();
    	activitylog_dao acLogDao = new activitylog_dao();
    	dailyattend_dao dailyDao = new dailyattend_dao();

    	// 削除の実行
        if (stuInfoDao.delete(studentId)){
        	supLevDao.delete(studentId);
        	attRecDao.delete(studentId);
        	acLogDao.delete(studentId);
        	dailyDao.delete(studentId);

            // 成功したら完了画面へ（合言葉 from=student を付ける）
            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/delete_completed.jsp?from=student");
        } else {
        	// 削除に失敗したら画面にメッセージを表示して戻る
    		String deleteError = "削除に失敗しました";
    		req.setAttribute("deleteError", deleteError);

    		System.out.println("失敗");
        	req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
        }
    }
}
