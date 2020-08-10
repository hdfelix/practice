# Create a fuzzy clock that takes a time and returns a corresponding string that rounds the 
# time to the nearest 5 minutes.
# ex.
# - 01:00 -> "It's One o'clock."
# - 02:15 -> "It's quarter past two."
# - 03:23 -> "It's twenty-five minutes past three."
# - 04:29 -> "It's half past four."
# - 05:36 -> "It's twenty minutes to six."
# - 06:45 -> "It's quarter to seven."
# - 12:00 -> "It's noon."
# - 10:54 -> "It's five minutes past eleven."

# After rounding to nearest 5, for minutes:
# Minutes == 00:
# 1. If hour == 00: "It's midnight." (IGNORED FOR NOW)
# 1b. elseif hour 12: "It's noon." (IGNORED FOR NOW)
# 1c. else (every other hour): "It's [hour] (capitalized)  o'clock."

# 2. at 30 minutes: "It's half past [hour]."

# 3. at 15: "It's a quarter past [hour]."

# 4. at 45: "It's a quarter to [next hour]."

# Every other case:
# If [minutes] 0 - 29:
# 6a. "It's [minutes rounded] minutes past [hour]."
# else
# 6b. "It's [minutes rounded] minutes to [next hour]."

require './lib/fuzzy_clock'

describe FuzzyClock do
  describe 'TIME_WORDS' do
    it 'maps numbers used to tell time to their string word equivalents' do
      expect(FuzzyClock::TIME_WORDS[1]).to eq 'one'
      expect(FuzzyClock::TIME_WORDS[2]).to eq 'two'
      expect(FuzzyClock::TIME_WORDS[3]).to eq 'three'
      expect(FuzzyClock::TIME_WORDS[4]).to eq 'four'
      expect(FuzzyClock::TIME_WORDS[5]).to eq 'five'
      expect(FuzzyClock::TIME_WORDS[6]).to eq 'six'
      expect(FuzzyClock::TIME_WORDS[7]).to eq 'seven'
      expect(FuzzyClock::TIME_WORDS[8]).to eq 'eight'
      expect(FuzzyClock::TIME_WORDS[9]).to eq 'nine'
      expect(FuzzyClock::TIME_WORDS[10]).to eq 'ten'
      expect(FuzzyClock::TIME_WORDS[11]).to eq 'eleven'
      expect(FuzzyClock::TIME_WORDS[12]).to eq 'twelve'

      expect(FuzzyClock::TIME_WORDS[15]).to eq 'fifteen'
      expect(FuzzyClock::TIME_WORDS[20]).to eq 'twenty'
      expect(FuzzyClock::TIME_WORDS[25]).to eq 'twenty-five'

      expect(FuzzyClock::TIME_WORDS[35]).to eq 'thirty-five'
      expect(FuzzyClock::TIME_WORDS[40]).to eq 'forty'

      expect(FuzzyClock::TIME_WORDS[50]).to eq 'fifty'
      expect(FuzzyClock::TIME_WORDS[55]).to eq 'fifty-five'
    end
  end

  describe '#round_to_five' do
    it 'rounds an integer to the nearest 5' do
      expect(FuzzyClock.round_to_five(3)).to eq 5
      expect(FuzzyClock.round_to_five(16)).to eq 20
      expect(FuzzyClock.round_to_five(44)).to eq 45
    end

    it 'returns the number if the number is a multiple of 5' do
      expect(FuzzyClock.round_to_five(5)).to eq 5
      expect(FuzzyClock.round_to_five(40)).to eq 40
    end
  end

  describe '#parse_time' do
    it 'splits the hours and minutes from the time string' do
      expect(FuzzyClock.parse_time('02:25')).to eq [2, 25]
    end
  end

  # Returns the time in fuzzy string format
  describe '#time' do
    context "o'clock format" do
      it "returns the `o'clock` format for minute 00" do
        expect(FuzzyClock.time('04:00')).to eq("It's four o'clock")
        expect(FuzzyClock.time('11:00')).to eq("It's eleven o'clock")
      end
    end

    context 'quarter past [hour] format' do
      it "returns 'quarter past' format for minute 15" do
        expect(FuzzyClock.time('09:15')).to eq("It's quarter past nine")
      end
    end

    context "half past [hour] format" do
      it "returns 'half past' format for minute 30" do
        expect(FuzzyClock.time('06:30')).to eq("It's half past six")
      end 
    end

    context "'quarter to [hour]' format" do
      it "returns 'quarter to' format for minute 45" do
        expect(FuzzyClock.time('11:45')).to eq("It's quarter to eleven")
      end
    end

    context "'x minutes past' format" do
      context 'minute 0 to minute 24' do
        it "returns 'x minutes past' format for minute 17" do
          expect(FuzzyClock.time('12:17')).to eq("It's twenty minutes past twelve")
        end

        it "returns 'x minutes past' format for minute 25" do
          expect(FuzzyClock.time('07:25')).to eq("It's twenty-five minutes past seven")
        end
      end

      context 'minute 31 to minute 54' do
        it "returns 'x minutes before' format for minute 34" do
          expect(FuzzyClock.time('08:34')).to eq("It's twenty-five minutes to nine")
        end

        it "returns 'x minutes before' format for minute 55" do
          expect(FuzzyClock.time('05:55')).to eq("It's five minutes to six")
        end
      end
    end
  end
end