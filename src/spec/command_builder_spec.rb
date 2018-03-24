require 'command_builder'

describe CommandBuilder do
  describe 'build' do
    def build(url)
      CommandBuilder.build([url], 'output_dir')[0]
    end

    it 'raises an error if no url provided' do
      expect { build(nil) }.to raise_error(RuntimeError)
      expect { build('') }.to raise_error(RuntimeError)
    end

    it 'builds the correct output filename when url is not a file' do
      result = build('https://www.tddapps.com/shoes/')
      expect(result).to eq('curl -s -o output_dir/shoes-$(date +%Y-%m-%d-%H-%M-%S).html -O https://www.tddapps.com/shoes/')
    end

    it 'builds the correct output filename when url is a file' do
      result = build('https://s.tddapps.com/200.html')
      expect(result).to eq('curl -s -o output_dir/200_html-$(date +%Y-%m-%d-%H-%M-%S).html -O https://s.tddapps.com/200.html')
    end

    it 'builds the correct output filename when url is a file in a directory' do
      result = build('https://www.flalottery.com/exptkt/p2.htm')
      expect(result).to eq('curl -s -o output_dir/exptkt_p2_htm-$(date +%Y-%m-%d-%H-%M-%S).html -O https://www.flalottery.com/exptkt/p2.htm')
    end
  end

  describe 'from_file' do
    it 'builds the correct commands' do
      absolute_path = File.expand_path File.join(File.dirname(__FILE__), '../resources/sample_input.txt')
      result = CommandBuilder.from_file(absolute_path, 'output_dir')

      expect(result.count).to be(3)
    end
  end
end