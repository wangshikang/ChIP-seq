find . -name "*sam" |cut -c 1-14 |sort  > 1

cat 1 |while read id
do
arr=(${id})
sam=${arr[0]}
echo $sam
