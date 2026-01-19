package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    //  共通処理の実行(パスワードの変更）
    private boolean executeUpdate(String sql, String pass) throws Exception {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, pass);
            return statement.executeUpdate() > 0;
        }
    }

    //  ログイン処理
    public int login(String inputPassword) throws Exception{
    	//初期値（不一致の場合）
    	int authId = -1;
    	// SQL文（パスワードの一致検索）
    	String sql = "SELECT ID FROM PASSWORD WHERE PASSWORD = ?";

    	try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

    	        statement.setString(1, inputPassword);

    	        try (ResultSet rs = statement.executeQuery()) {
    	            if (rs.next()) {
    	                // 一致した場合、そのIDを代入
    	                authId = rs.getInt("ID");
    	            }
    	        }
    	    }
    	    return authId;
    }

}