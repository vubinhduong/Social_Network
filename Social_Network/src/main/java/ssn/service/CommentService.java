package ssn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.CommentDAO;
import ssn.dao.UserDAO;
import ssn.model.Comment;
import ssn.model.Post;
import ssn.model.User;

@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserDAO userDAO;
	
	public List<Comment> getComment(int postID) {
		List<Comment> listComment = commentDAO.getCommentByPostID(postID);
		for (int i=0; i<listComment.size(); i++) {
			User user = userDAO.getUserByUserID(listComment.get(i).getUserID());
			listComment.get(i).setUserComment(user);
		}
		return listComment;
	}
	
	public void comment(int postID, int userID, String content) {
		commentDAO.comment(postID, userID, content);
	}
	
}
