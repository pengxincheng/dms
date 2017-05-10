package com.dms.Util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static Date formatStartTime(String startTime) {

		Date date = null;
		startTime = startTime + " 00:00:00";
		
		try {
			date = sdf.parse(startTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static Date formatEndTime(String endTime) {
		Date date = null;
		endTime = endTime + " 23:59:59";
		
		try {
			date = sdf.parse(endTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	
	public static void main(String[] args) {
		System.out.println(DateUtils.formatStartTime("2017-02-03"));
	}

}
