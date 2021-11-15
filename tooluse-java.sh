
#install openjdk
apt install openjdk-11-jdk

#Compile java
javac -d  . blah.java
jar cvf blah.jar blah.class

#Run java
java -jar blah.jar
