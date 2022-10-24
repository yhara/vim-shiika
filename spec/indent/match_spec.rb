require 'spec_helper'

describe "Indenting" do
  specify "pattern-matching" do
    assert_correct_indenting 'sk', <<~EOF
      class A
        def foo
          match Some<Int>.new(123)
          when Some(123)
            p a
          end
        end
      end
    EOF

    assert_correct_indenting 'sk', <<~EOF
      users = [{name: "Alice", age: 12}, {name: "Bob", age: 23}]
      users.any? do |user|
        user in {name: /B/, in: 20..}
      end #=> true
    EOF
  end

  specify "does not deindent while typing" do
    assert_correct_indent_in_insert 'sk', <<~EOF, "index = 0", <<~RESULT
      def foo
    EOF
      def foo
        index = 0
    RESULT
  end
end
