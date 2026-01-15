package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Bean.password; // 小文字のpasswordクラスをインポート

public class password_dao extends dao {

	//  管理者パスワードの変更
    public boolean updateAdminPass(password p) throws Exception {
        // カラム名をDBに合わせて PASSWORD に変更
        String sql = "UPDATE password SET password = ? WHERE id = 1";
        // Beanから新しいパスワードを取得して実行
        return executeUpdate(sql, p.getPassword());
    }

    //  別室担任パスワードの変更
    public boolean updateRoomTPass(password p) throws Exception {
        // カラム名をDBに合わせて PASSWORD に変更
        String sql = "UPDATE password SET password = ? WHERE id = 2";
        // Beanから新しいパスワードを取得して実行
        return executeUpdate(sql, p.getPassword());
    }

    //  共通処理の実行
//    private boolean executeUpdate(String sql, String pass) throws Exception {
//        try (Connection connection = getConnection();
//             PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setString(1, pass);
//            return statement.executeUpdate() > 0;
//        }
//    }

    // 共通実行メソッド
    private boolean executeUpdate(String sql, String pass) throws Exception {
        Connection connection = getConnection(); // 接続を取得
        PreparedStatement statement = null;      // 変数を準備
        int count = 0;

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, pass);
            count = statement.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            // SQL文を終了
            if (statement != null) {
                try { statement.close(); } catch (SQLException sqle) { throw sqle; }
            }
            // DBを切断
            if (connection != null) {
                try { connection.close(); } catch (SQLException sqle) { throw sqle; }
            }
        }
        return count > 0;
    }

}