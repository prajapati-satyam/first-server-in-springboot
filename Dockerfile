# Use Maven to build the Spring Boot app (without OpenJDK 17 preinstalled)
FROM maven:3.8.6 AS build

# Install OpenJDK 17 manually
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Set the working directory
WORKDIR /app

# Copy the pom.xml and the source code into the container
COPY pom.xml /app/
COPY src /app/src/

# Build the application
RUN mvn clean package -DskipTests

# Debug: List contents of the target directory to verify the .jar file location
RUN ls -al /app/target

# Use OpenJDK 17 runtime image for the final container
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Copy the generated .jar file from the build stage (ensure the path is correct)
COPY --from=build /app/target/demo.jar /app/demo.jar

# Expose the port for the Spring Boot app (default 8080)
EXPOSE 8080

# Command to run the Spring Boot app
CMD ["java", "-jar", "demo.jar"]
