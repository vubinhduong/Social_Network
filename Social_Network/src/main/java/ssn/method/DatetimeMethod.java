package ssn.method;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DatetimeMethod {
	
	public static void main(String[] args) {
		System.out.println(calTimeAgo("2021-05-26 10:13:17"));
	}
	
	
	public static long calDiffDate(String time, TimeUnit timeUnit) {
		try {
			Date dateNow = new Date();
			Date dateFrom = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
			long diff = dateNow.getTime() - dateFrom.getTime();
		    return timeUnit.convert(diff, TimeUnit.MILLISECONDS);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public static String calTimeAgo(String time) {
		long dayDiff = calDiffDate(time, TimeUnit.DAYS);
		long hourDiff = calDiffDate(time, TimeUnit.HOURS);
		long minuteDiff = calDiffDate(time, TimeUnit.MINUTES);
		
		if(dayDiff >= 7) {
			return time;
		}
		
		if(0<dayDiff && dayDiff<7) {
			return dayDiff + 1 + " ngày trước";
		}
		
		if(0 < hourDiff) {
			return hourDiff + 1 + " giờ trước";
		}
		
		if(minuteDiff == 0) {
			return "Vừa xong";
		}
		
		return minuteDiff + " phút trước";
	}

}
