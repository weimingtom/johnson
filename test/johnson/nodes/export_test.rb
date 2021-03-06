require "helper"

class ExportTest < Johnson::NodeTestCase
  def test_export
    assert_sexp([[:export, [[:name, "name1"], [:name, "name2"]]]],
      @parser.parse('export name1, name2;'))
    assert_ecma('export name1, name2;', @parser.parse('export name1, name2;'))
  end
end
