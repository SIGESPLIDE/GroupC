package StudentInfo;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.studentinfo;
import Dao.studentinfo_dao;
import tool.CommonServlet;

@WebServlet(urlPatterns = { "/studentinfo/studentinfo_list" })
public class studentinfo_list_controller extends CommonServlet {

    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        studentinfo_dao studentInfoDao = new studentinfo_dao();
        List<studentinfo> stuInfoList = studentInfoDao.selectAll();

        if (stuInfoList.isEmpty()) {
            req.setAttribute("emptyError", "まだ学生情報が存在していません");
        }
        req.setAttribute("stuInfoList", stuInfoList);
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }

    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String searchId = req.getParameter("searchId");
        String searchName = req.getParameter("searchName");

        studentinfo_dao studentInfoDao = new studentinfo_dao();
        List<studentinfo> stuInfoList = null;

        boolean isIdEmpty = (searchId == null || searchId.isEmpty());
        boolean isNameEmpty = (searchName == null || searchName.isEmpty());

        try {
            if (isIdEmpty && isNameEmpty) {
                // 両方空なら全件表示
                stuInfoList = studentInfoDao.selectAll();
            } else {
                if (!isIdEmpty) {
                    Integer.parseInt(searchId);
                }
                // DAOの既存メソッドを利用
                stuInfoList = studentInfoDao.search(searchId, searchName);
            }

            if (stuInfoList == null || stuInfoList.isEmpty()) {
                req.setAttribute("searchMessage", "検索に引っかかりませんでした");
            }
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "生徒IDには数値を入力してください");
            stuInfoList = studentInfoDao.selectAll();
        }

        req.setAttribute("stuInfoList", stuInfoList);
        req.setAttribute("searchId", searchId);
        req.setAttribute("searchName", searchName);
        req.getRequestDispatcher("/StudentInfo/studentinfo_list.jsp").forward(req, resp);
    }
}