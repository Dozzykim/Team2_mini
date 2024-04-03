# 프로젝트 초기 세팅

## 필수 사항
1. 깃 클론 받기
2. 이클립스에 깃 프로젝트 세팅하기
    - 이클립스 상단의 Window > Show view > other...
    - Git > Git Repositories 와 Git Staging 둘다 open
    - Add an existing local Git repository -> 깃 클론받은 디렉토리 선택 후 Add
    - 깃 레파지토리스 창에서 방금 추가된 깃 프로젝트 우클릭 > Import Projects.. > Folder에서 뜨는 두개 폴더 모두 선택 > Finish
    - Project Explorer 창에서 추가된 깃 프로젝트 확인
    - 하단 Servers 에서 보이는 모든 서버 delete (서버 경로 꼬임 방지) > 새 서버 생성 버튼 클릭 (No servers are available. Click this link to create a new server)
    - Apache > Tomcat v8.5 선택 후 Next > 왼쪽에 있는 Hospital을 클릭 후 Add > Finish


## 추후 이클립스 실행 시, 체크사항
- work space를 깃 레파지토리가 아닌 깃 레파지토리의 상위 폴더 선택!!!!
    - 이유1 : 안그러면 깃 레파지토리 내부의 hospital 경로를 엶.....
    - 이유2 : 톰캣 서버를 깃 프로젝트에 걸기 위해 (서버 연결완료하면 깃 상위폴더에  Server 폴더 생김... 건들지 마시오..)

