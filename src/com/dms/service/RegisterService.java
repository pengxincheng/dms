package com.dms.service;

import java.util.List;

import com.dms.entity.Register;

/**
 *Created by pxc on 2017年4月24日 上午10:37:03
 * 
 */

public interface RegisterService {

	/**
	 * 缺勤、晚归登记列表
	 * @param register
	 * @return
	 */
	List<Register> findAllRegisters(Register register);
	/**
	 * 添加缺勤、晚归登记
	 * @param register
	 * @return
	 */
	int addRegister(Register register);
	
	/**
	 * 更新缺勤、晚归登记
	 * @param register
	 * @return
	 */
	int updateRegister(Register register);
	/**
	 * 缺勤、晚归登记详细
	 * @param id
	 * @return
	 */
	Register getRegisterById(Integer id);
	
	/**
	 * 删除缺勤、晚归登记
	 * @param id
	 * @return
	 */
	int delRegisterById(Integer id);
}
