import unittest
from .app import add_numbers


class TestApp(unittest.TestCase):
    def test_add_numbers_positive(self):
        self.assertEqual(add_numbers(2, 3), 5)

    def test_add_numbers_negative(self):
        self.assertEqual(add_numbers(-1, -1), -2)

    def test_add_numbers_mixed(self):
        self.assertEqual(add_numbers(-5, 10), 5)

    def test_add_numbers_zero(self):
        self.assertEqual(add_numbers(0, 0), 0)

if __name__ == "__main__":
    unittest.main()