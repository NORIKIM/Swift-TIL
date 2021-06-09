# XML

- XML은 eXtensible Markup Language의 약자로 다른 목적의 마크업 언어를 만드는데 사용되는 **다목적 마크업 언어**이다.

- XML은 다른 시스템끼리 다양한 종류의 **데이터를 손쉽게 교환**할 수 있도록 해준다.

- XML은 새로운 태그를 만들어 추가해도 계속해서 동작하므로 **확장성이 좋다.**

- XML은 데이터를 보여주지 않고 데이터를 **전달하고 저장하는 것만을 목적**으로 한다.

- XML은 텍스트 데이터 형식의 언어로 모든 XML 문서는 유니코드 문자로만 이루어진다.

- XML은 **SGML을 기반**으로 만들어졌다.

  (SGML : 컴퓨터에서 쓰이는 문서를 작성함에 있어 어떠한 환경에서도 정보의 손실없이 전송,저장,자동처리가 가능하도록 하는 것)

- XHTML, MathML, SVG, RSS, RDF 등이 **XML을 기반으로** 만들어 졌다.

## XML vs HTML

1. HTML은 데이터의 표현의 목적을 XML은 데이터 교환을 위한 구조정의에 목적을 둔다.

2. HTML이 정해진 태그를 가지고 표현하는 것이라면, XML은 사용자가 태그를 정의해서 사용할 수 있다.

   XML은 미리 정의된 태그가 없다.

   ```html
   // HTML
   <html>
     <head>
       <title>제목입니다</title>
     </head>
     <body> 
       <h1>H1 텍스트입니다.</h1>
       <p>P 텍스트입니다.</p> 
     </body> 
   </html>
   ```

   ```xml
   // XML
   <title>제목입니다</title> 
   <content>내용입니다</content> 
   <sender>발송자</sender>
   ```

3. HTML이 인터넷 웹 환경에서 작동된다면 XML은 환경의 구애를 받지 않는다.
4. HTML이 데이터와 그 표현을 동시에 하고 있다면, XML은 데이터만 가지고 있을 뿐 표현하고 있지 않다.

출처:

https://www.crocus.co.kr/1493

https://abcdqbbq.tistory.com/44

