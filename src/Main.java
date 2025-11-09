import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        CharStream input = CharStreams.fromFileName("src/input.txt");

        CMinusLexer lexer = new CMinusLexer(input);

        Token token = null;
        while ((token = lexer.nextToken()).getType() != Token.EOF) {
            String tokenName = CMinusLexer.VOCABULARY.getSymbolicName(token.getType());
            String tokenValue = token.getText();

            System.out.println("Symbol: " + tokenName + " | Value: " + "'" + tokenValue + "'");
        }
    }
}