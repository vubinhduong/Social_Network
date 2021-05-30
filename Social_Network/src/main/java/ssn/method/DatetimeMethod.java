package ssn.method;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.concurrent.TimeUnit;

public class DatetimeMethod {

	public static void main(String[] args) {
		System.out.println(calTimeAgo("2021-05-20 10:13:17"));
		Date date = new Date();
		System.out.println(formatDate(date, "yyyy-MM-dd HH:mm:ss"));
		System.out.println(System.getProperty("user.dir").replaceAll("\\\\", "/"));
	}
	
	public static String getTimeNow() {
		Date date = new Date();
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}
	
	public static String formatDate(Date date, String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.format(date);
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

		if (dayDiff >= 7) {
			return time.split(" ")[0];
		}

		if (0 < dayDiff && dayDiff < 7) {
			return dayDiff + 1 + " ngày trước";
		}

		if (0 < hourDiff) {
			return hourDiff + 1 + " giờ trước";
		}

		if (minuteDiff == 0) {
			return "Vừa xong";
		}

		return minuteDiff + " phút trước";
	}

	public static String getNow() {
		Date date = new Date();
		return formatDate(date, "yyyy-MM-dd");
	}
	
	public static Date addDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return cal.getTime();
	}
	
	public static Date subtractDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, -days);
		return cal.getTime();
	}
}
