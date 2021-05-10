export PATH="$PATH:/apache-maven-3.6.3/bin"
cd efww
mvn clean
mvn package
cd ..
cp efww/target/efww.jar /app.jar
touch /app.jar
JAVA_OPTS=""
java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
