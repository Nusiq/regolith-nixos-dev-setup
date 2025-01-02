package main

import (
	"fmt"
	"os"
)

func main() {
	for _, filteData := range [][]string{
		{"BP/executable-hello-bp.txt", "Hello from executable in BP!"},
		{"RP/executable-hello-rp.txt", "Hello from executable in RP!"},
	} {
		path := filteData[0]
		content := filteData[1]
		fmt.Printf("Writing %q to %v\n", content, path)
		err := os.WriteFile(path, []byte(content), 0644)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Failed to write %q to %v\n", content, path)
			os.Exit(1)
		}
	}
}
