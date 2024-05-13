package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CKEditorService;
import egovframework.example.sample.service.NoticeVO;

@Service("ckEditorService")
public class CKEditorServiceImpl extends EgovAbstractServiceImpl implements CKEditorService {
	
	@Resource(name="ckEditorMapper")
	CKEditorMapper ckeditorMapper;
	
	@Override
	public List<NoticeVO> selectDataList(NoticeVO noticeVO) throws Exception {
		return ckeditorMapper.selectDataList(noticeVO);
	}

	@Override
	public int selectDataListTotCnt(NoticeVO searchVO) throws Exception {
		return ckeditorMapper.selectDataListTotCnt(searchVO);
	}

	@Override
	public NoticeVO selectNotice(NoticeVO noticeVO) throws Exception {
		
		return ckeditorMapper.selectNotice(noticeVO);
	}

	@Override
	public int saveNotice(NoticeVO noticeVO) throws Exception {
		int result = 0;
		result = ckeditorMapper.saveNotice(noticeVO);
		return result;
	}

	@Override
	public int nextTestid() {
		
		return ckeditorMapper.nextTestid();
	}
}
