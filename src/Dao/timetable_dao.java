package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.timetable;

//変更に関しては、該当クラスのデータをすべて削除→一括登録の流れになっている

public class timetable_dao extends dao {
	// クラスで時間割の検索
	public boolean exists(String className) throws Exception {
		String sql = "SELECT COUNT(*) FROM TIMETABLE WHERE CLASSES = ?";
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, className);
			try (ResultSet rSet = statement.executeQuery()) {
				if (rSet.next()) {
					return rSet.getInt(1) > 0;
				}
			}
		}
		return false;
	}

	// 時間割の取得
	public List<timetable> findByClass(String className) throws Exception {
		List<timetable> list = new ArrayList<>();
		String sql = "SELECT * FROM TIMETABLE WHERE CLASSES = ? ORDER BY WEEKDAY, PERIOD";
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, className);
			try (ResultSet rSet = statement.executeQuery()) {
				while (rSet.next()) {
					timetable t = new timetable();
					t.setClasses(rSet.getString("CLASSES"));
					t.setSubject(rSet.getString("SUBJECT"));
					t.setWeekday(rSet.getString("WEEKDAY"));
					t.setPeriod(rSet.getInt("PERIOD"));
					list.add(t);
				}
			}
		}
		return list;
	}

	// 時間割の登録
	public boolean insertAll(List<timetable> timetableList) throws Exception {
		String sql = "INSERT INTO TIMETABLE (CLASSES, SUBJECT, WEEKDAY, PERIOD) VALUES (?, ?, ?, ?)";
		int count = 0;

		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

			// 一括処理の準備
			connection.setAutoCommit(false);

			for (timetable t : timetableList) {
				statement.setString(1, t.getClasses());
				statement.setString(2, t.getSubject());
				statement.setString(3, t.getWeekday());
				statement.setInt(4, t.getPeriod());

				// バッチ処理
				statement.addBatch();
			}

			// まとめて実行
			int[] results = statement.executeBatch();
			connection.commit(); // 確定
			count = results.length;
		} catch (Exception e) {
			// エラーがあればロールバック
			throw e;
		}
		return count > 0;
	}

	// 時間割の削除
	public boolean deleteAllByClass(String className) throws Exception {
		String sql = "DELETE FROM TIMETABLE WHERE CLASSES = ?";
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, className);
			return statement.executeUpdate() > 0;
		}
	}

}
