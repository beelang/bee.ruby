module Dragon
  class Reader < Parslet::Parser
    rule(:eof) do
      any.absent?
    end

    rule(:newline) do
      str("\n") | str("\r")
    end

    rule(:space) do
      str(" ")
    end

    rule(:indentation) do
      space.repeat(2,2)
    end

    rule(:character) do
      match["[:alnum:]"] | str("|")  | str("?") | str(".") | str("<") | str(">") | str("-") | str("=") | str("+") | str("_") | str("!") | str("@") | str("$") | str("%") | str("^") | str("&") | str("*")
    end

    rule(:word) do
      character.repeat(1).as(:word)
    end

    rule(:string) do
      str('"') >> (str('\\') >> any | str('"').absent? >> any).repeat.as(:string) >> str('"')
    end

    rule(:definition) do
      (word >> str(":") >> space >> expression).as(:definition)
    end

    rule(:arguments) do
      space >> (((word >> space >> str(",")).repeat(1) >> space >> word) | word).as(:arguments) >> space
    end

    rule(:lookup) do
      (word >> str("(") >> arguments.maybe >> str(")")).as(:lookup)
    end

    rule(:expression) do
      definition | lookup | word | string
    end

    rule(:expressions) do
      (expression.as(:expression) >> newline)
    end

    rule(:document) do
      expressions.repeat(1).as(:line) >> eof
    end

    root(:document)
  end
end
