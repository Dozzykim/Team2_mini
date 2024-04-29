# 프로젝트: 더조은 병원
병원 예약 및 환자 커뮤니티 시스템
<br>
여기에 로고사진

## 목차
### 1. 프로젝트 개요
- 프로젝트 주제 및 선정 배경
- 차별점
- 기획의도
### 2. 프로젝트 구조
- 주요 기능
- Flow Chart
- 폴더 및 파일 구축

### 3. 프로젝트 팀 구성 및 역할

### 4. 프로젝트 수행 절차 및 방법
- 수행 절차
- 수행 방법

### 5. 프로젝트 수행 경과
- 요구사항 정의서
- 기능 정의서
- ERD
- 테이블 정의서
- 화면 설계서
- 기능구현(프로젝트 실제화면 UI)

### 6. 자체 평가 의견
- 개별 평가


<br><br>

# 1. 프로젝트 개요
## 1-1. 프로젝트 주제
- 이용자 간 소통 및 정보 공유와 사용자 친화적인 예약 프로세스를 제공하는 병원 예약 및 환자 커뮤니티 시스템

## 1-2. 주제 선정 배경
- 코로나바이러스 발생 이후, 건강과 관련된 서비스에 대한 수요가 더욱 증가
- 온라인 의료 서비스의 부상 및 수요성 증가
- 개인 건강에 대한 인식 상승 및 건강 유지 욕구 상승 <br><br>
➡️ 기획의도: 건강과 관련된 서비스 필요성 증가 및 건강한 생활을 향한 일상에서의 접근 필요성을 느낌


## 1-3. 차별점
- 통합된 커뮤니티 플랫폼: 예약 기능과 함께 자신의 경험을 공유하고 도움이 될 수 있는 통합 플랫폼
- 개인화된 서비스: 원하는 진료과의 선택을 통해 찾고자 하는 정보를 빠르게 검색 및 등록이 가능
- 사용하기 쉬운 UI/UX를 통해 예약 프로세스를 간소화

## 1-4. 활용방안 및 기대효과
- 환자 만족도 향상
    - 개인화된 서비스를 통해 환자들은 더 빠르고 효과적으로 의료 서비스를 이용 가능
    - 커뮤니티 기능을 통해 서로의 경험을 공유하고 지원

- 건강 관리 향상
    - 이용자 간 소통과 정보 공유를 통해 다양한 의견을 수용 가능
    - 자신이 겪은 경험을 제공하면서 다시 한번 건강의 중요성을 깨닫게 됨
    - 다양한 방법의 건강 관리 방법을 공유하고 많은 사람들이 건강 관리에 집중 가능

- 의료 서비스 효율성 증대
    -카테고리 별 진료 과(외과, 내과, …) 선택과 날짜를 선택하여 빠른 예약이 가능

- 고객 유치 및 유지
    - 만족도가 높은 환자들은 재방문하거나 추천할 가능성 상승
    - 병원 매출과 평판에 긍정적인 영향을 미침

- 마케팅 및 홍보 효과
    - 유지 보수 및 관리를 통해 서비스 품질을 유지하고 향상시켜 이용자의 만족도를 바탕으로 병원의 이미지와 평판을 개선 가능
    - 커뮤니티 기능을 통해 이용자의 평가와 추천을 얻어 마케팅 홍보에 큰 도움을 얻음
    - 
<br><br>

# 2. 프로젝트 구조
## 2-1. 주요 기능
- 사용자
    - 회원가입
    - 로그인 / 로그아웃
        - 아이디 저장
        - 자동 로그인
    - 아이디 / 비밀번호 찾기
    - 마이페이지
        - 개인정보 조회
        - 개인 예약 리스트
        - 작성한 게시글 조회

- 관리자
    - 로그인/로그아웃
    - 전체 회원 관리
        - 전체 회원 정보 조회
        - 회원별 조회
            - 예약 현황
            - 작성한 게시글
    - 전체 게시글 및 댓글 관리
        - 게시글 목록 (전체 조회)
        - 게시글 검색 (카테고리 + 게시글 번호)
        - 게시글 삭제
        - 댓글 삭제

