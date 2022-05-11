import board
import time
import digitalio
import analogio

some_led = digitalio.DigitalInOut(board.GP16) # put an LED circuit on pin GP16
some_led.direction = digitalio.Direction.OUTPUT
some_button = digitalio.DigitalInOut(board.GP15) # put a button circuit on GP15
some_button.direction = digitalio.Direction.INPUT

built_in_led = digitalio.DigitalInOut(board.LED)
built_in_led.direction = digitalio.Direction.OUTPUT
adc_pin_a0 = analogio.AnalogIn(board.A0)

while 1:
    print("("+str(adc_pin_a0.value)+",)") # print with plotting format
    if (adc_pin_a0.value > 14000):
        some_led.value = 1
    else:
        some_led.value = 0
    if (some_button.value == 0):
        built_in_led.value = 1
    else:
        built_in_led.value = 0
    time.sleep(.05) # delay in seconds

from ulab import numpy as np # to get access to ulab numpy functions
from ulab import scipy as sp # do I need this?
from numpy import fft # what about this?
import matplotlib.pyplot as plt # how do I plot?

a = np.array([1,3,5,2,4,8,10]) #random array
#print(np.min(a)) #test functions
#print(np.max(a))
#print(np.median(a))

# Want to know all the functions available in numpy? In REPL type np. and press Tab.

b = np.array([])
x = np.sin(2)
y = np.sin(5)
z = np.sin(8)
s = x+y+z
b = b.append(s)

# where do I get fft?
# how do I plot?
# do I need scipy?
# np + tab doesn't do anything



