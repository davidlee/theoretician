describe Music::Util do
  let(:util) { described_class }
  describe 'class methods' do

    describe '.minorify' do
      context 'given the major scale formula' do
        let(:major_scale_formula) { [2, 2, 1, 2, 2, 2, 1] }
        let(:minor_scale_formula) { [2, 1, 2, 2, 1, 2, 2] }
        let(:minorify) { util::minorify major_scale_formula }
        it 'returns the minor scale formula' do
          expect(minorify).to eq minor_scale_formula
        end
      end
    end

    describe '.majorify' do
      context 'given the minor scale formula' do
        let(:minor_scale_formula) { [2, 1, 2, 2, 1, 2, 2] }
        let(:major_scale_formula) { [2, 2, 1, 2, 2, 2, 1] }
        let(:majorify) { util::majorify minor_scale_formula }
        it 'returns the major scale formula' do
          expect(majorify).to eq major_scale_formula
        end
      end
    end

    describe '.mod12' do
      it('1 -> 1')   { expect(util::modulo_semitone  1).to eq 1 }
      it('2 -> 2')   { expect(util::modulo_semitone  2).to eq 2 }
      it('11 -> 11') { expect(util::modulo_semitone 11).to eq 11 }
      it('12 -> 12') { expect(util::modulo_semitone 12).to eq 12 }
      it('13 -> 1')  { expect(util::modulo_semitone 13).to eq 1 }
      it('14 -> 2')  { expect(util::modulo_semitone 14).to eq 2 }
      it('-1 -> 11') { expect(util::modulo_semitone -1).to eq 11 }
      it('0 -> 12')  { expect(util::modulo_semitone  0).to eq 12 }
    end

    describe '.build_numeric_scale_from_intervals' do
      let(:build) { util::build_numeric_scale_from_intervals intervals }
      let(:intervals) { [2, 2, 1] }
      it 'returns a list of semitone values, starting at 1' do
        expect(build).to eq [1,3,5,6]
      end
    end

  end
end
