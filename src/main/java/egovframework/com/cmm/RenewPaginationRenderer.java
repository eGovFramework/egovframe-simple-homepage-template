/*
 * Copyright 2008-2009 the original author or authors.
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
package egovframework.com.cmm;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractKrdsPaginationRenderer;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ServletContextAware;

import jakarta.servlet.ServletContext;

/**
 * RenewPaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일              수정자                      수정내용
 *  ----------  -------------    ----------------------
 *  2011.09.16  서준식                      이미지 경로에 ContextPath추가
 *  2021.08.12  신용호                      신규 디자인 적용
 *  
 * </pre>
 */

public class RenewPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	private static final Logger LOGGER = LoggerFactory.getLogger(ImagePaginationRenderer.class);

	private ServletContext servletContext;

	public RenewPaginationRenderer() {
		// no-op
	}

	/**
	* PaginationRenderer
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getContextPath={}", servletContext.getContextPath());
		}
		
        firstPageLabel    = "<li class=\"btn\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"first\">처음</a></li>";
        previousPageLabel = "<li class=\"btn\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"btn prev\">이전</a></li>";
        currentPageLabel  = "<li><strong>{0}</strong></li>";
        otherPageLabel    = "<li><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></li>";
        nextPageLabel     = "<li class=\"btn\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"btn next\">다음</a></li>";
        lastPageLabel     = "<li class=\"btn\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"btn last\">마지막</a></li>";
	
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
