package egovframework.example.sample.web;


import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import egovframework.example.sample.service.CKEditorService;
import egovframework.example.sample.service.NoticeVO;


@Controller
public class CkEditorController {
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "ckEditorService")
	protected CKEditorService ckEditorService;

	@GetMapping(value= "/writeView.do")
	public String goWriteViewPage() {
		return "notice/writeView";
	}
	
	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param noticeVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/main.do")
	public String selectNoticeList(@ModelAttribute("searchVO") NoticeVO noticeVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		noticeVO.setPageUnit(propertiesService.getInt("pageUnit"));
		noticeVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(noticeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(noticeVO.getPageUnit());
		paginationInfo.setPageSize(noticeVO.getPageSize());

		noticeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		noticeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		noticeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<NoticeVO> noticeList = ckEditorService.selectDataList(noticeVO);
		model.addAttribute("resultList", noticeList);

		int totCnt = ckEditorService.selectDataListTotCnt(noticeVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "notice/main";
	}
	
	@RequestMapping(value = "/ckUploadImage.do", method = RequestMethod.POST)
	public void ckUploadImage(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multifile) throws Exception {

	    JsonObject json = new JsonObject();
	    PrintWriter printWriter = null;
	    OutputStream out = null;
	    MultipartFile file = multifile.getFile("upload");

	    if (file != null) {
	        if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	            if (file.getContentType().toLowerCase().startsWith("image/")) {
	                try {
	                    String fileName = file.getOriginalFilename();
	                    byte[] bytes = file.getBytes();
	                    String uploadPath = request.getSession().getServletContext().getRealPath("/images/ckeditor");

	                    File uploadFile = new File(uploadPath);
	                    if (!uploadFile.exists()) {
	                        uploadFile.mkdirs();
	                    }
	                    String uid = UUID.randomUUID().toString();
	                    uploadPath = uploadPath + "/" + uid + "_" + fileName; // 파일 이름에 UUID 추가
	                    out = new FileOutputStream(new File(uploadPath));
	                    out.write(bytes);
	                    printWriter = response.getWriter();
	                    response.setContentType("text/html"); 
	                    // 이미지 URL을 정확하게 생성
	                    String fileUrl = request.getContextPath() + "/images/ckeditor/" + uid + "_" + fileName;

	                    json.addProperty("uploaded", 1);
	                    json.addProperty("fileName", fileName);
	                    json.addProperty("url", fileUrl);

	                   
	                    printWriter.println(json);

	                } catch (IOException e) {
	                    e.printStackTrace();
	                } finally {
	                    if (out != null) {
	                        out.close();
	                    }
	                    if (printWriter != null) {
	                        printWriter.close();
	                    }
	                }
	            }
	        }
	    }
	}
	
	@RequestMapping(value = "/selectNotice.do", method = RequestMethod.GET)
	public String selectNotice(@ModelAttribute("searchVO") NoticeVO noticeVO, ModelMap model) throws Exception {
		NoticeVO vo = new NoticeVO();
		vo = ckEditorService.selectNotice(noticeVO);
		model.addAttribute("noticeVO",vo);
		return "notice/noticeView";
	}
	
	@RequestMapping(value = "/saveNotice.do", method = RequestMethod.POST)
	public String saveNotice(@ModelAttribute("searchVO") NoticeVO noticeVO, ModelMap model) throws Exception {
		int result = 0;
		String testid = Integer.toString(ckEditorService.nextTestid());
		noticeVO.setTestid(testid);
		
		result = ckEditorService.saveNotice(noticeVO);
		
		if(result < 0) {
			model.addAttribute("result","저장 실패");
		}else {
			model.addAttribute("result","저장 완료");
		}
		return "redirect:/main.do";
	}
}
	
