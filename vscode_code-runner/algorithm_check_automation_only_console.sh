cd $dirWithoutTrailingSlash &&
if [ ! -d 'bin' ];
then mkdir 'bin';
fi &&
g++ $fileName -g -o './bin/$fileNameWithoutExt' &&
> 'result.txt' &&

if [ -e $'./data/input.txt' ];
then echo &&
echo '************************' >> 'result.txt' &&
echo '**   From input.txt   **' >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&
'./bin/$fileNameWithoutExt.exe' < './data/input.txt' > './data/my_output.txt' &&
cat './data/input.txt' >> 'result.txt' ;
else echo &&
echo '************************' &&
echo '**    Enter  Input    **' &&
echo '************************' &&
echo &&
'./bin/$fileNameWithoutExt.exe' > './data/my_output.txt' ;
fi &&

echo >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo '**       Output       **' >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&
cat './data/my_output.txt' >> 'result.txt' ;
if [ -e $'./data/output.txt' ];
then echo >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo '**   Compare Result   **' >> 'result.txt' &&
echo '** < : ans  yours : > **' >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&
diff -w -B './data/output.txt' './data/my_output.txt' >> 'result.txt' &&
echo '        CORRECT         ' >> 'result.txt' ;
fi ;
cd '$workspaceRoot' &&
echo &&
echo 'currnt root is $workspaceRoot' &&
exit