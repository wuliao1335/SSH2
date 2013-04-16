package com.test.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
	public static String format(long time,String format){
		SimpleDateFormat sdf =  new SimpleDateFormat(format);
		return sdf.format(new java.util.Date(time));
	}
	public static long parse(String date,String format){
	  SimpleDateFormat sdf =  new SimpleDateFormat(format);
	  try {
      return sdf.parse(date).getTime();
    } catch (ParseException e) {
      return 0;
    }
	}
	public static int age(long birthday,long now){
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(birthday);
		int byear = c.get(Calendar.YEAR);
		c.setTimeInMillis(now);
		int nyear = c.get(Calendar.YEAR);
		return nyear-byear;
	}
	public static void main(String [] a) throws Exception {
		
	}
}
