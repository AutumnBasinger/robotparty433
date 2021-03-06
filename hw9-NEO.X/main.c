#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  // __ISR macro
#include<stdio.h>
#include "ws2812b.h"

// DEVCFG0
#pragma config DEBUG = OFF // disable debugging
#pragma config JTAGEN = OFF // disable jtag
#pragma config ICESEL = ICS_PGx1 // use PGED1 and PGEC1
#pragma config PWP = OFF // disable flash write protect
#pragma config BWP = OFF // disable boot write protect
#pragma config CP = OFF // disable code protect

// DEVCFG1
#pragma config FNOSC = FRCPLL // use fast frc oscillator with pll
#pragma config FSOSCEN = OFF // disable secondary oscillator
#pragma config IESO = OFF // disable switching clocks
#pragma config POSCMOD = OFF // primary osc disabled
#pragma config OSCIOFNC = OFF // disable clock output
#pragma config FPBDIV = DIV_1 // divide sysclk freq by 1 for peripheral bus clock
#pragma config FCKSM = CSDCMD // disable clock switch and FSCM
#pragma config WDTPS = PS1048576 // use largest wdt value, ??
#pragma config WINDIS = OFF // use non-window mode wdt
#pragma config FWDTEN = OFF // wdt disabled
#pragma config FWDTWINSZ = WINSZ_25 // wdt window at 25%

// DEVCFG2 - get the sysclk clock to 48MHz from the 8MHz fast rc internal oscillator
#pragma config FPLLIDIV = DIV_2 // divide input clock to be in range 4-5MHz
#pragma config FPLLMUL = MUL_24 // multiply clock after FPLLIDIV
#pragma config FPLLODIV = DIV_2 // divide clock after FPLLMUL to get 48MHz

// DEVCFG3
#pragma config USERID = 00000000 // some 16bit userid, doesn't matter what
#pragma config PMDL1WAY = OFF // allow multiple reconfigurations
#pragma config IOL1WAY = OFF // allow multiple reconfigurations

void readUART1(char * string, int maxLength);
void writeUART1(const char * string);

int main() {

    __builtin_disable_interrupts(); // disable interrupts while initializing things

    // set the CP0 CONFIG register to indicate that kseg0 is cacheable (0x3)
    __builtin_mtc0(_CP0_CONFIG, _CP0_CONFIG_SELECT, 0xa4210583);

    // 0 data RAM access wait states
    BMXCONbits.BMXWSDRM = 0x0;

    // enable multi vector interrupts
    INTCONbits.MVEC = 0x1;

    // disable JTAG to get pins back
    DDPCONbits.JTAGEN = 0;

    // do your TRIS and LAT commands here
    TRISAbits.TRISA4 = 0; // made TRISA an output
    LATAbits.LATA4 = 0; // turned TRISA off
    
    TRISBbits.TRISB4 = 1; // made TRISB an input
    LATBbits.LATB4 = 0; // turned TRISB off
    
//    U1RXRbits.U1RXR = 0b0001; // U1RX is B6
//    RPB7Rbits.RPB7R = 0b0001; // U1TX is B7 / is this right?
//    
//    // turn on UART1 without an interrupt
//    U1MODEbits.BRGH = 0; // set baud to NU32_DESIRED_BAUD
//    U1BRG = ((48000000 / 115200) / 16) - 1;
//    
//    // 8 bit, no parity bit, 1 stop bit (8N1 setup)
//    U1MODEbits.PDSEL = 0;
//    U1MODEbits.STSEL = 0;
//    
//    // configure TX & RX pins as output & input pins
//    U1STAbits.UTXEN = 1;
//    U1STAbits.URXEN = 1;
//    
//    // enable UART
//    U1MODEbits.ON = 1;

    __builtin_enable_interrupts();
    
    ws2812b_setup(); // timer is on
    wsColor leds[5]; // array of 5 LEDs
    
    leds[0].r = 0;
    leds[0].g = 0;
    leds[0].b = 0;
    
    leds[1].r = 0;
    leds[1].g = 0;
    leds[1].b = 0;
    
    leds[2].r = 0;
    leds[2].g = 0;
    leds[2].b = 0;
    
    leds[3].r = 0;
    leds[3].g = 0;
    leds[3].b = 0;
    
    leds[4].r = 0;
    leds[4].g = 0;
    leds[4].b = 0;
    
    
    float colors[5] = {0,72,144,216,288};
               
    while (1) {
        
        for (int i=0; i<=4; i++) {
            leds[i] = HSBtoRGB(colors[i],1,0.1);
            colors[i] = colors[i] + 1;
            if (colors[i] == 360) {
                colors[i] = 0;
            }
        }
        
        ws2812b_setColor(leds, 5);
            
        _CP0_SET_COUNT(0);
        while (_CP0_GET_COUNT() < 120000 ) {}      


    }
}

void readUART1(char * message, int maxLength) {
    char data = 0;
    int complete = 0, num_bytes = 0;
    while (!complete) { // loop until '\r' or '\n'
        if (U1STAbits.URXDA) { // if data available
            data = U1RXREG; // read data
            if ((data == '\n') || (data == '\r')) {
                complete = 1;
            } else {
                message[num_bytes] = data;
                ++num_bytes;
                if (num_bytes >= maxLength) { // roll over if array is too small
                    num_bytes = 0;
                }
            }
        }
    }
    message[num_bytes] = '\0'; // end string
}

// character array with UART1
void writeUART1 (const char * string) {
    while (*string != '\0') {
        while (U1STAbits.UTXBF) {
            ; // wait until TX buffer isn't full
        }
        U1TXREG = *string;
        ++string;
    }
}