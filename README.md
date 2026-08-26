# 팀 프로젝트
Spring Boot를 이용한 웹사이트 구현 팀 프로젝트입니다.

## 프로젝트 소개
관리자의 회원 관리 및 상품 관리,
회원은 상품 구매, 주문 조회, 문의와 후기 작성
기능을 제공하는 온라인 쇼핑 사이트를 구현하는 프로젝트입니다.

## 개발 환경
- Java
- Spring Boot
- Spring MVC
- MyBatis
- MySQL
- Python
- Oracle
- HTML / CSS / JavaScript
- Eclipse STS
- GitHub

## 주요 기능
### 회원
- 회원 가입
- 로그인
- 회원 정보 수정
- 회원 탈퇴

### 상품
- 상품 등록
- 상품 조회
- 상품 수정
- 상품 삭제
- 상품 후기 등록

### 주문
- 상품 주문
- 주문 조회
- 주문 취소

### 게시판
- 1:1 문의 등록
- 공지사항 조회
  
### 관리자
- 회원 정보 관리
- 주문 정보 관리
- 배송 정보 관리
- 공지사항 등록
- 1:1 문의 답변

## 팀원

| 이름  |         담당          |
|-------|-----------------------|
| 김은진 | 회원, 로그인 폼, CSS   |
| 홍혜진 | 상품, 결제 기능 구현   |
| 차도일 | 공지, 문의, 후기 게시판|
| 이동희 | 메인 CSS, 데이터 수집  |

## Git 협업 규칙
- `main` 브랜치 직접 Push 금지
- 개인 브랜치에서만 작업
- 작업 완료 후 message 작성하여 Commit
- GitHub에 Push
- Pull Request 생성
- 팀장은 팀원이 수정한 코드 리뷰 후 `main` Merge
- 항상 GitHub에서 최신 파일 pull 후 작업

## 브랜치
- main
- master // main에 올리기 전 병합 브랜치
- KEJ // 김은진 팀원
- LDH // 이동희 팀원
- CDI // 차도일 팀원
- HHJ // 홍혜진 팀장

## 메뉴 구성

main
- ├── views/admin
- ├── views/cart
- ├── views/member
- ├── views/notice
- ├── views/one_inquiry
- ├── views/product
- └── views/review
