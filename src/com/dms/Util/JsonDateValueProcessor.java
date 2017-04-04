package com.dms.Util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 *Created by pxc on 2017年4月3日 下午12:36:23
 * 
 */

public class JsonDateValueProcessor implements JsonValueProcessor{

	 	private String format;   
	 	
	    public JsonDateValueProcessor(String format) {
			this.format = format;
		}

		public Object processArrayValue(Object value, JsonConfig config) {   
	        return process(value);   
	    }   
	  
	    public Object processObjectValue(String key, Object value, JsonConfig config) {   
	        return process(value);   
	    }   
	       
	    private Object process(Object value){   
	           
	        if(value instanceof Date){   
	            SimpleDateFormat sdf = new SimpleDateFormat(format,Locale.UK);   
	            return sdf.format(value);   
	        }   
	        return value == null ? "" : value.toString();   
	    }   
}
