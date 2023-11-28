CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ ! -f student-submission/ListExamples.java ]]
then
echo "False"
exit
fi

cp -r student-submission/ListExamples.java grading-area
cp -r *.java grading-area

if [[ ! -f grading-area/ListExamples.java ]]
then
echo "False in grading area"
exit
fi

javac -cp $CPATH grading-area/*.java
if [ $? -ne 0 ]
then 
echo "The file can not be compiled"
fi

java -cp $CPATH org.junit.runner.JUnitCore grading-area/TestListExamples

echo "True"

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
