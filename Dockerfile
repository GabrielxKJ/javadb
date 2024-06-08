FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY pom.xml .

COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline

COPY src ./src

RUN chmod +x mvnw

RUN ./mvnw package -DskipTests

CMD ["java", "-jar", "target/aulabd2-0.0.1-SNAPSHOT.war"]
