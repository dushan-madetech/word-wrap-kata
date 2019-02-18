class WordWrap
  def wrap(string,max_len)
    if string != nil
      if string.length > max_len
        index_of_space = string.rindex(' ')
        if index_of_space != nil && index_of_space < max_len
          return string[0...index_of_space] + '\n' + wrap(string[index_of_space..-1],max_len)
        else
          return string[0...max_len] + '\n' + wrap(string[max_len..-1],max_len)
        end
      else
        return string
      end
    end
    ''
  end
end

describe WordWrap do
  it 'can output an empty string when given nothing as input' do
    expect(subject.wrap(nil,10)).to eq('')
  end

  it 'can output an empty string if an empty string is passed as an input' do
    expect(subject.wrap('',10)).to eq('')
  end

  it 'can output a string shorter than the wrap length' do
    expect(subject.wrap('test',10)).to eq('test')
  end

  it 'can wrap a word onto a new line' do
    expect(subject.wrap('test',2)).to eq('te\nst')
  end

  it 'can wrap a single word multiple more than once' do
    expect(subject.wrap('tested',2)).to eq('te\nst\ned')
  end
  it 'can wrap a sentence before the word boundary' do
    expect(subject.wrap('test test',6)).to eq('test\ntest')
  end
end
