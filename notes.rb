class Note

  def initialize
    @entries = []
  end

  def add(title, body)
    new_note = {:title => title, :body => body}
    @entries << new_note
  end

  def list
    titles = []
    @entries.each do |note|
      titles << note[:title]
    end
    titles.join("\n")
  end

  def show(index)
    chosen_note = @entries[index.to_i]
    chosen_title = chosen_note[:title]
    chosen_body = chosen_note[:body]
    "#{chosen_title}\n#{chosen_body}"
  end

end
