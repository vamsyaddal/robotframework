# keywords.py
import pyautogui
import time

def upload_file_using_pyautogui(file_path):
    time.sleep(2)
    pyautogui.write(file_path)
    pyautogui.press('enter')
