/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.language = 'en';			//언어설정
	config.width = 'auto';			//Editor 넓이
	config.docType = "<!DOCTYPE html>";		//문서타입 설정
	config.toolbarStartupExpanded = false; // 툴바 접기
};
