# j1

tiny Java interpreter.

j1 execute compiled class with arguments embeded main fucntion(ex: $ j1 foo; -> main(){ foo; })

JVM environment inherit standard input from j1 process.
You can write filter command like awk/sed.

## Example

### Hello world

```
$ j1 'System.out.println("Hello world.\n");'
Hello world.
```

### Similer cut(1) command

```
echo "foo,bar,bazz" | ./j1 'try{byte b[] = new byte[12];System.in.read(b);String s = new String(b);System.out.println(s.split(",")[2]);}catch(Exception e){}'
```
