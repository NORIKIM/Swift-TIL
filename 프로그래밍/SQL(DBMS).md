# 데이터베이스 관리 시스템(DBMS) 오픈 소스

데이터를 관리해주는 시스템에는 유료와 무료가 있다.

**SQL** 은 IBM에서 1970년대 초에 처음 개발되었다. 초기에는 준관계형 데이터베이스 관리 시스템 'R'에 저장된 데이터를 조작하고 수신하기 위해 고안되었다. 각 나라별로 SQL에 대한 표준을 가지고 있는데 미국표준협회(ANSI)로 작성된 SQL은 모든 데이터베이스에서 호환된다.

그러나 보통 ANSI를 사용하지 않는다. 그 이유는 대부분 데이터를 그대로 보지 않고 가공해서 사용하는데 이러한 경우 내장된 함수 또는 별도로 개발한 함수를 이용하게 되기 때문이다. 즉, 표준 언어를 정해놓고 각 DBMS들이 그 언어를 기반으로 추가함수를 제공하고 있어 편의에 따라 선택하여 사용하게 된다. 

DBMS의 종류로는 MariaDB, MongoDB, MYSql, 오라클 등이 있다.

## RDBMS

관계형 데이터베이스를 생성,갱신,관리하기 위한 시스템

레코드(Row) 단위로 데이터 쓰기,읽기가 이루어진다

일반적으로 클라이언트가 요청을 보내면 서버가 처리해주는 구조로 클라이언트가 요청을 보낼 때 주로 SQL이 사용된다.