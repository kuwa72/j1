# j1

Java oneliner

j1 execute compiled class with arguments embeded main fucntion(ex: $ j1 foo; -> main(){ foo; })

STDIN inherit from j1 process.
You can write filter command like awk/sed.

In default, temporary class is very simple. It is not import every namespace.

If you want customize, create ~/.j1template file.

You must use classname to \_\_CLASSNAME\_\_ and codes of main function to \_\_CONTENTS\_\_.
See TemplateSample.java.

## Example

### Hello world

```
$ j1 'System.out.println("Hello world.");'
Hello world.
```

### Convert upper case every line

This sample can not run with default template. \
Copy TemplateSample.java to ~/.j1template

```
$ echo "foo\nbar\nbaz" | ./j1 'try{BufferedReader br = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));br.lines().forEach(l->{System.out.println(l.toUpperCase());});}catch(Exception e){};'
FOO
BAR
BAZ
```
