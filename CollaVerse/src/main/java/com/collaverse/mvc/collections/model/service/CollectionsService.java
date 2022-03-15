package com.collaverse.mvc.collections.model.service;

import java.util.List;

import com.collaverse.mvc.collections.model.vo.Collections;

public interface CollectionsService {

	List<Collections> findUser(String searchOption, String keyword);

}
