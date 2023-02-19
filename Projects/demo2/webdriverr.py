from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
import time
# driver = webdriver.Firefox()
# driver.get("http:google.com")


path = 'C:\Program Files (x86)\chromedriver.exe'
driver = webdriver.Chrome(path)
print(driver.title)
# searching
driver.get("https://techwithtim.net/")
# searchng= driver.find_element_by_name('s')
# searchng.send_keys('python')
# searchng.send_keys(Keys.RETURN)


# we r going to wait until the presence of the element on the page before we decide to move on next page
# try:
#     main = WebDriverWait(driver, 10).until(
#         EC.presence_of_element_located((By.ID, "main"))
#     )
#     print(main.text)
# except:
#     driver.quit()
# main =driver.find_element_by_id('main')

# time.sleep(5)
# driver.quit()


# Navigating
# link = driver.find_element_by_link_text("Python Programming")
# link.click()
# try:
#     elements = WebDriverWait(driver, 10).until(
#         EC.presence_of_element_located((By.LINK_TEXT, "Beginner Python Tutorials"))
#     )
#     # to clear the search box so tht it doesnt appends like 'pythonpython'
#     elements.clear()
#     elements.click()
#     elements = WebDriverWait(driver, 10).until(
#         EC.presence_of_element_located((By.ID, "sow-button-19310003"))
#     )
#     elements.click()
#     # to go frwrd and back
#     driver.back()
#     driver.forward()
# except:
#     driver.quit()


# action chains
# creates the object so tht we can ue it again and again to perfrm any action
actions =ActionChains(driver)
# ro wait the page to load one way was try othr is
driver.implicitly_wait(5)
# this will click wherever our mouse hovers but if will nt wrk if we dnt use perfom
actions.click()
actions.perform()