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
SED는 **Stream Editor**의 약자로 vi편집기처럼 편집에 특화된 명령어입니다.
vi편집기는 편집기를 열어서 서로 소통하듯 수정/변경을 해나가는 대화형 방식이라면 sed는 명령행에서
파일을 인자로 받아 명령어를 통해 작업한 후 결과를 화면으로 확인하는 방식입니다.
sed명령어를 이용해 편집 결과를 저장하기 전까지는 파일에 아무런 변경도 가하지 않습니다.
모든 결과는 내가 명령을 수행후 화면으로 출력되는데 출력 결과가 원본과 다르더라고 원본에 손해가 없다는 특징이 있습니다.
※ 단, sed옵션에서 -i 옵션을 지정한다면 원본을 바꾸게 됩니다. ※
### 패턴 스페이스(Pattern space)와 홀드 스페이스(Hold space)
sed명령어는 동작시 내부적으로 두개의 워크 스페이스를 사용하는데, 이 두 버퍼를 패턴 스페이스(=패턴 버퍼), 홀드 스페이스(=홀드 버퍼)라고 합니다.

<img src="https://user-images.githubusercontent.com/94627358/142590215-c26eb545-b49c-4678-8549-0b2cf8d90faa.PNG" width="600" height="350">

**패턴 버퍼**는 sed가 파일을 라인단위로 읽을 때 그 읽힌 라인이 저장되는 임시 공간입니다.

