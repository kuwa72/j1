# j1

Java oneliner/Javaワンライナー

j1 execute compiled class with arguments embeded main fucntion(ex: $ j1 foo; -> main(){ foo; })

j1は引数を匿名クラスのmain関数に埋め込みコンパイルして実行するシェルスクリプトです。

STDIN inherit from j1 process.
You can write filter command like awk/sed.

標準入力を受け取れるのでAwkやSedのようにフィルタも書けます（たいへんつらい）

In default, temporary class is very simple. It is not import every namespace.

デフォルトテンプレートはネームスペースを全くインポートしていません。

If you want customize, create ~/.j1template file.

カスタマイズしたい場合は ~/.j1template を作成してください。

You must use classname to \_\_CLASSNAME\_\_ and codes of main function to \_\_BODY\_\_.
See TemplateSample.java.

テンプレートのクラス名にあたる部分は \_\_CLASSNAME\_\_ 、main関数本体は \_\_BODY\_\_ と記述してください。TemplateSample.javaを参考のこと。

## Example

### Hello world

```
$ j1 'System.out.println("Hello world.");'
Hello world.
```

### Convert upper case every line

This sample can not run with default template. Copy TemplateSample.java to ~/.j1template

標準テンプレートだと動かないので、TemplateSample.javaを~/.j1templateにコピーしてください。

```
$ echo "foo\nbar\nbaz" | ./j1 'try{BufferedReader br = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));br.lines().forEach(l->{System.out.println(l.toUpperCase());});}catch(Exception e){};'
FOO
BAR
BAZ
```
