require 'command_builder'

describe CommandBuilder do
  describe 'command_from_url' do
    def build(url)
      CommandBuilder.build([url])[0]
    end

    it 'raises an error if no url provided' do
      expect { build(nil) }.to raise_error(RuntimeError)
      expect { build('') }.to raise_error(RuntimeError)
    end

    it 'command starts with the correct command' do
      expect(build('http://google.com')).to start_with('curl -s -o ')
    end

    it 'ends with the url' do
      expect(build('http://google.com')).to end_with(' -O http://google.com')
    end

    it 'builds the correct output filename when url is not a file' do
      expect(build('https://www.tddapps.com/shoes/')).to eq('curl -s -o shoes-$(date +%Y-%m-%d-%H-%M-%S).html -O https://www.tddapps.com/shoes/')
    end

    it 'builds the correct output filename when url is a file' do
      expect(build('https://s.tddapps.com/200.html')).to eq('curl -s -o 200_html-$(date +%Y-%m-%d-%H-%M-%S).html -O https://s.tddapps.com/200.html')
    end

    it 'builds the correct output filename when url is a file in a directory' do
      expect(build('https://www.flalottery.com/exptkt/p2.htm')).to eq('curl -s -o exptkt_p2_htm-$(date +%Y-%m-%d-%H-%M-%S).html -O https://www.flalottery.com/exptkt/p2.htm')
    end
  end
end