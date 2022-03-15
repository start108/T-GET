package com.tget.service.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.user.domain.User;

public interface UserDao {


		public void insertUser(User user) throws Exception;
		public User selectUser(String userId) throws Exception;
		public List<User> selectUserList(Search search) throws Exception;
		public void updateUser(User user) throws Exception;
		public void insertBlacklist(User user)throws Exception;
		public User selectSellerEval(String userId)throws Exception;
		public User selectSalesGrade(String userId)throws Exception;
		public int selectTotalCount(Search search) throws Exception ;
		public User nickNameCheck(String nickName) throws Exception ;
		public User userIdCheck(String userId) throws Exception ;
		public User selectCode(String code) throws Exception;
		public User selectnickName(String nickName)throws Exception;
		public User selectuserId(String userId)throws Exception;
		public User selectcode(String code)throws Exception;
		public User finduserId(String phone) throws Exception ;
		public User findPassword(String userId)throws Exception;
		public void updatePassword(User user)throws Exception;
		public User selectKakao(String kakaoId)throws Exception;
		public User selectNaver(String naverId)throws Exception;

}
