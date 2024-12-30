# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Make the Maven Wrapper executable
RUN chmod +x mvnw

# Package the application
RUN ./mvnw clean package -DskipTests

# Specify the command to run the application
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]