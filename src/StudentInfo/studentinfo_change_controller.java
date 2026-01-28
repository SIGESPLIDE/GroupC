package StudentInfo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.studentinfo_dao;
import tool.CommonServlet;

// 生徒情報変更のコントローラ

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_change" })
public class studentinfo_change_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	int studentId = Integer.parseInt(req.getParameter("studentId"));

    	// 生徒IDから生徒情報を取り出す
    	studentinfo_dao studentInfoDao = new studentinfo_dao();
    	studentinfo stuInfo = studentInfoDao.idPickUp(studentId);

    	req.setAttribute("stuInfo", stuInfo);

    	// 生徒情報一覧画面に遷移
        req.getRequestDispatcher("/StudentInfo/studentinfo_change.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	String action = req.getParameter("action");
    	// detailから遷移したときに使用
    	if (action != null){
    		int studentId = Integer.parseInt(req.getParameter("studentId"));
        	// 生徒IDから生徒情報を取り出す
        	studentinfo_dao studentInfoDao = new studentinfo_dao();
        	studentinfo stuInfo = studentInfoDao.idPickUp(studentId);

        	// 文字の位置を探して動的に切り出す
        	String fullClass = stuInfo.getClasses();

        	// 「年」の前の文字をすべて学年とする
        	String grade = fullClass.substring(0, fullClass.indexOf("年"));

        	// 「年」と「組」の間の文字をクラスとする
        	String cla = fullClass.substring(fullClass.indexOf("年") + 1, fullClass.indexOf("組"));

        	req.setAttribute("stuInfo", stuInfo);
        	req.setAttribute("grade", grade);
        	req.setAttribute("cla", cla);

        	// 生徒情報変更画面に遷移
	    	req.getRequestDispatcher("/StudentInfo/studentinfo_change.jsp").forward(req, resp);

    	} else {
	    	// 変更処理で使用
	    	// 入力された値の受け取り
	    	int studentId = Integer.parseInt(req.getParameter("studentId"));
	    	String studentName = req.getParameter("studentName");
	    	String classes = req.getParameter("grade") + "年" + req.getParameter("cla") + "組";
	    	// 変更された内容で学生インスタンス作成
	    	studentinfo stuInfo = new studentinfo();

	    	stuInfo.setStudentId(studentId);
	    	stuInfo.setStudentName(studentName);
	    	stuInfo.setClasses(classes);

	    	// 変更処理
	    	studentinfo_dao stuInfoDao = new studentinfo_dao();

	    	// 変更の実行
	        if (stuInfoDao.save(stuInfo)){
	            // 成功したら完了画面へ（合言葉 from=student を付ける）
	            resp.sendRedirect(req.getContextPath() + "/ModalCompletion/update_completed.jsp?from=student");
	        }
    	}
    }
}
