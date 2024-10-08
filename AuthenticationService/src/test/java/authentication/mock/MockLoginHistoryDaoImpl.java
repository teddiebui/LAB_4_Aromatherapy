package authentication.mock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import authentication.dao.LoginHistoryDAOImpl;
import authentication.model.LoginHistory;

public class MockLoginHistoryDaoImpl extends LoginHistoryDAOImpl {
	
	private Connection connection;

	public MockLoginHistoryDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}
	
	
	public Connection getConnection() {
		return connection;
	}


	public void setConnection(Connection connection) {
		this.connection = connection;
	}


	@Override
	public void create(LoginHistory loginHistory) throws SQLException {

		PreparedStatement preparedStatement;
		
		try {
			preparedStatement = connection.prepareStatement(SQL_CREATE);
			preparedStatement.setString(
					1, loginHistory.getUsername());
			preparedStatement.setBoolean(
					2, loginHistory.isLoginStatus());
			preparedStatement.setString(
					3, loginHistory.getLoginDevice());
			preparedStatement.setString(
					4, loginHistory.getLoginIP());
			preparedStatement.setInt(
					5, loginHistory.getLoginAttempt());
			preparedStatement.setString(
					6, loginHistory.getRefreshKey());
			
			
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			throw exception;
		}
	}
	
	@Override
	public List<LoginHistory> getAll() throws SQLException {
		List<LoginHistory> list = new ArrayList<>();
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		try {
			preparedStatement = connection.prepareStatement(SQL_GET_ALL);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				LoginHistory loginHistory = constructModel(resultSet);
				list.add(loginHistory);
			}
		} catch (SQLException exception) {
			throw exception;
		}
		
		return list;
		
	}
	
	@Override
	public void update(LoginHistory loginHistory) throws SQLException {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(SQL_UPDATE);
			preparedStatement.setString(
					1, loginHistory.getUsername());
			preparedStatement.setBoolean(
					2, loginHistory.isLoginStatus());
			preparedStatement.setString(
					3, loginHistory.getLoginDevice());
			preparedStatement.setString(
					4, loginHistory.getLoginIP());
			preparedStatement.setInt(
					5, loginHistory.getLoginAttempt());
			preparedStatement.setString(
					6, loginHistory.getRefreshKey());
			preparedStatement.setBoolean(
					7, loginHistory.isRefreshKeyActive());
			preparedStatement.setInt(
					8, loginHistory.getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			throw exception;
		}
	}
	

	@Override
	public List<LoginHistory> getAllByUsername(String username) throws SQLException {
		List<LoginHistory> list = new ArrayList<>();
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		try {
			preparedStatement = connection.prepareStatement(SQL_GET_ALL_BY_USERNAME);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				LoginHistory loginHistory = constructModel(resultSet);
				list.add(loginHistory);
			}
		} catch (SQLException exception) {
			throw exception;
		} 
		return list;
		
	}
	
	@Override
	public void invalidateRefreshToken(LoginHistory loginHistory)
			throws SQLException {
		PreparedStatement preparedStatement;
		
		try {
			preparedStatement = connection.prepareStatement(SQL_INVALIDATE_REFRESH_TOKEN);
			preparedStatement.setBoolean(
					1, false);
			preparedStatement.setInt(
					2, loginHistory.getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {

			throw exception;
		}
	}
	
	@Override
	public LoginHistory getLastLoginSuccess(String username) throws SQLException {
		// TODO Auto-generated method stub
		LoginHistory loginHistory = null;
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		
		try {
			preparedStatement = connection.prepareStatement(SQL_GET_LATEST_LOGIN_SUCCESS);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				loginHistory = constructModel(resultSet);
			}
			
		} catch (SQLException exception) {
			throw exception;
		}
		
		return loginHistory;
	}
	
	@Override
	public LoginHistory findByToken(String token) throws SQLException{
		LoginHistory loginHistory = null;
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		
		try {
			preparedStatement = connection.prepareStatement(SQL_FIND_BY_TOKEN);
			preparedStatement.setString(1, token);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				loginHistory = constructModel(resultSet);
			}
			
		} catch (SQLException exception) {
			throw exception;
		}
		return loginHistory;
		
	}
	
	
	
}
