# Xcode

**파일 우측에 나타나는 표식**

↓ : 엑스코드를 재실행 해보자

## ERROR

- 디바이스 빌드 속도 느릴 때

  rm -r ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.1\ \(18A8395\)/

  After this:

  -  I closed the Xcode 12.1
  -  I disconnected the iPhone XR with iOS 14.1
  -  I started the Xcode
  -  I opened the project
  -  I connected the iPhone

  Finally a new device support was make:
  ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.1\ \(18A8395\)\ arm64e/

  Now the problem is solved!!

  *(출처: https://developer.apple.com/forums/thread/123068?answerId=420683022#420683022)*

- **Grados[1625:57924] [GEOAddressObject] [NSLocale currentLocale] failed for NSLocaleCountryCode@**

  https://stackoverflow.com/questions/58075554/ios-13-simulator-reversegeocodelocation-geoaddressobject-nslocale-currentl

  region을 내가 살고 있는 국가로 설정하면 에러 해결