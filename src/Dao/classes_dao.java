package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.classes;

public class classes_dao extends dao {
	// クラスの一覧を持ってくる
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

	// クラスが存在するかチェックする
    public boolean filter(String className) throws Exception {
        String sql = "SELECT * FROM CLASSES WHERE CLASSES = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, className);
            try (ResultSet rSet = statement.executeQuery()) {
                return rSet.next(); // 1件でもあれば true
            }
        }
    }

    // クラスの登録処理
    public boolean save(String className) throws Exception {
        String sql = "INSERT INTO CLASSES (CLASSES) VALUES (?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, className);
            return statement.executeUpdate() > 0;
        }
    }
}
