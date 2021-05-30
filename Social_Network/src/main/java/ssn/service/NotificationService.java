package ssn.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.NotificationDAO;
import ssn.method.DatetimeMethod;
import ssn.model.Notification;
import ssn.model.Post;
import ssn.model.User;

@Service
@Transactional
public class NotificationService {
	@Autowired
	private NotificationDAO notiDAO;
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	
	public List<Notification> getNotiByUserID(int userID) {
		List<Post> listPost = postService.getPostByUserID(userID);
		List<Integer> listPostID = new ArrayList<Integer>();
		for (Post post : listPost) {
			listPostID.add(post.getPostID());
		}
		return notiDAO.getNotiByPostIDs(listPostID);
	}
	
	public void addNoti(int postID, int userID, int act) {
		notiDAO.addNoti(postID, userID, act);
	}
	
	public List<Notification> initNofi(List<Notification> listNofi) {
		if(listNofi.size() == 0) return null;
		for (Notification noti : listNofi) {
			User u = userService.getUserByUserID(noti.getUserID());
			noti.setNameShowed(u.getNameShowed());
			noti.setTimeAgo(DatetimeMethod.calTimeAgo(noti.getTime()));
			if (noti.getAct() == 1) {
				noti.setContent(" đã bình luận về một ảnh của bạn");
			} else {
				noti.setContent(" đã thích một ảnh của bạn");
			}
			noti.setAvatar(u.getAvatar());
		}
		return listNofi;
	}

}
