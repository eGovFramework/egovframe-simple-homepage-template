# 표준프레임워크 템플릿 프로젝트 심플 홈페이지

![java](https://img.shields.io/badge/java-007396?style=for-the-badge&logo=JAVA&logoColor=white)
![javascript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![Spring](https://img.shields.io/badge/Spring-F2F4F9?style=for-the-badge&logo=spring)
![jquery](https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
![maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)

※ 본 프로젝트는 표준프레임워크에서 제공하는 공통컴포넌트의 기능들 중 일부를 선정하여 기본 구성한 참조용 프로젝트 소스입니다.

## 프로젝트 소개

### 프로젝트 개요

단순 홈페이지 기능 구현 시 필수적인 부분만 사용 가능하도록 경량화 된 실행환경 제공  
메인 페이지, 사용자 관리, 공지사항 관리, 게시판 관리, 안내 관리 기능을 제공

### 메뉴 구성

![menu_sht_v4](https://user-images.githubusercontent.com/3771788/229035504-8747b752-ffa8-4f53-963f-cdb62a36d66b.jpg)

## 참고 화면 및 메뉴 설명

### 메인 화면

![sh1 (1)](https://user-images.githubusercontent.com/3771788/229035534-3146e773-f67a-4197-a966-38117b91692b.jpg)

1. 홈페이지 템플릿은 관리자만 로그인 가능하다는 전제로 구성되었으며 최초 관리자 계정 설정은 **[ 로그인계정 : admin , 로그인암호 : 1 ]** 로 설정되어 있다.
2. 관리자 추가 및 변경 기능은 추가 구성되어 있지 않으므로 필요 시 DB를 통해 직접 변경한다. (암호 셋팅 값은 공통컴포넌트의 암호화 로직에 따라 생성해야 함)
3. 기본 기능이나 예시 메뉴를 실무적으로 추가 커스터마이징하여 활용할 수 있다.

### 사이트 소개 화면

![sh2 (1)](https://user-images.githubusercontent.com/3771788/229035569-f68ad92b-e614-4398-b49f-a2b9eed65ef9.jpg)

- **해당 화면 및 세부 메뉴 화면은 구성을 위한 샘플페이지가 제공되며 기능은 구현되지 않은 상태입니다.**

1. 세부메뉴 : 사이트소개, 연혁, 조직소개, 찾아오시는 길
2. 기능설명 : 예시 메뉴에 해당하는 항목으로 샘플 페이지 형태로 링크와 JSP파일이 존재한다.
3. 활용방법 : 각 샘플 페이지에 대한 콘텐츠를 새로 구성하여 활용할 수 있다.

### 정보마당 화면

![sh3 (1)](https://user-images.githubusercontent.com/3771788/229035594-051ee465-9ea0-4b9c-9771-71e930674382.jpg)

- **해당 화면 및 세부 메뉴 화면은 구성을 위한 샘플페이지가 제공되며 기능은 구현되지 않은 상태입니다.**

1. 세부메뉴 : 주요사업 소개, 대표서비스 소개
2. 기능설명 : 예시 메뉴에 해당하는 항목으로 샘플 페이지 형태로 존재한다.
3. 활용방법 : 각 샘플 페이지에 대한 콘텐츠를 새로 구성하여 활용할 수 있다.

### 고객지원 화면

![sh4 (1)](https://user-images.githubusercontent.com/3771788/229035624-2de16df9-bc79-4d68-8e6e-8ece9189bf9a.jpg)

- **해당 화면 및 세부 메뉴 화면은 구성을 위한 샘플페이지가 제공되며 기능은 구현되지 않은 상태입니다.**

1. 세부메뉴 : 자료실, 묻고답하기, 서비스신청
2. 기능설명 : 예시 메뉴에 해당하는 항목으로 샘플 페이지 형태로 존재한다.
3. 활용방법 : 각 샘플 페이지에 기능을 추가 개발 후 구성하여 활용할 수 있다.

### 알림마당 화면

![sh5 (1)](https://user-images.githubusercontent.com/3771788/229035640-9def026a-74bb-43b5-b09f-84a8a5c830df.jpg)

1. 세부메뉴 : 오늘의행사, 금주의행사, 공지사항, 사이트갤러리
2. 기능설명 : 공통컴포넌트 일정관리(부서일정)와 게시판 기능을 커스터마이징하여 사용한다.
3. 활용방법 : 관리자가 등록한 일정정보를 조회하거나 게시물을 조회할 수 있다.

### 사이트관리 화면

![sh6 (1)](https://user-images.githubusercontent.com/3771788/229035687-9fead8d2-1c61-42b8-a974-160ae847caf6.jpg)

1. 세부메뉴 : 일정관리, 게시판생성관리, 게시판사용관리, 공지사항관리, 사이트갤러리관리
2. 기능설명 : 공통컴포넌트 일정관리(부서일정)과 게시판 기능을 커스터마이징하여 사용한다.
3. 활용방법 : 관리자로 로그인 한 후 일정정보를 등록하거나 게시물을 등록할 수 있다. (게시판 설정 가능)

## 환경 설정

프로젝트에서 사용된 환경 프로그램 정보는 다음과 같다.
| 프로그램 명 | 버전 명 |
| :--------- | :------ |
| java | 1.8 이상 |
| maven | 3.8.4 |

## 프로젝트 실행

1. eclipse 하단의 Servers 탭을 클릭하고, 마우스 우클릭하여 **New > Server** 를 선택하여 서버를 설치한다.

2. 생성 또는 복사된 소스 내부의 DATABASE 폴더 내 dml, ddl을 참고하여 연결하고자 하는 DB에 테이블 생성 및 기초 데이터를 생성한다.  
   dml 및 ddl은 5가지 데이터베이스(Altibase, Cubrid, MySQL, Oracle, Tibero)를 지원한다.

![new_template_sht_run1](https://user-images.githubusercontent.com/3771788/229035724-9530fca0-b67a-41fc-a1b9-b7bcddc569a8.jpg)

3. [템플릿 구성 및 환경설정](https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:let4:configration) 문서를 참고하여 템플릿 환경설정을 수행한다.

4. 실행할 프로젝트를 마우스 우클릭하고 **Run As > Run on Server** 를 선택한다.
