package me.nusiq;

import java.io.FileWriter;
import java.io.IOException;

/**
 * Creates two files with greetings in behavior pack and resource pack.
 */
public class App {
    public static void main( String[] args ) {
        for (String[] fileAndContent: new String[][]{
            {"BP/java-hello-bp.txt", "Hello from Java in BP!"},
            {"RP/java-hello-rp.txt", "Hello from Java in RP!"},
        }) {
            String file = fileAndContent[0];
            String content = fileAndContent[1];

            System.out.printf("Writing \"%s\" to %s\n", content, file);
            try {
                FileWriter bpWriter = new FileWriter(file);
                bpWriter.write(content);
                bpWriter.close();
            } catch (IOException e) {
                System.err.println("Failed to write to the file!");
                System.exit(1);
            }
        }

    }
}
