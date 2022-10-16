'''
 Copyright (C) 2022  Sebastian Britz

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 coach is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''
#import sys
#sys.path.append('/site-packages')
#import pandas as pd
#from time import sleep

def checkifready():
    #sleep(10)
    return True

def time(text):
    #time_now = pd.Timestamp.now()
    message = "Now let's start"
    time_now = "01:42"
    score = "7"
    print(text)
    return message, time_now, score
