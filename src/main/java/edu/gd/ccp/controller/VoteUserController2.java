package edu.gd.ccp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;

@Controller
@Scope(value = "prototype")
@RequestMapping("/vote")
class VoteUserController2 {
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;
	
    // 进入投票界面
	@RequestMapping(value = "/voteUi")
	public String voteUi(Integer voteResultId,Model model,
			HttpServletRequest request) {
		model.addAttribute("voteResultId", voteResultId);
		return "vote/voteUi";
     }
	
    // 进行投票
	@RequestMapping(value = "/newVote")
	public String newVote( String selectedCandidaters,Integer voteResultId,Model model,
			HttpServletRequest request) {
		
		return "vote/voteCandidate";
     }

		
}
