package ${packageName}.bo.impl;

import org.springframework.stereotype.Service;
import ${packageName}.bo.${classInfo.className}BO

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd HH:mm:ss')}
 */
@Service
public class ${classInfo.className}BOImpl implements ${classInfo.className}BO {

	@Resource
	private ${classInfo.className}${classInfo.daoSuffix} ${classInfo.className?uncap_first}${classInfo.daoSuffix};


	@Override
	public ReturnT<String> insert(${classInfo.className} ${classInfo.className?uncap_first}) {

		// valid
		if (${classInfo.className?uncap_first} == null) {
			return new ReturnT<String>(ReturnT.FAIL_CODE, "必要参数缺失");
        }

		${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});
        return ReturnT.SUCCESS;
	}


	@Override
	public ReturnT<String> delete(int id) {
		int ret = ${classInfo.className?uncap_first}Mapper.delete(id);
		return ret>0?ReturnT.SUCCESS:ReturnT.FAIL;
	}


	@Override
	public ReturnT<String> update(${classInfo.className} ${classInfo.className?uncap_first}) {
		int ret = ${classInfo.className?uncap_first}Mapper.update(${classInfo.className?uncap_first});
		return ret>0?ReturnT.SUCCESS:ReturnT.FAIL;
	}


	@Override
	public ${classInfo.className} load(int id) {
		return ${classInfo.className?uncap_first}Mapper.load(id);
	}


	@Override
	public Map<String,Object> pageList(int offset, int pagesize) {

		List<${classInfo.className}> pageList = ${classInfo.className?uncap_first}Mapper.pageList(offset, pagesize);
		int totalCount = ${classInfo.className?uncap_first}Mapper.pageListCount(offset, pagesize);

		// result
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageList", pageList);
		result.put("totalCount", totalCount);

		return result;
	}

}
