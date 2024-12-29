# Use Maven 3.8.6 with OpenJDK 11 to build the app
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and the source code into the container
COPY pom.xml /app/
COPY src /app/src/

# Build the application
RUN mvn clean package -DskipTests

# Use OpenJDK 17 runtime image for the final container
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Copy the generated .jar file from the build stage
COPY --from=build /app/target/demo.jar /app/demo.jar

# Expose the port for the Spring Boot app (default 8080)
EXPOSE 8080

# Command to run the Spring Boot app
CMD ["java", "-jar", "demo.jar"]
