describe Music::Constants do


  describe 'MAJOR_SCALE_FORMULA' do
    it '-> [2, 2, 1, 2, 2, 2]' do
      expect(Music::MAJOR_SCALE_FORMULA).to eq [2, 2, 1, 2, 2, 2, 1]
    end
  end

  describe 'MAJOR_SCALE_IN_SEMITONES' do
    it '-> [1, 3, 5, 6, 8, 9, 12]' do
      expect(Music::MAJOR_SCALE_IN_SEMITONES).to eq [1, 3, 5, 6, 8, 10, 12, 13]
    end
  end

  describe 'MINOR_SCALE_FORMULA' do
    it '-> [2, 1, 2, 2, 1, 2, 2]' do
      expect(Music::MINOR_SCALE_FORMULA).to eq [2, 1, 2, 2, 1, 2, 2]
    end
    it 'is the minorified MAJOR_SCALE_FORMULA' do
      expect(Music::MINOR_SCALE_FORMULA).to eq Music::Util::minorify Music::MAJOR_SCALE_FORMULA
    end
  end

  describe 'MINOR_SCALE_IN_SEMITONES' do
    it '-> [1, 3, 4, 6, 8, 9, 11, 13]' do
      expect(Music::MINOR_SCALE_IN_SEMITONES).to eq [1, 3, 4, 6, 8, 9, 11, 13]
    end
  end

  describe 'ALPHABET' do
    it '-> [:A, :B, :C, :D, :E, :F, :G]' do
      expect(Music::ALPHABET).to eq [:A, :B, :C, :D, :E, :F, :G]
    end

    it 'is the majorified ALPHABET' do
      expect(Music::ALPHABET_FROM_C).to eq Music::Util::majorify Music::ALPHABET
    end
  end

  describe 'ALPHABET_FROM_C' do
    it '-> [:C, :D, :E, :F, :G, :A, :B]' do
      expect(Music::ALPHABET_FROM_C).to eq [:C, :D, :E, :F, :G, :A, :B]
    end

    it 'is the majorified ALPHABET' do
      expect(Music::ALPHABET_FROM_C).to eq Music::Util::majorify Music::ALPHABET
    end
  end

  describe 'NATURAL_NOTE_MAPPING' do
    let(:mapping) { Music::NATURAL_NOTE_MAPPING }

    it 'has MINOR_SCALE_IN_SEMITONES as keys, but without the octave' do
      expect(mapping.keys).to eq Music::MINOR_SCALE_IN_SEMITONES.dup.tap(&:pop)
    end

    it 'has symbols :A-:G as values' do
      expect(mapping.values).to eq Music::ALPHABET
    end
    it('1  -> A') { expect(mapping[1]).to eq :A }
    it('3  -> B') { expect(mapping[3]).to eq :B }
    it('4  -> C') { expect(mapping[4]).to eq :C }
    it('6  -> D') { expect(mapping[6]).to eq :D }
    it('8  -> E') { expect(mapping[8]).to eq :E }
    it('9  -> F') { expect(mapping[9]).to eq :F }
    it('10 -> nil') { expect(mapping[10]).to be_nil }
    it('11 -> G') { expect(mapping[11]).to eq :G }
    it('12 -> nil') { expect(mapping[12]).to eq nil }
  end


end