- 게시판
    - 게시글 정보
        - 게시글 목록 (전체 조회)
        - 게시글 검색 (카테고리 + 게시글 번호)
        - 게시글 등록
        - 게시글 수정
        - 게시글 삭제
    - 댓글
        - 댓글 조회 (해당 게시글의 전체 댓글 조회)
        - 댓글 등록
        - 댓글 삭제

- 진료 예약 서비스
    - 진료 예약

## 2-2. Flow Chart
<details>
<summary><h3>ℹ️Flow Chart</h3></summary>
<div markdown="1">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/2a9689ff-7bbb-49d0-adce-8bdbbd11b4d2">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/6f5d1241-48bf-4eac-9b7f-b325c5c7710d">
</div>
</details>

## 2-3. 폴더 및 파일 구축
<details>
<summary><h3>ℹ️폴더 및 파일 구축</h3></summary>
<div markdown="1">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/ae15b2b3-6d2e-417c-ae4f-8ed6c1548489">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/b8b1884a-a69d-49bd-a4a4-6e5e5086bb6f">
</div>
</details>

<br><br>

# 3. 프로젝트 팀 구성 및 역할
- 인원 : 5명
- 김도희
    - 주요 담당: 게시판 및 댓글
    - 프로젝트 설계 및 DB 구축, 게시판 목록/조회/등록/수정/삭제, 댓글 조회/등록/삭제

- 신준수 
    - 주요 담당: 사용자
    - 프로젝트 설계 및 DB 구축, 회원가입, 로그인/로그아웃, 아이디/비밀번호 찾기
- 전나연
    - 주요 담당: 마이페이지, 관리자 페이지
    - 프로젝트 설계 및 DB 구축, 회원정보/예약정보 조회, 관리자 페이지
- 이태원
    - 주요 담당: 프론트 엔드 디자인
    - 프로젝트 설계, 전반적인 유저/관리자 페이지 디자인 구성 및 반응형 적용
- 정다운
    - 주요 담당: 프론트엔드 디자인
    - 프로젝트 설계, 전반적인 유저/관리자 페이지 디자인 구성 및 카카오맵 API 적용

<br><br>

# 4. 프로젝트 수행 절차 및 방법
## 4-1. 수행 절차
- 2024-04-02 ~ 2024-04-12
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/776432b9-95c6-4853-81ae-31e549e54b1f">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/e4024a66-c84a-4106-ad30-047918ee1746">

## 4-2. 수행 방법
- 사용 언어 : <img src="https://img.shields.io/badge/java-007396?style=flat&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=flat&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=flat&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=flat&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=flat&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/Ajax-007396?style=flat&logo=Ajax&logoColor=white">
- 개발도구 : <img src="https://img.shields.io/badge/openjdk:1.8-686767?style=flat&logo=openjdk&logoColor=black"/> <img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=flat&logo=visualstudiocode&logoColor=white"/> <img src="https://img.shields.io/badge/eclipse-2C2255?style=flat&logo=eclipse&logoColor=white"/>
- 라이브러리 : <img src="https://img.shields.io/badge/gson-4285F4?style=flat&logo=google&logoColor=white"> 
- 사용 DB : <img src="https://img.shields.io/badge/oracle-F80000?style=flat&logo=oracle&logoColor=white"> 
- 참조 API : <img src="https://img.shields.io/badge/kakaoMAP-FFCD00?style=flat&logo=kakao&logoColor=black"> 
- 협업 Tools : <img src="https://img.shields.io/badge/trello-0052CC?style=flat&logo=trello&logoColor=white"/> <img src="https://img.shields.io/badge/github-181717?style=flat&logo=github&logoColor=white"/>

<br><br>

# 5. 프로젝트 수행 경과
## 5-1. 요구사항 정의서
<details>
<summary><h3>ℹ️요구사항 정의서</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/4c1c7430-925b-4f33-a3c6-fe70c27452d1">

</div>
</details>

