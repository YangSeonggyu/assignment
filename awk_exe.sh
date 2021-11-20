#!/bin/bash

echo "*특정필드만 출력하기*"
echo "전체 출력 (awk '{ print $0 }' awk_data.txt)"
awk '{ print $0 }' awk_data.txt
echo -e "\n첫 번째 필드만 출력 (awk '{ print $1 }' awk_data.txt)"
awk '{ print $1 }' awk_data.txt
echo -e "\n2~3번째 필드만 출력 (awk '{ print $2,$3 }' awk_data.txt)"
awk '{ print $2,$3 }' awk_data.txt

echo -e "\n* 지정된 필드의 값을 더한 값 출력 *"
echo "SCORE 점수 합계 출력 (awk '{sum += $6} END { print "SUM : "sum }' awk_data.txt)"
awk '{sum += $6} END { print "SUM : "sum}' awk_data.txt

echo -e "\n* 특정 Recode를 검색하기 *"
echo "SCORE 90점 이상만 출력하기 (awk '{ if( $6 >= 90 ) print ($0) }' awk_data.txt)"
awk '{ if( $6 >= 90 ) print ($0) }' awk_data.txt
echo "남자면서 SCORE 90점 이상만 출력하기 (awk '{ if($5 =="M" && $6>= 90) print ($0) }' awk_data.txt)"
awk '{ if( $5 == "M" && $6 >= 90 ) print ($0) }' awk_data.txt

echo -e "\n* 반복문 *"
echo "2번 반복해서 출력하기 (awk '{ for(i=0;i<2;i++) print( i "번째 : " $0) }' awk_data.txt)"
awk '{ for(i=0;i<2;i++) print (i "번째 : " $0) }' awk_data.txt
