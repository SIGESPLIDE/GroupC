package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.supportlevel;

public class supportlevel_dao extends dao {
	private String baseSql = "select * from supportlevel";

	// 生徒IDから支援段階を取得
	public supportlevel idFilter(int studentId) throws Exception{
		supportlevel supLev = new supportlevel();

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
			while (rSet.next()) {
				supLev.setSupportLevel(rSet.getInt("supportlevel"));
				supLev.setStudentId(rSet.getInt("studentid"));
			}
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
		return supLev;
	}

	// 支援段階の登録
	public boolean regist(int studentId) throws Exception{
		//DBに接続
		Connection connection = getConnection();
		PreparedStatement statement = null;
		// 実行件数
		int count = 0;

		try {
				// SQL文にinsert文を加え、の新規登録を行う
				statement = connection.prepareStatement("insert into supportlevel (studentid,supportlevel) values(?,?)");
				// PreparedStatementに値をバインド
				statement.setInt(1, studentId);
				statement.setInt(2, 1);
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

	// 支援段階の変更
	public boolean change(int studentId,int updateLevel) throws Exception{
		//DBに接続
		Connection connection = getConnection();
		PreparedStatement statement = null;
		// 実行件数
		int count = 0;

		try {
			supportlevel old = this.idFilter(studentId);
			// SQL文にupdate文を加え、支援段階の更新を行う
			statement = connection.prepareStatement("update supportlevel set studentid=?,supportlevel=? where studentid=?");
			// SQL文の条件文に値をセット
			statement.setInt(1, studentId);
			statement.setInt(2, old.getSupportLevel() + updateLevel);
			statement.setInt(3, studentId);

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

	// 指定した支援段階を削除する
	public boolean delete(int studentId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		String delete = "delete from supportlevel";
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
