package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Duration;
import java.time.LocalDate;
import java.util.List;

import Bean.attendrecord;
import Bean.dailyattend;

public class attendrecord_dao extends dao {

	private String baseSql = "select * from attendrecord";

	// 統計情報を計算してDBを更新する（ボタン押下時にこれを呼ぶ）
	public void updateAttendStats(int studentId) throws Exception {
		dailyattend_dao daDao = new dailyattend_dao();
		// 昨日以前の確定レコードのみ取得
		List<dailyattend> records = daDao.filterYesterdayAndBefore(studentId);

		int totalDays = records.size();
		int maxContinuousDays = 0;
		int currentContinuousDays = 0;
		long totalStayMinutes = 0;
		LocalDate lastDate = null;

		for (dailyattend record : records) {
			// 滞在時間の計算
			totalStayMinutes += Duration.between(record.getLoginTime(), record.getLogoutTime()).toMinutes();

			// 連続登校日数の計算
			LocalDate currentDate = record.getLoginTime().toLocalDate();
			if (lastDate == null) {
				currentContinuousDays = 1;
			} else {
				if (lastDate.plusDays(1).equals(currentDate)) {
					currentContinuousDays++;
				} else {
					currentContinuousDays = 1;
				}
			}
			maxContinuousDays = Math.max(maxContinuousDays, currentContinuousDays);
			lastDate = currentDate;
		}

		// 算出結果を保存（学校滞在時間は分を時間に変換）
		this.change(studentId, maxContinuousDays, totalDays, (int) (totalStayMinutes / 60), 0);
	}

	// 更新
	public boolean change(int studentId, int sequentialdays, int totaldays, int schooltime, int classtime)
			throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		try {
			// attendrecordテーブルの値を最新の状態に更新
			statement = connection.prepareStatement(
					"update attendrecord set sequentialdays=?, totaldays=?, schooltime=?, classtime=? where studentid=?");
			statement.setInt(1, sequentialdays);
			statement.setInt(2, totaldays);
			statement.setInt(3, schooltime);
			statement.setInt(4, classtime);
			statement.setInt(5, studentId);

			count = statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return count > 0;
	}

	// 生徒IDを使ってインスタンスを取得
	public attendrecord idFilter(int studentId) throws Exception {
		attendrecord attReco = new attendrecord();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;

		try {
			statement = connection.prepareStatement(baseSql + " where studentid = ?");
			statement.setInt(1, studentId);
			rSet = statement.executeQuery();
			if (rSet.next()) {
				attReco.setStudentId(rSet.getInt("studentid"));
				attReco.setSequentialDays(rSet.getInt("sequentialdays"));
				attReco.setTotalDays(rSet.getInt("totaldays"));
				attReco.setSchoolTime(rSet.getInt("schooltime"));
				attReco.setClassTime(rSet.getInt("classtime"));
			}
		} finally {
			if (rSet != null)
				rSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return attReco;
	}

	// 初期登録
	public boolean regist(int studentId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		try {
			statement = connection.prepareStatement(
					"insert into attendrecord (studentid,sequentialdays,totaldays,schooltime,classtime) values(?,?,?,?,?)");
			statement.setInt(1, studentId);
			statement.setInt(2, 0);
			statement.setInt(3, 0);
			statement.setInt(4, 0);
			statement.setInt(5, 0);
			count = statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return count > 0;
	}

	// 削除
	public boolean delete(int studentId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		try {
			statement = connection.prepareStatement("delete from attendrecord where studentid=?");
			statement.setInt(1, studentId);
			count = statement.executeUpdate();
		} finally {
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		}
		return count > 0;
	}
}