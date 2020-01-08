from selenium import webdriver
import unittest

class NewVisitorTest(unittest.TestCase):

	def setUp(self):
		options = webdriver.ChromeOptions()
		options.add_experimental_option('excludeSwitches', ['enable-logging'])
		self. browser = webdriver.Chrome(options=options)
		self.browser.implicitly_wait(3)

	def tearDown(self):
		self.browser.quit()

	def test_can_start_a_list_and_retieve_it_later(self):
		self.browser.get('http://localhost:8000')
		self.assertIn('To-Do',self.browser.title)
		self.fail('finish the test!')

if __name__ == '__main__':
	unittest.main(warnings='ignore')