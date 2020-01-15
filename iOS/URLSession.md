# URLSession과 URLSessionDataTask

URLSession : HTTP를 통해 데이터를 주고받기 위한 클래스 URLSessionDataTask : 세선 작업을 하나로 나타내는 클래스

****

**URLSession**

<img src="https://koenig-media.raywenderlich.com/uploads/2017/06/url_session_diagram_1.png">

`URLSessionConfiguration` 을 통해 다음 세가지 유형의 URL 세션을 생성한다

1. .default(기본) : URL 다운로드를 위한 기본 구성 객체를 생성하는 디스크 저장 방식
2. .ephemeral(임시) : 어떤 데이터도 저장하지 않는 방식 (애플리케이션이 세션을 만료시키면 세션과 관련한 데이터가 사라짐)
3. .background(백그라운드) : 업로드와 다운로드를 백그라운드에서 이행하여 앱이 종료되거라 일시정지 되어도 데이터를 전송하는 방식

****

**URLSessonDataTask**

URLSessionTask : 세션 작업 하나를 나타내는 추상 클래스

1. URLSessonDataTask : HTTP의 메서드를 이용해 데이터를 받는다. (GET)
2. URLsessionUploadTask : 웹서버로 데이터 객체 또는 파일을 전송 (POST, PUT)
3. URLSessionDownloadTask : 서버에서 데이터를 다운받아 파일로 저장하며 백그라운드 작업을 지원한다.

DataTask는 서버로부터 어떠한 응답이라도 데이터를 전달받을 때 사용(주로 JSON, XML, HTML 등의 단순 데이터) 하며, Upload / Download는 단순 바이너리 파일의 전달 목적 (주로 용량이 큰 파일)

****

**세션 작업 상태 제어**

- cancel() : 작업 취소
- suspend() : 작업 일시정지
- resume() : 일시정지된 경우 작업 재개

- .State : 작업 상태를 나타냄
- .Priority : 작업 처리 우선순위