**홀드 스페이스**는 패턴 버퍼처럼 짧은 순간 임시 버퍼가 아니라 좀 더 길게 가지고 있는 저장소입니다. 즉, 어떤 내용을 홀드 스페이스 저장하면, sed가 다음 행을 읽더라도 나중에 내가 원할 때 불러와서 재사용할 수 있는 버퍼입니다.
### 옵션
|옵션|내용|
|:---:|:---:|
|e|sed를 사용하였을 때 출력되는 값을 보여줍니다. 이 옵션은 기본값으로 굳 안 써도 되지만 다중 명령어를 쓸 때는 반드시 써야 합니다.|
|n|특정 값이 들어간 줄만 출력해주는 기능입니다. 주로 p 명령어와 사용됩니다.|
|f|스크립트를 파일로부터 읽어들이며 명령어를 지정하는 명령어입니다.|
|i|변경되는 값을 실제로 파일에 저장하는 옵션입니다.|
### 명령어
|명령어|내용|
|:---:|:---:|
|d|줄 삭제 명령어|
|a＼|해당 값이 있는 줄 다음에 입력|
|i＼|줄 앞에 첨가 명령어|
|c＼|해당 줄을 변경하는 명령어|
|g|한 줄에 해당하는 값이 여러개 있을 경우에 모두 변경하는 명령어|
|p|조건에 부합하는 라인을 출력하는 명령어|
|s/orgin/change/|앞에 것을 뒤에 것으로 변경하는 명령어|
### 예제
![0](https://user-images.githubusercontent.com/94627358/142593879-1ba81ecc-06d0-46e2-9d56-c103a425f2f1.PNG)
이 파일을 가지고 실습 해보겠습니다.

---
**파일에서 첫 번째 항만 출력**
![1](https://user-images.githubusercontent.com/94627358/142594057-585a90e4-2621-454a-9eae-8ec29c2a2872.PNG)
```sed '1p' sed_data.txt```

---
파일에서 첫 번째 항만 출력
![2](https://user-images.githubusercontent.com/94627358/142594415-216fa9a1-6fe3-42f7-8de9-8a3ce5542526.PNG)
```sed -n '1p' sed_data.txt```

---
파일에서 2~4라인 범위만 출력
![3](https://user-images.githubusercontent.com/94627358/142594531-860f360b-bac7-4b9f-9302-12d462bb2ceb.PNG)
 ```sed -n '2,4p' ./sed_data.txt```

---
![4](https://user-images.githubusercontent.com/94627358/142594537-97bea3ce-e359-4e56-9950-0975b27646f0.PNG)
전체 출력 ```sed -n '1,' ./sed_data.txt```

---
![5](https://user-images.githubusercontent.com/94627358/142594550-cc881bbf-2e25-4c37-9e4f-35eed91bf52e.PNG)
2로 시작하는 단어만 출력 ```sed -n '/^2/p' sed_data.txt```

---
![6](https://user-images.githubusercontent.com/94627358/142594553-4d35ef0e-4f0e-4bbc-864f-56aa1dd51968.PNG)
LEE가 들어가 있는 행들만 출력 ```sed -n '/LEE/p' sed_data.txt```

---
![7](https://user-images.githubusercontent.com/94627358/142594555-ae7b22dd-bc01-4896-a548-187fa11723fd.PNG)
NAME을 LASTNAME으로 변경 ```sed 's/NAME/LASTNAME/g' sed_data.txt```

---
## awk
awk는 **Aho(Alfred Aho)+Weinberger(Peter Weinbeger)+Kernighan(Brian Kernighan)** 으로 awk기능을 디자인한 사람들의 이니셜을 조합하여 만든 이름으로, 유닉스에서 처음 개발된 일반 스크립트 언어이다. awk의 기본 기능은 텍스트 형태로 되어있는 입력 데이터를 행과 단어 별로 처리해 출력하는 것이다.

간단한 연산자를 명령라인에서 사용할 수 있으며, 큰 프로그램을 위해 사용 될 수 있습니다. awk는 데이터 조작할 수 있기 때문에 쉘 스크립트에서 사용되는 필수 툴이며, 작은 데이터베이스를 관리하기 위해서도 필수입니다.
#### awk프로그래밍 형식
- 명령어를 입력한 다음, 작은따옴표로 둘러싸인 패턴이나 액션을 입력하고 마지막엔 입력 파일 이름.파일 이름을 지정하지 않으면 키보드 입력에 의한 표준 입력을 받음. 그리고 awk는 입력된 라인들의 데이터들을 공백 또는 탭을 기준으로 분리해 $1부터 시작하는 각각의 필드 변수로 분리해 인식
- awk형식
```
awk 'pattern' filename
awk '{actio}' filename
awk 'pattern {action}' filename
```
#### awk패턴
|패턴|내용|
|:---:|:---:|
|BEGIN|입력파일을 읽어들이기 전에 옆에 제시되는 문자를 실행시키도록 한다|
|END|awk가 모든 입력을 처리한 후, 옆에 제시되는 문장을 실행시키도록 한다|
|expression|식을 평가한 후 이 식이 참, 즉 non-zero이거나 non-null인 경우 문장을 실행한다|
|/re/|정규식과 일치하는 문자열을 포함하고 있는 라인에서 문장을 실행한다|
|compound-pattern|복합패턴이라는 것으로 "and,or,not"그리고 괄호에 의해 연결시킨 것이다. expression의 경우와 마찬가지로 복합 패턴도 참인 경우의 문장을 실행시킨다|
|pattern1,pattern2|이러한 패턴을 범위 패턴이라고 한다. 현재 처리되고 있는 라인이 pattern1과 일치되고, 다음에 따라오는 라인중 임의의 라인이 pattern2와 일치할 때, 범위 패턴은 두 라인사이의 각 라인과 일치한다|
#### 예제
![0](https://user-images.githubusercontent.com/94627358/142600623-5d2b4135-67af-4bc6-80ff-5fd73435897c.PNG)
이 파일을 가지고 실습 해보겠습니다.

---
![1](https://user-images.githubusercontent.com/94627358/142600659-d48b1e9f-dfe8-4945-aa9f-beeec5d681c0.PNG)
전체 출력 ```awk '{ print $0 }' awk_data.txt```

---
![2](https://user-images.githubusercontent.com/94627358/142600663-a5036736-9d8c-4d34-a0c3-95d3c49b372b.PNG)
첫 번째 필드만 출력 ```awk '{ print $1 }' awk_data.txt```

---
![3](https://user-images.githubusercontent.com/94627358/142600664-f4f01239-3319-409f-8e47-0836f32a9a5f.PNG)
2~3번째 필드만 출력 ```awk '{ print $2,$3 }' awk_data.txt```

---
![4](https://user-images.githubusercontent.com/94627358/142600666-f78b5515-fa0e-44a9-9cbf-383ea1895584.PNG)
SCORE 점수 합계 출력 ```awk '{sum += $6} END { print "SUM : "sum }' awk_data.txt```

---
![5](https://user-images.githubusercontent.com/94627358/142600669-df8e54a7-128d-4c7c-8449-4d02ed60e3fe.PNG)
SCORE 90점 이상만 출력하기 ```awk '{ if( $6 >= 90 ) print ($0) }' awk_data.txt```

---
![6](https://user-images.githubusercontent.com/94627358/142600671-07d782c0-35e3-4fcc-a025-fa5a3c29fa78.PNG)
남자면서 SCORE 90점 이상만 출력하기 ```awk '{ if($5 =="M" && $6>= 90) print ($0) }' awk_data.txt```

---
![7](https://user-images.githubusercontent.com/94627358/142600673-1e57ab65-9532-4e9d-84bd-4971316ce4c8.PNG)
2번 반복해서 출력하기 ```awk '{ for(i=0;i<2;i++) print( i "번째 : " $0) }' awk_data.txt```


---

