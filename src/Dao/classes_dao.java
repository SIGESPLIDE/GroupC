package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.classes;

public class classes_dao extends dao {

	private String convertDigit(String text) {
		if (text == null)
			return null;
		StringBuilder sb = new StringBuilder(text);
		for (int i = 0; i < sb.length(); i++) {
			char c = sb.charAt(i);
			if (c >= '０' && c <= '９') {
				sb.setCharAt(i, (char) (c - '０' + '0'));
			}
		}
		return sb.toString();
	}

	public List<classes> findAll() throws Exception {
		List<classes> list = new ArrayList<>();
		String sql = "SELECT * FROM CLASSES";
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			while (resultSet.next()) {
				classes c = new classes();
				c.setClasses(resultSet.getString("CLASSES"));
				list.add(c);
			}
		}
		return list;
	}

	public boolean filter(String className) throws Exception {
		String normalized = convertDigit(className);
		String sql = "SELECT * FROM CLASSES WHERE CLASSES = ?";
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, normalized);
			try (ResultSet rSet = statement.executeQuery()) {
				return rSet.next();
			}
		}
	}

	public boolean save(String className) throws Exception {
		String normalized = convertDigit(className);
		String sql = "INSERT INTO CLASSES (CLASSES) VALUES (?)";
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, normalized);
			return statement.executeUpdate() > 0;
		}
	}
}