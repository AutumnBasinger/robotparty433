#mac terminal: screen /dev/tty.usbmodem11101
#cntrl a, cntrl k to quit screen
#tty.usbmodem11101%

import board # gets names of pins
from adafruit_ov7670 import (  # pylint: disable=unused-import, gets specific things
    OV7670,
    OV7670_SIZE_DIV8, # 80x60 image
    OV7670_COLOR_YUV,
)

import sys #more print statements
import time

import digitalio
import busio #i2c library

with digitalio.DigitalInOut(board.GP10) as reset: #blink pin to reset camera
    reset.switch_to_output(False)
    time.sleep(0.001)
    bus = busio.I2C(scl=board.GP5, sda=board.GP4) #turn on i2c pins

cam = OV7670( #init the chip, this would fail if not wired correctly
    bus,
    data_pins=[
        board.GP12,
        board.GP13,
        board.GP14,
        board.GP15,
        board.GP16,
        board.GP17,
        board.GP18,
        board.GP19,
    ],
    clock=board.GP11,
    vsync=board.GP7,
    href=board.GP21,
    mclk=board.GP20,
    shutdown=board.GP22,
    reset=board.GP10,
)

pid = cam.product_id #double check you can talk to camera
ver = cam.product_version
#print(f"Detected pid={pid:x} ver={ver:x}")

cam.size = OV7670_SIZE_DIV8 #how big is the image? this one is 80x60, grap every 8th pixel
#print(cam.width)
#print(cam.height)

#y is brightness, u is blue/green, v is yellow/red, sum to get image
#pixels next to each other have same u and v but different brightness
cam.colorspace = OV7670_COLOR_YUV #data comes 2 bytes per pixel, set of 4 bites is brightness/color of 2 pixels
cam.flip_y = True #can play with

#data comes out as one big array
buf = bytearray(2 * cam.width * cam.height)
chars = b" .:-=+*#%@" #turns brightness into one of these letters

width = cam.width
row = bytearray(2 * width)

#do this in putty, not mu
sys.stdout.write("\033[2J") #says delete the whole screen (all characters) and move cursor to top left
while True: #loop through rows, pixel, based on brightness draw letter
    cam.capture(buf) #grabs data, we don't know how long it will take
    for j in range(cam.height):
        sys.stdout.write(f"\033[{j}H")
        for i in range(cam.width):
            row[i * 2] = row[i * 2 + 1] = chars[ #display 2 pixels next to each other
                buf[2 * (width * j + i)] * (len(chars) - 1) // 255 #used to pick index of char array
            ]
        sys.stdout.write(row) #writes all elements of array (draws it)
        sys.stdout.write("\033[K")
    sys.stdout.write("\033[J")
    time.sleep(0.05)


# 2nd part of the code
# 2nd part of the code
# 2nd part of the code


import board
from adafruit_ov7670 import (
    OV7670,
    OV7670_SIZE_DIV16,
    OV7670_COLOR_YUV,
    OV7670_TEST_PATTERN_COLOR_BAR,
)

import sys
import time
import digitalio
import busio
from ulab import numpy as np

with digitalio.DigitalInOut(board.GP10) as reset:
    reset.switch_to_output(False)
    time.sleep(0.001)
    bus = busio.I2C(scl=board.GP5, sda=board.GP4)

cam = OV7670(
    bus,
    data_pins=[
        board.GP12,
        board.GP13,
        board.GP14,
        board.GP15,
        board.GP16,
        board.GP17,
        board.GP18,
        board.GP19,
    ],
    clock=board.GP11,
    vsync=board.GP7,
    href=board.GP21,
    mclk=board.GP20,
    shutdown=board.GP22,
    reset=board.GP10,
)

pid = cam.product_id
ver = cam.product_version
#print(f"Detected pid={pid:x} ver={ver:x}")

cam.size = OV7670_SIZE_DIV16
#print(cam.width)
##print(cam.height)

#cam.test_pattern = OV7670_TEST_PATTERN_COLOR_BAR

cam.colorspace = OV7670_COLOR_YUV
cam.flip_y = True

buf = bytearray(2 * cam.width * cam.height) # where all the raw data is stored

# store the converted pixel data
red = np.linspace(1,1,cam.width * cam.height, dtype=np.float)
green = np.linspace(0,0,cam.width * cam.height, dtype=np.float)
blue = np.linspace(0,0,cam.width * cam.height, dtype=np.float)
ind = 0

while True:
    sys.stdin.readline() # wait for a newline before taking an image
    cam.capture(buf) # get the image

    # process the raw data into color pixels
    # only turn lines 7, 14, and 21 color (the rest black and white)
    ind = 0
    for d in range(0,2 * cam.width * cam.height,4):
        u = buf[d+1] - 128
        v = buf[d+3] - 128
        red[ind] = buf[d] + 1.370705 * v #comment out to not do math and just get black and white
        if red[ind] > 255:
            red[ind] = 255
        if red[ind] < 0:
            red[ind] = 0
        green[ind] = buf[d] - 0.337633 * u - 0.698001 * v
        if green[ind] > 255:
            green[ind] = 255
        if green[ind] < 0:
            green[ind] = 0
        blue[ind] = buf[d] + 1.732446 * u
        if blue[ind] > 255:
            blue[ind] = 255
        if blue[ind] < 0:
            blue[ind] = 0

        ind = ind+1
        red[ind] = buf[d+2] + 1.370705 * v
        if red[ind] > 255:
            red[ind] = 255
        if red[ind] < 0:
            red[ind] = 0
        green[ind] = buf[d+2] - 0.337633 * u - 0.698001 * v
        if green[ind] > 255:
            green[ind] = 255
        if green[ind] < 0:
            green[ind] = 0
        blue[ind] = buf[d+2] + 1.732446 * u
        if blue[ind] > 255:
            blue[ind] = 255
        if blue[ind] < 0:
            blue[ind] = 0
        ind=ind+1

    # send the color data as index red green blue
    for c in range(red.size):
        print(str(c)+" "+str(int(red[c]))+" "+str(int(green[c]))+" "+str(int(blue[c])))


# 3rd part of the code
# 3rd part of the code
# 3rd part of the code

#use in pygame zero mode
# draw a 40 x 30 image from serial data
import serial
ser = serial.Serial('COM96',timeout=0) # use your port name
#print(ser.name)

import numpy as np # for arrays

# size of the window, each pixel will be 10 x 10
WIDTH = 400
HEIGHT = 300

# arrays to store data
red = np.linspace(0,0,40*30)
green = np.linspace(0,0,40*30)
blue = np.linspace(0,0,40*30)

# send a newline to ask for a new image
ser.write(('\n').encode())

def draw(): #loop through elements of RGB arrays and draw pixels
    ind = 0
    for y in range(0,29,1): #rows
        ind = ind + 1 # fudge
        for x in range(0,39,1): #columns
            BOX = Rect((x*10, y*10), (10, 10))
            COLOR = red[ind],green[ind],blue[ind]
            screen.draw.filled_rect(BOX, COLOR)
            ind = ind + 1

def update(): #grabs data from serial port, puts into arrays
    data_read = ser.readline() # read a line into a bytearray
    data_text = str(data_read,'utf-8') # turn the line into a string
    data = list(map(int,data_text.split())) # turn the string into a list of ints

    if(len(data)==4):
        red[data[0]] = data[1]
        green[data[0]] = data[2]
        blue[data[0]] = data[3]
        #print(data[0])
        # after you get an image, ask for another
        if data[0] == 1199:
            ser.write(('\n').encode())
