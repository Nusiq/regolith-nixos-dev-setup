// I'm using a type-annotated variable just to make sure it doesn't try to
// run it as JavaScript.
const bpMessage: string = "Hello from Deno in BP!"
Deno.writeTextFile("BP/deno-hello-bp-txt", bpMessage);

Deno.writeTextFile("RP/deno-hello-rp-txt", "Hello from Deno in RP!")
