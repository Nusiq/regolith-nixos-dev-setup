This is the source for the example Executable Regolith Filter (it uses Go). This setup is as minimal as possible. If you want to compile and update the file in the filter run following commands (starting from the root of this repository):

Switch to the `filters-src/executable` directory:
```text
cd filter-src/executable/
```

Run Go to compile and package the executable file:
```text
go build main.go
```

Copy the compiled executable file into the filter's target directory (this commands overwrites the old file):
```text
cp main ../../executable_example/main
```