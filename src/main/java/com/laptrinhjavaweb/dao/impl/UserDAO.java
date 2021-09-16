package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.mapper.RowMapper;
import com.laptrinhjavaweb.mapper.UserMapper;
import com.laptrinhjavaweb.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	private RowMapper<UserModel> rowMapper;

	public void updateUser(Long id, String userName, String password, String fullName, String email, String phone, int age, String avatar, String status, String roleId) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE user SET username = ?, password = ?, fullname = ? , email = ?, phone = ?, age = ?, avatar =?, status = ?, roleid = ? WHERE id = ?;";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, userName);
			statement.setString(2, password);
			statement.setString(3, fullName);
			statement.setString(4, email);
			statement.setString(5, phone);
			statement.setInt(6, age);
			statement.setString(7, avatar);
			statement.setString(8, status);
			statement.setString(9, roleId);
			statement.setLong(10, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.print(e);
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
			}
		}
	}
	public void updateAvatar(Long id, String avatar) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE user SET avatar = ? WHERE id = ?;";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, avatar);
			statement.setLong(2, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.print(e);
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
			}
		}
	}
	public void DeleteUser(Long id) {
		String sql = "Delete from user where id = ?";
		update(sql, id);
	}
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}
	
	public UserModel findUserById(String id) {
		String sql = "select * from user where id = ?";
		List<UserModel> list = query(sql, new UserMapper(), id);
		return list.get(0);
	}

	@Override
	public void SignUp(String userName, String password, String fullName, String email, String phone, int age, String status, String roleId) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "insert into user(username, password, fullname, email, phone, age, status, roleid, createddate) values(?, ?, ?, ?, ?, ? ,? ,? ,?)";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, userName);
			statement.setString(2, password);
			statement.setString(3, fullName);
			statement.setString(4, email);
			statement.setString(5, phone);
			statement.setInt(6, age);
			statement.setString(7, status);
			statement.setString(8, roleId);
			statement.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			statement.executeUpdate();
		} catch (SQLException e) {
			
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
			}
		}
	}
	
	@Override
	public UserModel checkAccoutExits(String userName) {
		String sql = "select * from user where username = ?";
		UserModel user = new UserModel();
		List<UserModel> users = query(sql, new UserMapper(), userName);
		if (users.isEmpty())
			return null;
		else {
			user = users.get(0);
			return user; 
		}
	}
	
	public List<UserModel> getAll(){
		String sql = "select * from user";
		return query(sql,new UserMapper());
	}
	

}
