package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.studentinfo;

public class studentinfo_dao extends dao {

	private String baseSql = "select * from studentinfo";

	// 検索結果をリストに格納して返す
	private List<studentinfo> postFilter(ResultSet rSet) throws Exception {
		List<studentinfo> list = new ArrayList<>();

		try {
			while (rSet.next()) {
				studentinfo stuInf = new studentinfo();

				stuInf.setStudentId(rSet.getInt("studentid"));
				stuInf.setStudentName(rSet.getString("name"));

				list.add(stuInf);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 学生idで検索を掛ける
	public List<studentinfo> filter(int studentid) throws Exception {
		List<studentinfo> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = "and studentid = ?";
		String order = "order by studentid asc";

		// sqlの処理
		try {
			statement = connection.prepareStatement(baseSql + condition + order);
			statement.setInt(1, studentid);
			// sqlの実行
				rSet = statement.executeQuery();
				list = postFilter(rSet);
		} catch (Exception e) {
			throw e;
		} finally {
			// SQL文の入力を終了
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			// DBを切断
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}
		return list;
	}

}
