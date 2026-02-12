package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.keyword;

public class keyword_dao extends dao {

	// キーワードの一覧を持ってくる
	public List<keyword> findAll() throws Exception {
		List<keyword> list = new ArrayList<>();
		String sql = "SELECT * FROM KEYWORD";

		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				keyword k = new keyword();
				k.setId(resultSet.getInt("ID"));
				k.setPhrase(resultSet.getString("PHRASE"));
				list.add(k);
			}
		}
		return list;
	}

	// キーワードの登録
	public boolean insert(keyword k) throws Exception {
		String sql = "INSERT INTO KEYWORD (PHRASE) VALUES (?)";

		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, k.getPhrase());
			return statement.executeUpdate() > 0;
		}
	}

	// キーワードの削除
	public boolean delete(int id) throws Exception {
		String sql = "DELETE FROM KEYWORD WHERE ID = ?";

		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			return statement.executeUpdate() > 0;
		}
	}
}