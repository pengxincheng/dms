package com.dms.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *Created by pxc on 2017年4月13日 上午10:36:18
 * 
 */
@Component("taskTiXing")
public class TaskTiXing {
	 @Scheduled(cron = "*/5 * * * * ?")  
	    public void job1() {  
	        System.out.println("任务进行中。。。");  
	    }  
}
