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
      space.repeat(2, 2).as(:indentation)
    end

    rule(:character) do
      match["[:alnum:]"] | str("|")  | str("?") | str(".") | str("<") | str(">") | str("-") | str("=") | str("+") | str("_") | str("!") | str("@") | str("$") | str("%") | str("^") | str("&") | str("*")
    end

    rule(:word) do
      character.repeat(1)
    end

    rule(:string) do
      str('"') >> (str('\\') >> any | str('"').absent? >> any).repeat.as(:string) >> str('"')
    end

    rule(:definition) do
      (word.as(:name) >> str(":") >> space >> expression.as(:value))
    end

    rule(:argument) do
      space >> expression >> space
    end

    rule(:arguments) do
      ((argument >> str(",")).repeat(1) >> argument) | argument
    end

    rule(:lookup) do
      (word.as(:name) >> str("(") >> arguments.maybe.as(:arguments) >> str(")"))
    end

    rule(:lookups) do
      ((lookup.as(:lookup) >> space).repeat(1) >> lookup.as(:lookup)) | lookup.as(:lookup)
    end

    rule(:expression) do
      (indentation.as(:indentation) | definition.as(:definition) | lookups | string | word.as(:atom)).repeat
    end

    rule(:expressions) do
      (expression.as(:expression) >> newline).repeat
    end

    rule(:document) do
      expressions.as(:expressions) >> eof
    end

    root(:document)
  end
end
