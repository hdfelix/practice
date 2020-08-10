class FuzzyClock:
    def __init__(self, time_string):
        self.time_array = time_string.split(':')
        self.hour = int(self.time_array[0])
        self.minute = int(self.time_array[1])


    NUMBER_WORDS = {
        1 : 'one',
        2 : 'two',
        3 : 'three',
        4 : 'four',
        5 : 'five',
        6 : 'six',
        7 : 'seven',
        8 : 'eight',
        9 : 'nine',
        10 : 'ten',
        11 : 'eleven',
        12 : 'twelve',
        20 : 'twenty',
        25 : 'twenty-five',
        35 : 'thirty-five',
        40 : 'forty',
        50 : 'fifty',
        55 : 'fifty-five'
    }

    def parse_time(self):
        rounded_minute = self.__round_to_five(self.minute)
        word_hour = self.NUMBER_WORDS[self.hour]

        if rounded_minute == 0:
            return f"It's {word_hour} o'clock."
        elif rounded_minute == 15:
            return f"It's a quarter past {word_hour}."
        elif rounded_minute == 45:
            return f"It's a quarter to {self.NUMBER_WORDS[self.__next_hour()]}."
        else:
            return self.__general_case(rounded_minute, word_hour)


    def __round_to_five(self, number):
        number = int(number)
        if(number % 5 == 0):
            return number
        else:
            return (5 - (number % 5) + number)


    def __next_hour(self):
        if self.hour == 12:
            return 1
        else:
            return self.hour + 1

    def __remaining_minutes_in_hour(self, rounded_minute):
        return 60 - rounded_minute

    def __general_case(self, rounded_minute, word_hour):
        if rounded_minute in range(1,30):
            return f"It's {self.NUMBER_WORDS[rounded_minute]} minutes past {word_hour}."
        elif rounded_minute in range(31,60):
            return f"It's {self.NUMBER_WORDS[self.__remaining_minutes_in_hour(rounded_minute)]} minutes to {self.NUMBER_WORDS[self.__next_hour()]}."
    