## 5-2. 기능 정의서
<details>
<summary><h3>ℹ️기능 정의서</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/c6d91390-e049-40e1-8d6d-b64b7e8ddd78">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/6b9c7685-f560-4b57-8efa-1a77d841b3a8">

</div>
</details>

## 5-3. ERD
<details>
<summary><h3>ℹ️ERD</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/3c8943c6-dfab-4b3a-878b-e125b41fac3c">

</div>
</details>

## 5-4. 테이블 정의서
<details>
<summary><h3>ℹ️테이블 정의서</h3></summary>
<div markdown="1">
    
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/64111a26-58b8-4c1f-ae10-64c93ced6a7b">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/016fc120-8e07-441c-a206-283b1af22167">
<img src="!(https://github.com/Dozzykim/Team2_mini/assets/126581926/eb6db64d-3492-433f-b40d-9bc64d3d99a4">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/031b14a9-4012-48cf-8593-cde61c712ead">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/c1853100-bd17-4e63-82fb-32ba9d4da433">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/7a24c253-177a-41cb-a0e0-8e4effb40b24">

</div>
</details>

## 5-5. 화면 설계서
<details>
<summary><h3>화면설계서</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/f6d57be6-4805-454d-a222-c8ad0eef6819">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/5e3b746d-d19c-40a3-ba43-6c77099f3daa">

</div>
</details>

<details>
<summary><h3>ℹ️유저</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/6f0230c6-264c-4cd2-9ad9-3887d243a821">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/036b7b22-53c3-4600-8817-52d0abb8eb30">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/26c3bea0-e62a-41f6-b429-548600ad691a">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/254804f5-e684-49f3-9f5b-0b676374b29f">

</div>
</details>

<details>
<summary><h3>ℹ️관리자</h3></summary>
<div markdown="1">
    
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/03e0faed-6fdd-491a-9c07-8c894769f2d9">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/a884d2b1-3fb7-4d1b-8c13-edb0aeb63ed7">

</div>
</details>

<details>
<summary><h3>ℹ️예약</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/e9cb3540-d635-437a-ba33-f883639e76ac">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/d0dd33d9-7845-40c0-84cd-1225ec836b54">

</div>
</details>

<details>
<summary><h3>ℹ️게시판</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/5b5abddd-661d-4347-af2e-d12b99f173d4">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/ed840b2f-2f4a-448c-a3fe-54b76c13328e">

</div>
</details>

## 5-6. 프로젝트 실제 화면 UI
<details>
<summary><h3>ℹ️유저</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/165a85e8-e92f-48d2-9710-ab27344f0548">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/bddea36e-0386-4d8f-bef9-e84651026873">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/a937f9fa-649f-4e59-b7b9-70fcb841e4b5">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/081d8ec6-3e19-46f4-b827-869bf35ec40a">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/307889b0-9853-44cc-868c-0ae65ce97bf1">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/77d55ba6-92d0-438c-bf52-3ff6e1b47f37">

</div>
</details>

<details>
<summary><h3>ℹ️관리자</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/0fad74dd-b2c8-4358-a0b1-6cda83fa2ba1">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/39dc7ad8-cc53-409a-b2ab-2ab04ca353cd">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/288192f7-b4a4-4141-a733-5106376036d8">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/8b912179-143a-42f6-80e5-be40176ac16c">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/2c40a4e8-8a72-46ad-8ec9-14b8fa004877">

</div>
</details>

<details>
<summary><h3>ℹ️예약</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/9a8b4be7-a68c-426b-9605-7a4d1b73a981">

</div>
</details>

<details>
<summary><h3>ℹ️게시판</h3></summary>
<div markdown="1">

<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/e3f6dd1a-f78e-4e55-a8b6-da4e7a066af4">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/62b99111-e1a1-4c1e-8751-7aa0c658f3d4">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/e6189a1d-5c48-440e-b111-01b1e4040e32">
<img src="https://github.com/Dozzykim/Team2_mini/assets/126581926/699437a6-ea99-43bd-a0ce-31e3398c142b">

</div>
</details>

<br><br>

