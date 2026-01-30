package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.dailyattend;

public class dailyattend_dao extends dao {

    // 昨日以前かつログアウト済みの記録を抽出（計算用）
    public List<dailyattend> filterYesterdayAndBefore(int studentId) throws Exception {
        List<dailyattend> list = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rSet = null;

        // loginTimeが今日より前、かつlogoutTimeが入力されているもの
        String sql = "SELECT * FROM daily_attend WHERE studentID = ? " +
                     "AND loginTime < CURRENT_DATE AND logoutTime IS NOT NULL " +
                     "ORDER BY loginTime ASC";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, studentId);
            rSet = statement.executeQuery();

            while (rSet.next()) {
                dailyattend attend = new dailyattend();
                attend.setStudentId(rSet.getInt("studentID"));
                if (rSet.getTimestamp("loginTime") != null) {
                    attend.setLoginTime(rSet.getTimestamp("loginTime").toLocalDateTime());
                }
                if (rSet.getTimestamp("logoutTime") != null) {
                    attend.setLogoutTime(rSet.getTimestamp("logoutTime").toLocalDateTime());
                }
                list.add(attend);
            }
        } finally {
            if (rSet != null) rSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
        return list;
    }

    // 生徒IDに紐づく全ての記録を削除
    public boolean deleteByStudentId(int studentId) throws Exception {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        int count = 0;
        try {
            statement = connection.prepareStatement("DELETE FROM daily_attend WHERE studentID = ?");
            statement.setInt(1, studentId);
            count = statement.executeUpdate();
        } finally {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
        return count > 0;
    }
}