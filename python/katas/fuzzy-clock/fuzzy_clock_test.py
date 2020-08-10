import unittest

from fuzzy_clock import FuzzyClock 

class FuzzyClockTests(unittest.TestCase):
    def test_number_words(self):
        self.assertEqual(FuzzyClock.NUMBER_WORDS[1], 'one')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[2], 'two')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[3], 'three')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[4], 'four')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[5], 'five')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[6], 'six')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[7], 'seven')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[8], 'eight')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[9], 'nine')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[10], 'ten')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[11], 'eleven')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[12], 'twelve')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[20], 'twenty')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[25], 'twenty-five')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[35], 'thirty-five')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[40], 'forty')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[50], 'fifty')
        self.assertEqual(FuzzyClock.NUMBER_WORDS[55], 'fifty-five')

    def test_parse_time(self):
        
        # 'on the hour' case
        self.assertEqual(FuzzyClock('01:00').parse_time(), "It's one o'clock.")       
        self.assertEqual(FuzzyClock('07:00').parse_time(), "It's seven o'clock.")

        # 'quarter past' case
        self.assertEqual(FuzzyClock('02:15').parse_time(), "It's a quarter past two.")
        self.assertEqual(FuzzyClock('04:11').parse_time(), "It's a quarter past four.")

        # # 'quarter to' case
        self.assertEqual(FuzzyClock('11:45').parse_time(), "It's a quarter to twelve.")
        self.assertEqual(FuzzyClock('06:42').parse_time(), "It's a quarter to seven.")

        # # 'x minutes past [hour]' case
        self.assertEqual(FuzzyClock('01:02').parse_time(), "It's five minutes past one.")
        self.assertEqual(FuzzyClock('04:22').parse_time(), "It's twenty-five minutes past four.")

        # # 'x minutes to [hour]' case
        self.assertEqual(FuzzyClock('03:53').parse_time(), "It's five minutes to four.")
        self.assertEqual(FuzzyClock('05:36').parse_time(), "It's twenty minutes to six.")
 
if __name__ == '__main__':
    unittest.main()
