require 'pry'

module FuzzyClock
  TIME_WORDS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    15 => 'fifteen',
    20 => 'twenty',
    25 => 'twenty-five',
    35 => 'thirty-five',
    40 => 'forty',
    50 => 'fifty',
    55 => 'fifty-five'
  }

  def self.round_to_five(number)
    if number % 5 == 0
      return number
    else
      5 - (number % 5) + number
    end
  end

  def self.parse_time(time)
    time.split(':').map(&:to_i)
  end

  def self.time(time)
    hour = self.parse_time(time).first
    minute = self.parse_time(time).last

    case minute
    when 0
      "It's #{self.hour_in_words(hour)} o'clock"

    when 15
      "It's quarter past #{self.hour_in_words(hour)}"

    when 30
      "It's half past #{self.hour_in_words(hour)}"

    when 45
      "It's quarter to #{self.hour_in_words(hour)}"

    else
      if minute < 29
        "It's #{TIME_WORDS[self.round_to_five(minute)]} minutes past #{self.hour_in_words(hour)}"
      else
        "It's #{TIME_WORDS[self.minutes_remaining_in_hour(minute)]} minutes to #{TIME_WORDS[self.next_hour(hour)]}"
      end
    end
  end

  private

  def self.next_hour(hour)
    if hour == 12
      return 1
    else
      return hour + 1
    end
  end

  def self.hour_in_words(hour)
    TIME_WORDS[hour]
  end

  def self.minutes_remaining_in_hour(minute)
    60 - self.round_to_five(minute)
  end
end
