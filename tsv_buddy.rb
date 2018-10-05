# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.chomp.split("\t") }
    headers = rows[0]
    rows.shift
    @data = rows.map do |row|
      row.map.with_index { |cell, index| [headers[index], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data[0].keys.join("\t")
    content = @data.map { |rows| rows.values.join("\t") }.join("\n")
    header + "\n" + content
  end
end
