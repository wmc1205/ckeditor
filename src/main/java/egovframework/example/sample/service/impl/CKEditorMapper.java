/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.cmmn.web.EgovComAbstractDAO;
import egovframework.example.sample.service.NoticeVO;

import egovframework.example.sample.service.SampleVO;


import org.springframework.stereotype.Repository;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Repository(value = "ckEditorMapper")
public class CKEditorMapper extends EgovComAbstractDAO {

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectDataListTotCnt(NoticeVO vo) throws Exception{
		return selectOne("selectDataListTotCnt",vo);
	}

	public List<NoticeVO> selectDataList(NoticeVO vo) throws Exception {
		 return selectList("selectDataList",vo);
	}

	public NoticeVO selectNotice(NoticeVO noticeVO) {
		return selectOne("selectNotice",noticeVO);
	}

	public int saveNotice(NoticeVO noticeVO) {
		return insert("saveNotice",noticeVO);
	}

	public int nextTestid() {
		
		return selectOne("nextTestid");
	}

	

}
