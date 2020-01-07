# -*- coding: utf-8 -*-
from selenium import webdriver
import unittest, time 

class FunctionalTest(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    # FTF1
    def test_T01_show_productos(self):
        driver = self.driver
        driver.get("http:localhost:8000/evaluar/inicio")
        driver.find_element_by_id("id_username").send_keys('root')
        driver.find_element_by_id("id_password").send_keys('a1e2i3o4u5')
        self.driver.find_element_by_id('login-form').submit()
        self.assertIn("Proyectos disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_proyecto")[0].click()
        self.assertIn("Fases disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_fase")[0].click()
        self.assertIn("Listado de productos a evaluar", driver.page_source)

    # FTF2
    def test_T02_change_aceptance_criteria(self):
        driver = self.driver
        driver.get("http:localhost:8000/evaluar/inicio")
        driver.find_element_by_id("id_username").send_keys('root')
        driver.find_element_by_id("id_password").send_keys('a1e2i3o4u5')
        self.driver.find_element_by_id('login-form').submit()
        self.assertIn("Proyectos disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_proyecto")[0].click()
        self.assertIn("Fases disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_fase")[0].click()
        self.assertIn("Listado de productos a evaluar", driver.page_source)
        driver.find_elements_by_class_name("see_criterios")[0].click()
        self.assertIn("Criterios de ", driver.page_source)
        checkbox = driver.find_elements_by_class_name("check_criteria")[0]
        checkbox.click()
        if checkbox.is_selected():
            self.assertTrue(checkbox.is_selected())
        else:
            self.assertFalse(checkbox.is_selected())

    # FTF2
    def test_T03_commi_aceptance_criteria_by_customer(self):
        driver = self.driver
        driver.get("http:localhost:8000/evaluar/inicio")
        driver.find_element_by_id("id_username").send_keys('saul')
        driver.find_element_by_id("id_password").send_keys('a1e2i3o4u5')
        self.driver.find_element_by_id('login-form').submit()
        self.assertIn("Proyectos disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_proyecto")[0].click()
        self.assertIn("Fases disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_fase")[0].click()
        self.assertIn("Listado de productos a evaluar", driver.page_source)
        driver.find_elements_by_class_name("see_criterios")[0].click()
        self.assertIn("Criterios de ", driver.page_source)
        driver.find_element_by_name("commit_criteria").click()
        self.assertIn('Aprobar criterios', driver.page_source)

    # FTF3
    def test_T04_load_product_measure_char(self):
        driver = self.driver
        driver.get("http:localhost:8000/evaluar/inicio")
        driver.find_element_by_id("id_username").send_keys('root')
        driver.find_element_by_id("id_password").send_keys('a1e2i3o4u5')
        self.driver.find_element_by_id('login-form').submit()
        self.assertIn("Proyectos disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_proyecto")[0].click()
        self.assertIn("Fases disponibles", driver.page_source)
        driver.find_elements_by_class_name("see_fase")[0].click()
        self.assertIn("Listado de productos a evaluar", driver.page_source)
        driver.find_elements_by_class_name("see_metricas")[0].click()
        self.assertIn(u"Métricas de ", driver.page_source)

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()