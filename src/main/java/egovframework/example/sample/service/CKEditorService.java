package egovframework.example.sample.service;

import java.util.List;

public interface CKEditorService {

	public List<NoticeVO> selectDataList(NoticeVO searchVO) throws Exception;

	public int selectDataListTotCnt(NoticeVO searchVO) throws Exception;

	public NoticeVO selectNotice(NoticeVO noticeVO) throws Exception;

	public int saveNotice(NoticeVO noticeVO) throws Exception;

	public int nextTestid();

}
