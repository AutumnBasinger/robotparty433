import board
import time
import digitalio
import analogio
from ulab import numpy as np # to get access to ulab numpy functions

some_led = digitalio.DigitalInOut(board.GP16) # put an LED circuit on pin GP16
some_led.direction = digitalio.Direction.OUTPUT
some_button = digitalio.DigitalInOut(board.GP15) # put a button circuit on GP15
some_button.direction = digitalio.Direction.INPUT

built_in_led = digitalio.DigitalInOut(board.LED)
built_in_led.direction = digitalio.Direction.OUTPUT
adc_pin_a0 = analogio.AnalogIn(board.A0)

# while 1:
    #print("("+str(adc_pin_a0.value)+",)") # print with plotting format
    #if (adc_pin_a0.value > 14000):
        #some_led.value = 1
    #else:
        #some_led.value = 0
    #if (some_button.value == 0):
        #built_in_led.value = 1
    #else:
        #built_in_led.value = 0
    #time.sleep(.05) # delay in seconds


time = np.linspace(0, 10, num=1024) # sample 1024 times a second for in 10 seconds
sines = np.sin(2*np.pi*0.5*time) + np.sin(2*np.pi*5*time) + np.sin(2*np.pi*8*time) # 2 pi * frequency * time, read data
a, b = np.fft.fft(sines) # a and b sum to represent different frequencies in sines, fft is what are the frequencies in the signal

for i in range(100):
    #print("(" +str(a[i])+ "," +str(b[i])+ ",)" )
    print("(" +str(np.sqrt(a[i]**2+b[i]**2))+ ",)" ) # square root a squred + b squred

# output of fft is the magnitude, where does it start for every possible frequency
# tells you what the sum of sine waves would be
# identifies frequencies to do something with
