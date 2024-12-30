/// <summary>
/// Creates two files with greetings in behavior pack and resource pack.
/// <summary/>
class Program {
    static void Main(string[] args) {
        foreach (var (file, content) in new (string, string)[]{
            ("BP/dotnet-hello-bp.txt", "Hello from .NET in BP!"),
            ("RP/dotnet-hello-rp.txt", "Hello from .NET in RP!"),
        }) {
            Console.WriteLine($"Writing {content} to {file}");
            try {
                File.WriteAllText(file, content);
            } catch (Exception) {
                Console.Error.WriteLine("Failed to write to the file!");
                Environment.Exit(1);
            }
        }
    }
}
