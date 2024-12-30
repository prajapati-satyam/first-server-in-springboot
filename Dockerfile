# Use the official OpenJDK image as a base
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Package the application
RUN ./mvnw clean package -DskipTests

# Specify the command to run the application
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]

# Expose the port the app runs on
EXPOSE 8080