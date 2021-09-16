package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	
	void SignUp(String userName, String password, String fullName, String email, String phone, int age, String status, String roleId);
	
	UserModel checkAccoutExits(String userName);
}
