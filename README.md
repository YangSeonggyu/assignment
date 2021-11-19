# 오픈소스SW개론 과제
20195122_양성규
## 목차
1. [getopt](#getopt)
2. [getopts](#getopts)
3. [sed](#sed)
4. [awk](#awk)
## getopt
getopt는 Unix/POSIX 스타일의 명령줄 옵션을 구문 분석하는데 사용되는 C 라이브러리 함수입니다.

POSIX 사양의 일부이며 Unix계열 시스템에 보편적입니다.

쉘 스크립트에서 명령줄 인수를 구문 분석하기 위한 Unix프로그램의 이름이기도 합니다.
## getopts

## sed
SED는 Stream Editor의 약자로 vi편집기처럼 편집에 특화된 명령어입니다.
vi편집기는 편집기를 열어서 서로 소통하듯 수정/변경을 해나가는 대화형 방식이라면 sed는 명령행에서
파일을 인자로 받아 명령어를 통해 작업한 후 결과를 화면으로 확인하는 방식입니다.
sed명령어를 이용해 편집 결과를 저장하기 전까지는 파일에 아무런 변경도 가하지 않습니다.
모든 결과는 내가 명령을 수행후 화면으로 출력되는데 출력 결과가 원본과 다르더라고 원본에 손해가 없다는 특징이 있습니다.
※ 단, sed옵션에서 -i 옵션을 지정한다면 원본을 바꾸게 됩니다. ※
#### 패턴 스페이스(Pattern space)와 홀드 스페이스(Hold space)
sed명령어는 동작시 내부적으로 두개의 워크 스페이스를 사용하는데, 이 두 버퍼를 패턴 스페이스(=패턴 버퍼), 홀드 스페이스(=홀드 버퍼)라고 합니다.

<img src="https://user-images.githubusercontent.com/94627358/142590215-c26eb545-b49c-4678-8549-0b2cf8d90faa.PNG" width="600" height="350">

**패턴 버퍼**는 sed가 파일을 라인단위로 읽을 때 그 읽힌 라인이 저장되는 임시 공간입니다.

**홀드 스페이스**는 패턴 버퍼처럼 짧은 순간 임시 버퍼가 아니라 좀 더 길게 가지고 있는 저장소입니다. 즉, 어떤 내용을 홀드 스페이스 저장하면, sed가 다음 행을 읽더라도 나중에 내가 원할 때 불러와서 재사용할 수 있는 버퍼입니다.
#### 옵션
|옵션|내용|
|:---:|:---:|
|e|sed를 사용하였을 때 출력되는 값을 보여줍니다. 이 옵션은 기본값으로 굳 안 써도 되지만 다중 명령어를 쓸 때는 반드시 써야 합니다.|
|n|특정 값이 들어간 줄만 출력해주는 기능입니다. 주로 p 명령어와 사용됩니다.|
|f|스크립트를 파일로부터 읽어들이며 명령어를 지정하는 명령어입니다.|
|i|변경되는 값을 실제로 파일에 저장하는 옵션입니다.|
#### 명령어
|명령어|내용|
|:---:|:---:|
|d|줄 삭제 명령어|
|a＼|해당 값이 있는 줄 다음에 입력|
|i＼|줄 앞에 첨가 명령어|
|c＼|해당 줄을 변경하는 명령어|
|g|한 줄에 해당하는 값이 여러개 있을 경우에 모두 변경하는 명령어|
|p|조건에 부합하는 라인을 출력하는 명령어|
|s/orgin/change/|앞에 것을 뒤에 것으로 변경하는 명령어|
#### 예제
![0](https://user-images.githubusercontent.com/94627358/142593879-1ba81ecc-06d0-46e2-9d56-c103a425f2f1.PNG)
이 파일을 가지고 실습 해보겠습니다.
---
![1](https://user-images.githubusercontent.com/94627358/142594057-585a90e4-2621-454a-9eae-8ec29c2a2872.PNG)
```sed '1p' sed_data.txt```
## awk

