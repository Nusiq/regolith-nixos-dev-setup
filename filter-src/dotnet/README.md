This is the source for the example .NET Regolith Filter. This setup is as minimal as possible. If you want to compile and update the file in the filter run following commands (starting from the root of this repository):

Switch to the `filters-src/dotnet` directory:
```text
cd filter-src/dotnet/
```

Run `dotnet` to compile and the file:
```text
dotnet clean --configuration Release && dotnet build --configuration Release
```
The dotnet.csproj is configured in such a way that it exports the files into the `dotnet/bin/` folder.