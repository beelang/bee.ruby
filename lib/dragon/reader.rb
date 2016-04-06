module Dragon
  class Reader < Parslet::Parser
    COMMENT_PREFIX = "#"
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
      space.repeat(2, 2)
    end

    rule(:character) do
      match["[:alnum:]"] | str("|")  | str("?") | str(".") | str("<") | str(">") | str("-") | str("=") | str("+") | str("_") | str("!") | str("@") | str("$") | str("%") | str("^") | str("&") | str("*")
    end

    rule(:word) do
      character.repeat(1)
    end

    rule(:text) do
      str('"') >> (str('\\') >> any | str('"').absent? >> any).repeat.as(:text) >> str('"')
    end

    rule(:definition) do
      (word.as(:name) >> str(":") >> space >> expression.as(:value))
    end

    rule(:sargument) do
      space >> (lookups | text | word.as(:word)) >> space
    end

    rule(:nargument) do
      space >> definition >> space
    end

    rule(:narguments) do
      ((nargument >> str(",")).repeat(1) >> nargument) | nargument
    end

    rule(:lookup) do
      (word.as(:name) >> str("(") >> (narguments.as(:narguments) | sargument.as(:sargument)).maybe.as(:value) >> str(")")).as(:lookup)
    end

    rule(:lookups) do
      ((lookup >> space).repeat(1) >> lookup) | lookup
    end

    rule(:comment) do
      (str(COMMENT_PREFIX) >> match["^\n"].repeat) | str(COMMENT_PREFIX)
    end

    rule(:expression) do
      ((lookups >> space >> definition.as(:definition)) | lookups | definition.as(:definition) | text | word.as(:atom))
    end

    rule(:line) do
      indentation.repeat.as(:indentation) >> (comment.as(:comment) | expression.as(:expression)).maybe >> newline
    end

    rule(:document) do
      line.repeat(1)
    end

    root(:document)
  end
end
