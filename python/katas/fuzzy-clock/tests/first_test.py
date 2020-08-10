import unittest
from hello_world import get_greetings

class FirstTestClass(unittest.TestCase):
    def test_upper(self):
        self.assertEqual('Hector'.upper(), 'HECTOR')
        
        
class HelloWorldTests(unittest.TestCase):
    def test_get_hello_word(self):
        self.assertEqual(get_greetings(), 'Hello World!')


if __name__ == '__main__':
    unittest.main()
