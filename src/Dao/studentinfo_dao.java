package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import Bean.studentinfo;

public class studentinfo_dao extends dao {

	private String baseSql = "select * from studentinfo";

	// 検索結果をリストに格納して返す
	private List<studentinfo> postFilter(ResultSet rSet) throws Exception {
		List<studentinfo> list = new ArrayList<>();

		try {
			while (rSet.next()) {
				studentinfo stuInf = new studentinfo();

				stuInf.setStudentId(rSet.getInt("studentid"));
				stuInf.setStudentName(rSet.getString("studentname"));
				stuInf.setClasses(rSet.getString("classes"));

				list.add(stuInf);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 一覧を表示
	public List<studentinfo> selectAll() throws Exception {
		List<studentinfo> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String order = " order by studentid asc";

		// sqlの処理
		try {
			statement = connection.prepareStatement(baseSql + order);
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

	// 生徒idで検索を掛ける
	public List<studentinfo> idFilter(int studentId) throws Exception {
		List<studentinfo> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = " where studentid like ?";
		String order = " order by studentid asc";

		// sqlの処理
		try {
			statement = connection.prepareStatement(baseSql + condition + order);

			statement.setString(1, "%" + String.valueOf(studentId) + "%");
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

	// 生徒名で検索をかける
	public List<studentinfo> nameFilter(String studentName) throws Exception {
		List<studentinfo> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String condition = " where studentname like ?";
		String order = " order by studentid asc";

		// sqlの処理
		try {
			statement = connection.prepareStatement(baseSql + condition + order);
			statement.setString(1, "%" + studentName + "%");
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

	// 生徒1人の情報を返す
	// 生徒idで検索を掛ける
	public studentinfo idPickUp(int studentId) throws Exception {
		studentinfo stuInfo = null;

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
			// sqlの実行
			rSet = statement.executeQuery();
			while (rSet.next()) {
				stuInfo = new studentinfo();

				stuInfo.setStudentId(rSet.getInt("studentid"));
				stuInfo.setStudentName(rSet.getString("studentname"));
				stuInfo.setClasses(rSet.getString("classes"));
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
		return stuInfo;
	}

	// 複合検索（IDと名前の両方、または片方に対応）
	public List<studentinfo> search(String studentIdStr, String studentName) throws Exception {
	    List<studentinfo> resultList = new ArrayList<>();

	    // ID検索
	    if (studentIdStr != null && !studentIdStr.isEmpty()) {
	        try {
	            int id = Integer.parseInt(studentIdStr);
	            resultList.addAll(this.idFilter(id));
	        } catch (NumberFormatException e) {
	            // ここでの例外はスルー
	        }
	    }

	    // 名前検索
	    if (studentName != null && !studentName.isEmpty()) {
	        resultList.addAll(this.nameFilter(studentName));
	    }

	    // 重複を除去
	    return new ArrayList<>(resultList.stream()
	            .collect(Collectors.toMap(
	                studentinfo::getStudentId, // キーを生徒IDにする
	                s -> s,                    // 値を生徒オブジェクトそのままにする
	                (existing, replacement) -> existing // 重複したら既存を優先
	            )).values());
	}


	// 学生ID一覧を取得
	public List<Integer> getAllID() throws Exception {
		String sql = "select studentid from studentinfo";
		List<Integer> list = new ArrayList<>();

		// DBへの接続
		Connection connection = getConnection();
		// SQL用
		PreparedStatement statement = null;
		ResultSet rSet = null;

		String order = " order by studentid asc";

		// sqlの処理
		try {
			statement = connection.prepareStatement(sql + order);
			// sqlの実行
			rSet = statement.executeQuery();
			while (rSet.next()) {
				int stuId = rSet.getInt("studentid");

				list.add(stuId);
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
		return list;
	}

	// 生徒情報を保存する 引数:生徒インスタンス
	public boolean save(studentinfo stuInfo) throws Exception {
		// クラスの登録処理（裏作業）
		String className = stuInfo.getClasses();
		if (className != null && !className.isEmpty()) {
            classes_dao cDao = new classes_dao();
            // 検索に引っかからなかった場合、登録処理を行う
            if (!cDao.filter(className)) {
                cDao.save(className);
            }
        }
		//DBに接続
		Connection connection = getConnection();
		PreparedStatement statement = null;
		// 実行件数
		int count = 0;

		try {
			//今DBにあるこの番号の生徒を取得
			studentinfo old = idPickUp(stuInfo.getStudentId());
			if (old == null) {
				// 生徒が存在しなかった場合
				// SQL文にinsert文を加え、学生の新規登録を行う
				statement = connection.prepareStatement("insert into studentinfo (studentid,studentname,classes) values(?,?,?)");
				// PreparedStatementに値をバインド
				statement.setInt(1, stuInfo.getStudentId());
				statement.setString(2, stuInfo.getStudentName());
				statement.setString(3, stuInfo.getClasses());
			} else {
				// 学生が存在した場合
				// SQL文にupdate文を加え、学生の更新を行う
				statement = connection.prepareStatement("update studentinfo set studentid=?,studentname=?,classes=? where studentid=?");
				// SQL文の条件文に値をセット
				statement.setInt(1, stuInfo.getStudentId());
				statement.setString(2, stuInfo.getStudentName());
				statement.setString(3, stuInfo.getClasses());
				statement.setInt(4, stuInfo.getStudentId());
			}
			// SQL文を実行
			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			// SQL入力を終了
			if (statement != null) {
				try {
					connection.close();
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

	// 指定した生徒を削除する
	public boolean delete(int studentId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		String delete = "delete from studentinfo";
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