# 6. 자체 평가 의견
- 김도희
    - 프로젝트를 시작하면서 직접 프로젝트의 뼈대를 구성했습니다. 이 과정에서 각 기능들의 전체적인 흐름을 파악하는 데 큰 도움이 되었으며, 이를 통해 중간에 팀원들의 기능 구현에도 적극적으로 협력할 수 있어 뿌듯했습니다.
    개인적으로 게시판과 댓글 기능을 담당했는데, 초반에는 Ajax와 Servlet에 대한 이해가 부족하여 게시판 기능을 완벽하게 구현하지 못한 점이 아쉬웠으나 댓글 기능을 포기하지 않고 최선을 다해 구현해냈다는 것에 대한 성취감을 느꼈습니다.
    이번 프로젝트를 통해 백엔드 개발에 집중하면서 CSS에 대한 부족함을 깨달아, 다음 프로젝트에는 이 부분을 더 보완해야겠다고 생각이 들었습니다.
- 신준수
    - 팀원들과 깃을 활용하여 협업을 하는 게 처음이라 많은 어려움이 있었지만 반복해서 하다 보니 숙달이 되는 게 제 눈에 보이고 기능을 구현할 때 풀리지 않았던 기능들을 풀어갈 때마다 성취감을 느껴 좋았던 것 같습니다. 다음에는 이번에 맡았던 회원가입 로그인 등 말고도 다른 부분을 구현하고 싶고 부족한 부분을 다시 바로잡고 채워 나가는 시간을 더 많이 가져야겠다고 생각했습니다. 아쉬운 점은 깃을 완벽하게 이해하지 못한 것 같아 아쉽고 다음 프로젝트에서는 더 노력해서 이번보다 더 나은 프로젝트를 수행하고 싶습니다.
- 이태원
    - 기획 및 디자인, html, css를 활용한 프론트 개발단계, 기능을 구현하는 개발 단계에서도 팀원들의 의견을 종합하여 기존 기능으로는 로그인 화면에 아이디 찾기, 비밀번호 찾기 등과 같은 추가 기능의 반영을 할 때 부드럽게 진행되어 프로젝트의 결과가 좋게 만들어진 것 같아서 좋았습니다. 개인적으로 아쉬운 부분은 백엔드 부분을 잘 알지 못하는 상황이라 팀원들의 고민을 같이 하지 못하게 되어 아쉬웠습니다.
- 전나연
    - 처음 배운 언어가 익숙하지 않아 수업 시간에 배운 것을 참조하여 기능을 구현하였는데 너무 많은 부분을 참조한 것 같아서 아쉬웠습니다. 웹 페이지가 실행되는 과정을 생각하며 코드를 짜는 것이 쉽지 않았고, 사소한 오류로 인해 절망도 했지만 잘 실행되었을 때 성취감은 이루 말할 수 없었습니다. 또한 프로젝트를 진행하며 협업 프로그램으로 깃을 사용하였는데 이 전에 활발히 사용한 적이 없어서 처음에는 막막하고 어려웠지만 활용하는 법을 배울 수 있어서 좋았습니다. 프로젝트를 진행하면서 소통의 중요성을 알았고 다음에는 백지상태에서도 코드를 구현할 수 있도록 많은 노력을 해야겠다고 생각했습니다.
- 정다운
    - 프로젝트 아이디어가 정해지고 머릿속으로 구상했던 화면들을 설계할 때, 생각했던 것보다 세세한 화면이 많이 있어서 시간이 오래 걸리는 어려움이 있었습니다. 하지만, 시간이 지날수록 원하는 화면을 구현해 내고 완성돼가는 것을 보고 짜릿함을 느꼈으며 집중하고 노력했던 것에 대한 보람을 느꼈습니다. 그리고 UI 구현 시 코드가 잘 반영되지 않을 때마다 팀원들이 제가 발견하지 못한 점을 찾아 해결해 주었을 때 협동심이 느껴졌습니다. 최종 테스트를 할 때 각자 한 활동을 합치고 잘 동작되는 것을 확인하며 다 같이 기뻐했을 때 성취감을 느꼈으며 서로 배려하며 열심히 활동한 팀원들에게 감사한 시간이었습니다.
