# robot-framework environment setup list
- Install Python 3.x: https://www.python.org/downloads/
- Install PyCharm: https://www.jetbrains.com/pycharm/download/#section=windows
- Install IntelliBot in PyCharm which is the Robot Framework Support plugin: https://plugins.jetbrains.com/plugin/10700-intellibot-seleniumlibrary-patched
- Install Robot Framework and Selenium Library

# Installation
- pip install robotframework
- pip install robotframework-seleniumlibrary

# Web drivers
Its most reliable to just manually download each driver and add them to path.
- [Chrome driver](https://chromedriver.chromium.org/)
- [Geckodriver for Firefox](https://github.com/mozilla/geckodriver/releases)

# How to Run the Robot Framework tests
#### From the root of the repo execute the following command on the pycharm terminal
```Shell
robot -d results tests\BBCNews.robot
```
# Running single test case
```Shell
robot -d results 
      -t "Verify the Top Navigation Links" \
      tests\BBCNews.robot
```
