clear &&
cd $dirWithoutTrailingSlash &&
if [ ! -d 'bin' ];
then mkdir 'bin';
fi &&
g++ $fileName -g -o './bin/$fileNameWithoutExt' &&

if [ -e $'./data/input.txt' ];
then 
echo '************************' > 'result.txt' &&
echo '**     Input From     **' >> 'result.txt' &&
echo '**  ./data/input.txt  **' >> 'result.txt' &&
'./bin/$fileNameWithoutExt.exe' < './data/input.txt' > './data/my_output.txt' ;

else 
echo '************************' > 'result.txt' &&
echo '** Can not Find Input **' &&
echo '**   Pleas Put Your   **' &&
echo '**    Custom Input    **' >> 'result.txt' &&
echo '**  Ctrl + D is exit  **' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&

cat > './data/my_input.txt' &&

'./bin/$fileNameWithoutExt.exe' < './data/my_input.txt' > './data/my_output.txt' &&
cat './data/my_input.txt' >> 'result.txt' &&
echo >> 'result.txt';

fi ;

echo '************************' >> 'result.txt' &&
echo '**       Output       **' >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&

cat './data/my_output.txt' >> 'result.txt' ;

if [ -e $'./data/output.txt' ];
then 
echo >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo '**   Compare Result   **' >> 'result.txt' &&
echo '** < : ans  yours : > **' >> 'result.txt' &&
echo '************************' >> 'result.txt' &&
echo >> 'result.txt' &&

diff -w -B './data/output.txt' './data/my_output.txt' >> 'result.txt' &&
echo '        CORRECT         ' >> 'result.txt' &&
echo >> 'result.txt' ;
fi ;
cd '$workspaceRoot' &&
exit