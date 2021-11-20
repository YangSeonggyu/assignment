#!/bin/bash

echo "* -n 옵션을 주지 않고 출력 *"
echo "파일에서 첫 번째 항만 출력 (sed '1p' ./sed_data.txt)"
sed '1p' ./sed_data.txt

echo -e "\n* 특정 범위만큼 파일 내용 출력하기 *"
echo "파일에서 첫 번째 항만 출력 (sed -n '1p' ./sed_data.txt)"
sed -n '1p' ./sed_data.txt
echo -e "\n파일에서 2~4라인 범위만 출력 (sed -n '2,4p' ./sed_data.txt)"
sed -n '2,4p' ./sed_data.txt
echo -e "\n전체 출력 (sed -n '1,$p' ./sed_data.txt)"
sed -n '1,$p' ./sed_data.txt

echo -e "\n* 특정 단어로 시작하는 행들만 출력 *"
echo -e "2로 시작하는 단어만 출력 (sed -n '/^2/p' sed_data.txt)"
sed -n '/^2/p' sed_data.txt

echo -e "\n* 특정 단어가 들어가 있는 행들만 출력 *"
echo "LEE가 들어가 있는 행들만 출력 (sed -n '/LEE/p' sed_data.txt)"
sed -n '/LEE/p' sed_data.txt

echo -e "\n* 단어 치환 *"
echo "NAME을 LASTNAME으로 변경 (sed 's/NAME/LASTNAME/g' sed_data.txt)"
sed 's/NAME/LASTNAME/g' sed_data.txt
