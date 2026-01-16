# CMinus

A compiler front-end for the C-Minus programming language, written in Java using [ANTLR4](https://www.antlr.org/).

C-Minus (C-) is a stripped-down subset of C commonly used in compiler construction courses. It supports integer variables, arrays, functions, `if`/`else` conditionals, and `while` loops — just enough to be interesting without the complexity of a full C compiler.

This project was built as a hands-on way to learn how compilers work from the ground up.

## What it does

Right now the compiler performs **lexical analysis** (tokenization). Given a C-Minus source file, it breaks the input into tokens and prints each one:

```
Symbol: INT | Value: 'int'
Symbol: ID | Value: 'gcd'
Symbol: LPAREN | Value: '('
Symbol: INT | Value: 'int'
Symbol: ID | Value: 'u'
...
```

The ANTLR grammar (`CMinus.g4`) defines the full C-Minus syntax — lexer rules *and* parser rules — so extending this to full parsing and beyond is straightforward.

## The language

C-Minus supports:

- **Types:** `int` and `void`
- **Variables:** scalars and fixed-size arrays (`int arr[10];`)
- **Functions:** with parameters (including array parameters)
- **Control flow:** `if`/`else`, `while`
- **Operators:** `+`, `-`, `*`, `/`, comparisons (`<=`, `<`, `>`, `>=`, `==`, `!=`), assignment (`=`)
- **Comments:** block comments (`/* ... */`)

Example program (included in `src/input.txt`):

```c
int gcd (int u, int v)
{
    if (v == 0)
        return u;
    else
        return gcd(v, u - u/v*v);
}

void main(void)
{
    int x;
    int y;
    x = input();
    y = input();
    output(gcd(x, y));
}
```

## Project structure

```
CMinus.g4        -- ANTLR4 grammar (lexer + parser rules)
src/Main.java    -- Entry point, runs the lexer on input.txt
src/input.txt    -- Sample C-Minus program
```

## Requirements

- Java 8+
- ANTLR4 runtime (included in `.idea/libraries/`)

## How to run

1. **Generate the lexer/parser from the grammar** (if not already generated):
   ```
   antlr4 CMinus.g4
   ```
   Or let IntelliJ's ANTLR plugin handle it.

2. **Compile and run:**
   ```
   javac -cp .:antlr-4.x-complete.jar src/Main.java
   java -cp .:antlr-4.x-complete.jar:src Main
   ```
   Or just run `Main.java` from IntelliJ — the project is already configured for it.

3. **Edit `src/input.txt`** to try different C-Minus programs.

## License

[MIT](LICENSE)
