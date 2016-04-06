module Dragon
  class Transformer < Parslet::Transform

    # Turn words into symbols
    rule(word: simple(:word)) do
      word.to_sym
    end

    # Turn text into a Ruby String
    rule(text: simple(:text)) do
      text.to_s
    end

    # Turn no arguments into an empty list of arguments
    rule(lookup: { name: simple(:name), value: subtree(:value) }) do
      { lookup: { name: name.to_sym, arguments: value } }
    end

    # Turn no arguments into an empty list of arguments
    rule(definition: { name: simple(:name), value: subtree(:value) }) do
      { definition: { name: name.to_sym, arguments: value } }
    end

    # Turn no arguments into an empty list of arguments
    rule(lookup: { name: simple(:name), value: nil }) do
      { lookup: { name: name.to_sym, arguments: [] } }
    end

    # Count the level of indentation based on two spaces
    rule(indentation: simple(:level), expression: subtree(:expression)) do
      { indentation: level.to_s.bytes.size / 2, expression: expression }
    end

    # Handle no indentation lines
    rule(indentation: sequence(:level), expression: subtree(:expression)) do
      { indentation: 0, expression: expression }
    end

    # Handle empty lines
    rule(indentation: sequence(:level)) do
      { indentation: 0 }
    end

    # rule(narguments: { name: simple(:word), value: subtree(:expression) }) do
    #
    # end
  end
end
