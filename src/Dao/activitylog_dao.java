package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import Bean.activitylog;

public class activitylog_dao extends dao {

	private String baseSql = "select * from activitylog";

	// 検索結果をリストに格納して返す
	private List<activitylog> postFilter(ResultSet rSet) throws Exception {
		List<activitylog> list = new ArrayList<>();

		try {
			while (rSet.next()) {
				activitylog acLog = new activitylog();

				acLog.setStudentId(rSet.getInt("studentid"));
				acLog.setDatetime(rSet.getObject("datetime", LocalDateTime.class));
				acLog.setStudentMoodLog(rSet.getInt("studentmoodlog"));
				acLog.setStudentChatLog(rSet.getString("studentchatlog"));
				acLog.setUniboChatLog(rSet.getString("unibochatlog"));

				list.add(acLog);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}


	// 生徒IDから日時と生徒気分を取り出し
	public List<activitylog> idFilter(int studentId) throws Exception {
		List<activitylog> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = " where studentid = ?";
		String order = " order by datetime desc";

		// sqlの処理
		try {
			// select chatlog from activitylog where studentid = ? order by datetime desc
			statement = connection.prepareStatement(baseSql + condition + order);
			statement.setInt(1, studentId);
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

	// 生徒IDと日付から会話履歴を取り出し
	public List<activitylog> chatFilter(int studentId,LocalDateTime datetime) throws Exception {
		List<activitylog> list = new ArrayList<>();
		// 受け取った日時を日付のみに変換
		LocalDate date = datetime.toLocalDate();

		// 日付からその日の始まりと翌日の始まりを取得
		LocalDateTime start = date.atStartOfDay();
		LocalDateTime end   = date.plusDays(1).atStartOfDay();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = " where studentid = ?";
		String dateSql = " and datetime >= ? and datetime < ?";
		String order = " order by datetime asc";

		// sqlの処理
		try {
			// sql
			statement = connection.prepareStatement(baseSql + condition + dateSql + order);
			statement.setInt(1, studentId);
			statement.setObject(2, start);
			statement.setObject(3, end);

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
