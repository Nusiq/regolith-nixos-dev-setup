This is the source for the example Java Regolith Filter. The project uses Maven to compile the JAR file with the filter. This setup is as minimal as possible. If you want to compile and update the file in the filter run following commands (starting from the root of this repository):

Switch to the `filters-src/java` directory:
```text
cd filter-src/java/
```

Run Maven to compile and package the JAR file:
```text
mvn clean package
```

Copy the compiled JAR file into the filter's target directory (this commands overwrites the old file):
```text
cp target/regolith-example-1.0-SNAPSHOT.jar ../../java_example/main.jar
```