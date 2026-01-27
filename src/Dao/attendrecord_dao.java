package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.attendrecord;

public class attendrecord_dao extends dao {

	private String baseSql = "select * from attendrecord";

	// 検索結果をリストに格納して返す
	private attendrecord postFilter(ResultSet rSet) throws Exception {
		attendrecord attReco = new attendrecord();

		try {
			while (rSet.next()) {

				attReco.setStudentId(rSet.getInt("studentid"));
				attReco.setSequentialDays(rSet.getInt("sequentialdays"));
				attReco.setTotalDays(rSet.getInt("totaldays"));
				attReco.setSchoolTime(rSet.getInt("schooltime"));
				attReco.setClassTime(rSet.getInt("classtime"));
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return attReco;
	}

	// 生徒IDを使ってインスタンスを返す
	public attendrecord idFilter(int studentId) throws Exception{
		attendrecord attReco = new attendrecord();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = " where studentid = ?";

		// sqlの処理
		try {
			statement = connection.prepareStatement(baseSql + condition);
			statement.setInt(1, studentId);

			rSet = statement.executeQuery();
			postFilter(rSet);
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
		return attReco;
	}


	// 登録
	public boolean regist(int studentId) throws Exception{
		//DBに接続
		Connection connection = getConnection();
		PreparedStatement statement = null;
		// 実行件数
		int count = 0;

		try {
				// SQL文にinsert文を加え、の新規登録を行う
				statement = connection.prepareStatement("insert into attendrecord (studentid,sequentialdays,totaldays,schooltime,classtime) values(?,?,?,?,?)");
				// PreparedStatementに値をバインド
				statement.setInt(1, studentId);
				statement.setInt(2, 0);
				statement.setInt(3, 0);
				statement.setInt(4, 0);
				statement.setInt(5, 0);
			// SQL文を実行
			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			// SQL入力を終了
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

		if (count > 0) {
			// 実行件数が1件以上ある場合
			return true;
		} else {
			// 実行件数が0件の場合
			return false;
		}
	}


	// 更新
	public boolean change(int studentId,int sequentialdays,int totaldays,int schooltime,int classtime) throws Exception{
		//DBに接続
		Connection connection = getConnection();
		PreparedStatement statement = null;
		// 実行件数
		int count = 0;

		try {
			attendrecord old = this.idFilter(studentId);

			// SQL文にupdate文を加え、支援段階の更新を行う
			statement = connection.prepareStatement("update supportlevel set studentid=?,sequentialdays=?,totaldays=?,schooltime=?,classtime=? where studentid=?");
			// SQL文の条件文に値をセット
			statement.setInt(1, studentId);
			statement.setInt(2, old.getSequentialDays() + sequentialdays);
			statement.setInt(3, old.getTotalDays() + totaldays);
			statement.setInt(4, old.getSchoolTime() + schooltime);
			statement.setInt(5, old.getClassTime() + classtime);

			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			// SQL入力を終了
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

		if (count > 0) {
			// 実行件数が1件以上ある場合
			return true;
		} else {
			// 実行件数が0件の場合
			return false;
		}
	}


	// 指定した記録を削除する
	public boolean delete(int studentId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		String delete = "delete from attendrecord";
		String condition = " where studentid=?";

		try {
			statement = connection.prepareStatement(delete + condition);
			statement.setInt(1, studentId);
			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) { try { statement.close(); } catch (SQLException sqle) { throw sqle; } }
			if (connection != null) { try { connection.close(); } catch (SQLException sqle) { throw sqle; } }
		}

		if (count > 0) {
			// 実行件数が1件以上ある場合
			return true;
		} else {
			// 実行件数が0件の場合
			return false;
		}
	}
}
