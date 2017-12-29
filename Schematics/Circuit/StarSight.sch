EESchema Schematic File Version 2
LIBS:StarSight-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino_shieldsNCL
LIBS:Relay
LIBS:StarSight-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date "23 dec 2017"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_13X2 P1
U 1 1 5A367446
P 2500 6700
F 0 "P1" H 2500 7400 60  0000 C CNN
F 1 "CONN_13X2" V 2500 6700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x13" H 2500 6000 30  0000 C CNN
F 3 "" H 2500 6700 60  0001 C CNN
	1    2500 6700
	1    0    0    -1  
$EndComp
NoConn ~ 2900 6200
Text Label 1350 6200 0    60   ~ 0
GPIO0(SDA)
Text Label 1350 6300 0    60   ~ 0
GPIO1(SCL)
Text Label 1850 6200 0    60   ~ 0
GPIO4
NoConn ~ 2100 6500
Text Label 1850 6400 0    60   ~ 0
GPIO17
Text Label 1850 6500 0    60   ~ 0
GPIO21
Text Label 1850 6600 0    60   ~ 0
GPIO22
NoConn ~ 2100 6900
Text Label 1350 7100 0    60   ~ 0
GPIO9(MISO)
Text Label 1350 7200 0    60   ~ 0
GPIO11(SCLK)
NoConn ~ 2100 7300
$Comp
L GND-RESCUE-StarSight #PWR01
U 1 1 5A367449
P 3000 7400
F 0 "#PWR01" H 3000 7150 50  0001 C CNN
F 1 "GND" H 3000 7250 50  0000 C CNN
F 2 "" H 3000 7400 50  0000 C CNN
F 3 "" H 3000 7400 50  0000 C CNN
	1    3000 7400
	1    0    0    -1  
$EndComp
Text Label 3600 6400 2    60   ~ 0
TXD
Text Label 3600 6500 2    60   ~ 0
RXD
Text Label 3600 6600 2    60   ~ 0
GPIO18
NoConn ~ 2900 6700
Text Label 3600 6800 2    60   ~ 0
GPIO23
Text Label 3600 6900 2    60   ~ 0
GPIO24
NoConn ~ 2900 7000
Text Label 3600 7100 2    60   ~ 0
GPIO25
Text Label 3600 7200 2    60   ~ 0
GPIO8(CE0)
Text Label 3600 7300 2    60   ~ 0
GPIO7(CE1)
$Comp
L Conn_01x04 J12
U 1 1 5A3D8FAE
P 12800 5500
F 0 "J12" H 12800 5700 50  0000 C CNN
F 1 "ultSound1" H 12800 5200 50  0000 C CNN
F 2 "" H 12800 5500 50  0001 C CNN
F 3 "" H 12800 5500 50  0001 C CNN
	1    12800 5500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J13
U 1 1 5A3D9045
P 13700 5500
F 0 "J13" H 13700 5700 50  0000 C CNN
F 1 "ultSound1" H 13700 5200 50  0000 C CNN
F 2 "" H 13700 5500 50  0001 C CNN
F 3 "" H 13700 5500 50  0001 C CNN
	1    13700 5500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J6
U 1 1 5A3DA585
P 5200 2100
F 0 "J6" H 5200 2300 50  0000 C CNN
F 1 "Line5" H 5200 1900 50  0000 C CNN
F 2 "asd" H 5200 2100 50  0001 C CNN
F 3 "" H 5200 2100 50  0001 C CNN
	1    5200 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J9
U 1 1 5A3DA82C
P 5800 9700
F 0 "J9" H 5800 9900 50  0000 C CNN
F 1 "IR1" H 5800 9500 50  0000 C CNN
F 2 "asd" H 5800 9700 50  0001 C CNN
F 3 "" H 5800 9700 50  0001 C CNN
	1    5800 9700
	1    0    0    -1  
$EndComp
Text Label 1350 7000 0    60   ~ 0
GPIO10(MOSI)
$Comp
L Conn_01x03 J5
U 1 1 5A3E6418
P 5800 2100
F 0 "J5" H 5800 2300 50  0000 C CNN
F 1 "Line4" H 5800 1900 50  0000 C CNN
F 2 "asd" H 5800 2100 50  0001 C CNN
F 3 "" H 5800 2100 50  0001 C CNN
	1    5800 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J4
U 1 1 5A3E647F
P 6400 2100
F 0 "J4" H 6400 2300 50  0000 C CNN
F 1 "Line3" H 6400 1900 50  0000 C CNN
F 2 "asd" H 6400 2100 50  0001 C CNN
F 3 "" H 6400 2100 50  0001 C CNN
	1    6400 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J3
U 1 1 5A3E64D9
P 7000 2100
F 0 "J3" H 7000 2300 50  0000 C CNN
F 1 "Line2" H 7000 1900 50  0000 C CNN
F 2 "asd" H 7000 2100 50  0001 C CNN
F 3 "" H 7000 2100 50  0001 C CNN
	1    7000 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J2
U 1 1 5A3E652C
P 7600 2100
F 0 "J2" H 7600 2300 50  0000 C CNN
F 1 "Line1" H 7600 1900 50  0000 C CNN
F 2 "asd" H 7600 2100 50  0001 C CNN
F 3 "" H 7600 2100 50  0001 C CNN
	1    7600 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J7
U 1 1 5A3E73C2
P 4600 9700
F 0 "J7" H 4600 9900 50  0000 C CNN
F 1 "IR1" H 4600 9500 50  0000 C CNN
F 2 "asd" H 4600 9700 50  0001 C CNN
F 3 "" H 4600 9700 50  0001 C CNN
	1    4600 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J8
U 1 1 5A3E75B6
P 5200 9700
F 0 "J8" H 5200 9900 50  0000 C CNN
F 1 "IR1" H 5200 9500 50  0000 C CNN
F 2 "asd" H 5200 9700 50  0001 C CNN
F 3 "" H 5200 9700 50  0001 C CNN
	1    5200 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J10
U 1 1 5A3E7A51
P 6400 9700
F 0 "J10" H 6400 9900 50  0000 C CNN
F 1 "IR1" H 6400 9500 50  0000 C CNN
F 2 "asd" H 6400 9700 50  0001 C CNN
F 3 "" H 6400 9700 50  0001 C CNN
	1    6400 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J11
U 1 1 5A3E7ACA
P 7000 9700
F 0 "J11" H 7000 9900 50  0000 C CNN
F 1 "IR1" H 7000 9500 50  0000 C CNN
F 2 "asd" H 7000 9700 50  0001 C CNN
F 3 "" H 7000 9700 50  0001 C CNN
	1    7000 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J14
U 1 1 5A3E8D84
P 14600 5500
F 0 "J14" H 14600 5700 50  0000 C CNN
F 1 "ultSound1" H 14600 5200 50  0000 C CNN
F 2 "" H 14600 5500 50  0001 C CNN
F 3 "" H 14600 5500 50  0001 C CNN
	1    14600 5500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J15
U 1 1 5A3E8D8B
P 15500 5500
F 0 "J15" H 15500 5700 50  0000 C CNN
F 1 "ultSound1" H 15500 5200 50  0000 C CNN
F 2 "" H 15500 5500 50  0001 C CNN
F 3 "" H 15500 5500 50  0001 C CNN
	1    15500 5500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 5A3EA13C
P 7700 3250
F 0 "#PWR02" H 7700 3340 20  0001 C CNN
F 1 "+5V" H 7700 3340 30  0000 C CNN
F 2 "" H 7700 3250 60  0000 C CNN
F 3 "" H 7700 3250 60  0000 C CNN
	1    7700 3250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 5A3EA220
P 6000 1650
F 0 "#PWR03" H 6000 1740 20  0001 C CNN
F 1 "+5V" H 6000 1740 30  0000 C CNN
F 2 "" H 6000 1650 60  0000 C CNN
F 3 "" H 6000 1650 60  0000 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 5A3EA2F6
P 15800 6000
F 0 "#PWR04" H 15800 6090 20  0001 C CNN
F 1 "+5V" H 15800 6090 30  0000 C CNN
F 2 "" H 15800 6000 60  0000 C CNN
F 3 "" H 15800 6000 60  0000 C CNN
	1    15800 6000
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR05
U 1 1 5A3EA305
P 14400 5000
F 0 "#PWR05" H 14400 5000 30  0001 C CNN
F 1 "GND" H 14400 4930 30  0001 C CNN
F 2 "" H 14400 5000 60  0000 C CNN
F 3 "" H 14400 5000 60  0000 C CNN
	1    14400 5000
	-1   0    0    1   
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR06
U 1 1 5A3EA314
P 6200 2700
F 0 "#PWR06" H 6200 2700 30  0001 C CNN
F 1 "GND" H 6200 2630 30  0001 C CNN
F 2 "" H 6200 2700 60  0000 C CNN
F 3 "" H 6200 2700 60  0000 C CNN
	1    6200 2700
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR07
U 1 1 5A3EA323
P 5250 10200
F 0 "#PWR07" H 5250 10200 30  0001 C CNN
F 1 "GND" H 5250 10130 30  0001 C CNN
F 2 "" H 5250 10200 60  0000 C CNN
F 3 "" H 5250 10200 60  0000 C CNN
	1    5250 10200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 5A3EA332
P 5200 9150
F 0 "#PWR08" H 5200 9240 20  0001 C CNN
F 1 "+5V" H 5200 9240 30  0000 C CNN
F 2 "" H 5200 9150 60  0000 C CNN
F 3 "" H 5200 9150 60  0000 C CNN
	1    5200 9150
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR09
U 1 1 5A3EA583
P 7050 4250
F 0 "#PWR09" H 7050 4250 30  0001 C CNN
F 1 "GND" H 7050 4180 30  0001 C CNN
F 2 "" H 7050 4250 60  0000 C CNN
F 3 "" H 7050 4250 60  0000 C CNN
	1    7050 4250
	-1   0    0    1   
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR010
U 1 1 5A3EA59C
P 3100 2150
F 0 "#PWR010" H 3100 2150 30  0001 C CNN
F 1 "GND" H 3100 2080 30  0001 C CNN
F 2 "" H 3100 2150 60  0000 C CNN
F 3 "" H 3100 2150 60  0000 C CNN
	1    3100 2150
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-StarSight C2
U 1 1 5A3EAD99
P 3150 5050
F 0 "C2" H 3150 5150 40  0000 L CNN
F 1 "10 uF" H 3156 4965 40  0000 L CNN
F 2 "~" H 3188 4900 30  0000 C CNN
F 3 "~" H 3150 5050 60  0000 C CNN
	1    3150 5050
	0    -1   -1   0   
$EndComp
$Comp
L C-RESCUE-StarSight C1
U 1 1 5A3EADB2
P 3150 3000
F 0 "C1" H 3150 3100 40  0000 L CNN
F 1 "10 uF" H 3156 2915 40  0000 L CNN
F 2 "~" H 3188 2850 30  0000 C CNN
F 3 "~" H 3150 3000 60  0000 C CNN
	1    3150 3000
	0    -1   -1   0   
$EndComp
$Comp
L C-RESCUE-StarSight C3
U 1 1 5A3EADCA
P 3150 5350
F 0 "C3" H 3150 5450 40  0000 L CNN
F 1 "100 nF" H 3156 5265 40  0000 L CNN
F 2 "~" H 3188 5200 30  0000 C CNN
F 3 "~" H 3150 5350 60  0000 C CNN
	1    3150 5350
	0    -1   -1   0   
$EndComp
$Comp
L GND-RESCUE-StarSight #PWR011
U 1 1 5A3EB008
P 2650 3800
F 0 "#PWR011" H 2650 3800 30  0001 C CNN
F 1 "GND" H 2650 3730 30  0001 C CNN
F 2 "" H 2650 3800 60  0000 C CNN
F 3 "" H 2650 3800 60  0000 C CNN
	1    2650 3800
	0    1    1    0   
$EndComp
$Comp
L ARDUINO_MEGA_SHIELD SHIELD1
U 1 1 5A3EA7AE
P 8750 5950
F 0 "SHIELD1" H 8350 8450 60  0000 C CNN
F 1 "ARDUINO_MEGA_SHIELD" H 8650 3250 60  0000 C CNN
F 2 "" H 8750 5950 60  0000 C CNN
F 3 "" H 8750 5950 60  0000 C CNN
	1    8750 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 6200 14900 6200
Wire Wire Line
	14000 6100 9900 6100
Wire Wire Line
	6800 6200 7750 6200
Wire Wire Line
	6800 8500 6800 6200
Wire Wire Line
	6600 8500 6800 8500
Wire Wire Line
	6200 6100 7750 6100
Wire Wire Line
	6200 8400 6200 6100
Wire Wire Line
	6000 8400 6200 8400
Wire Wire Line
	5600 6000 7750 6000
Wire Wire Line
	5600 8300 5600 6000
Wire Wire Line
	5400 8300 5600 8300
Wire Wire Line
	5100 5900 7750 5900
Wire Wire Line
	5100 8200 5100 5900
Wire Wire Line
	4800 8200 5100 8200
Wire Wire Line
	4800 5800 7750 5800
Wire Wire Line
	4800 7900 4800 5800
Wire Wire Line
	4200 7900 4800 7900
Wire Wire Line
	4900 5100 7750 5100
Wire Wire Line
	4900 2000 4900 5100
Wire Wire Line
	5500 5000 7750 5000
Wire Wire Line
	5500 2000 5500 5000
Wire Wire Line
	5600 2000 5500 2000
Wire Wire Line
	6100 4900 7750 4900
Wire Wire Line
	6100 2000 6100 4900
Wire Wire Line
	6200 2000 6100 2000
Wire Wire Line
	6700 4800 7750 4800
Wire Wire Line
	6700 2000 6700 4800
Wire Wire Line
	6800 2000 6700 2000
Wire Wire Line
	7300 4700 7750 4700
Wire Wire Line
	7300 2000 7300 4700
Wire Wire Line
	7400 2000 7300 2000
Wire Wire Line
	3350 6100 2900 6100
Wire Wire Line
	2100 6200 1350 6200
Wire Wire Line
	2100 6300 1350 6300
Wire Wire Line
	2100 6400 1350 6400
Wire Wire Line
	2100 6600 1350 6600
Wire Wire Line
	2100 6700 1350 6700
Wire Wire Line
	2100 6800 1350 6800
Wire Wire Line
	1350 7100 2100 7100
Wire Wire Line
	1350 7200 2100 7200
Wire Wire Line
	3000 6300 2900 6300
Wire Wire Line
	2900 6400 3600 6400
Wire Wire Line
	2900 6500 3600 6500
Wire Wire Line
	2900 6600 3600 6600
Wire Wire Line
	2900 6800 3600 6800
Wire Wire Line
	2900 6900 3600 6900
Wire Wire Line
	2900 7100 3600 7100
Wire Wire Line
	2900 7200 3600 7200
Wire Wire Line
	2900 7300 3600 7300
Wire Wire Line
	1350 7000 2100 7000
Connection ~ 1400 7100
Connection ~ 1400 7200
Wire Wire Line
	3000 6300 3000 7400
Wire Wire Line
	4800 2100 5000 2100
Wire Wire Line
	4800 1800 4800 2100
Wire Wire Line
	5600 2100 5400 2100
Wire Wire Line
	5400 2100 5400 1800
Wire Wire Line
	6000 2100 6200 2100
Wire Wire Line
	6000 1650 6000 2100
Wire Wire Line
	6800 2100 6600 2100
Wire Wire Line
	6600 2100 6600 1800
Wire Wire Line
	7400 2100 7200 2100
Wire Wire Line
	7200 2100 7200 1800
Wire Wire Line
	5000 2200 5000 2400
Wire Wire Line
	5600 2200 5600 2400
Wire Wire Line
	6200 2200 6200 2700
Wire Wire Line
	6800 2400 6800 2200
Wire Wire Line
	7400 2400 7400 2200
Connection ~ 5400 1800
Connection ~ 6000 1800
Connection ~ 6600 1800
Connection ~ 6800 2400
Connection ~ 6200 2400
Connection ~ 5600 2400
Wire Wire Line
	6800 9300 6800 9600
Wire Wire Line
	4400 9300 4400 9600
Wire Wire Line
	5000 9300 5000 9600
Connection ~ 5000 9300
Wire Wire Line
	5600 9300 5600 9600
Connection ~ 5600 9300
Wire Wire Line
	6200 9300 6200 9600
Connection ~ 6200 9300
Wire Wire Line
	6700 10100 6700 9700
Wire Wire Line
	6700 9700 6800 9700
Wire Wire Line
	6200 9700 6100 9700
Wire Wire Line
	6100 9700 6100 10100
Connection ~ 6100 10100
Wire Wire Line
	5600 9700 5500 9700
Wire Wire Line
	5500 9700 5500 10100
Connection ~ 5500 10100
Wire Wire Line
	5000 9700 4900 9700
Wire Wire Line
	4900 9700 4900 10100
Connection ~ 4900 10100
Wire Wire Line
	4400 9700 4300 9700
Wire Wire Line
	4300 9700 4300 10100
Wire Wire Line
	12600 5200 15300 5200
Wire Wire Line
	12600 5200 12600 5400
Wire Wire Line
	13500 5200 13500 5400
Connection ~ 13500 5200
Wire Wire Line
	14400 5000 14400 5400
Connection ~ 14400 5200
Wire Wire Line
	14400 6000 14400 5700
Wire Wire Line
	12600 6000 15800 6000
Wire Wire Line
	15300 6000 15300 5700
Wire Wire Line
	12600 6000 12600 5700
Wire Wire Line
	13500 6000 13500 5700
Connection ~ 14400 6000
Connection ~ 13500 6000
Wire Wire Line
	4900 2000 5000 2000
Wire Wire Line
	4200 9800 4400 9800
Wire Wire Line
	4200 7900 4200 9800
Wire Wire Line
	4800 9800 5000 9800
Wire Wire Line
	4800 8200 4800 9800
Wire Wire Line
	5400 9800 5600 9800
Wire Wire Line
	5400 8300 5400 9800
Wire Wire Line
	6000 9800 6200 9800
Wire Wire Line
	6000 8400 6000 9800
Wire Wire Line
	6800 9800 6600 9800
Wire Wire Line
	6600 9800 6600 8500
Wire Wire Line
	7300 7000 7750 7000
Wire Wire Line
	7300 7000 7300 10500
Wire Wire Line
	7300 10500 1100 10500
Wire Wire Line
	1100 10500 1100 7000
Wire Wire Line
	1100 7000 1400 7000
Connection ~ 1400 7000
Wire Wire Line
	7400 7100 7750 7100
Wire Wire Line
	7400 7100 7400 10400
Wire Wire Line
	7400 10400 1200 10400
Wire Wire Line
	1200 10400 1200 7100
Wire Wire Line
	1200 7100 1400 7100
Wire Wire Line
	7200 6900 7750 6900
Wire Wire Line
	7200 6900 7200 10300
Wire Wire Line
	7200 10300 1300 10300
Wire Wire Line
	1300 10300 1300 7200
Wire Wire Line
	1300 7200 1400 7200
Wire Wire Line
	13500 5500 13100 5500
Wire Wire Line
	14400 5500 14000 5500
Wire Wire Line
	15300 5500 14900 5500
Connection ~ 15300 6000
Wire Wire Line
	12000 5500 12600 5500
Wire Wire Line
	13100 5500 13100 5100
Wire Wire Line
	14000 5500 14000 6100
Wire Wire Line
	14900 5500 14900 6200
Wire Wire Line
	13500 5600 13100 5600
Wire Wire Line
	14400 5600 14100 5600
Wire Wire Line
	15300 5600 15000 5600
Wire Wire Line
	12600 5600 12100 5600
Wire Wire Line
	7400 4200 7750 4200
Wire Wire Line
	7400 4200 7400 3250
Wire Wire Line
	7400 3250 7700 3250
Wire Wire Line
	7200 1800 4800 1800
Wire Wire Line
	5200 9300 5200 9150
Connection ~ 5200 9300
Wire Wire Line
	5250 10100 5250 10200
Connection ~ 5250 10100
Wire Wire Line
	7050 4400 7750 4400
Wire Wire Line
	7050 4400 7050 4250
Wire Wire Line
	15300 5200 15300 5400
Wire Wire Line
	5000 2400 7400 2400
Wire Wire Line
	4400 9300 6800 9300
Wire Wire Line
	4300 10100 6700 10100
Wire Wire Line
	3350 1800 3350 3250
Connection ~ 3350 1800
Wire Wire Line
	3350 4350 3350 6100
Connection ~ 3350 3000
Wire Wire Line
	12000 5500 12000 5800
Wire Wire Line
	12000 5800 9650 5800
Wire Wire Line
	13100 5100 9900 5100
Wire Wire Line
	9900 5100 9900 5900
Wire Wire Line
	9900 5900 9650 5900
Wire Wire Line
	9650 6000 9900 6000
Wire Wire Line
	9900 6000 9900 6100
Wire Wire Line
	9800 6200 9800 6100
Wire Wire Line
	9800 6100 9650 6100
$Comp
L CONN_2 P2
U 1 1 5A3EAAD9
P 2650 1900
F 0 "P2" V 2600 1900 40  0000 C CNN
F 1 "Power" V 2700 1900 40  0000 C CNN
F 2 "" H 2650 1900 60  0000 C CNN
F 3 "" H 2650 1900 60  0000 C CNN
	1    2650 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 2000 3100 2000
Wire Wire Line
	3100 2000 3100 2150
Wire Wire Line
	9650 6600 15000 6600
Wire Wire Line
	15000 6600 15000 5600
Wire Wire Line
	9650 6800 14100 6800
Wire Wire Line
	14100 6800 14100 5600
Wire Wire Line
	13100 5600 13100 7200
Wire Wire Line
	12100 5600 12100 7450
Wire Wire Line
	12100 7450 9650 7450
Wire Wire Line
	13100 7200 9650 7200
$Comp
L LM2956-5V IC1
U 1 1 5A46AE9F
P 3250 3800
F 0 "IC1" H 2950 4050 60  0000 C CNN
F 1 "LM2956-5V" H 3350 4050 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 2950 4050 60  0001 C CNN
F 3 "" H 2950 4050 60  0001 C CNN
	1    3250 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3250 2800 3250
Wire Wire Line
	2800 3000 2800 5350
Wire Wire Line
	2800 3800 2650 3800
Wire Wire Line
	2800 3000 2950 3000
Connection ~ 2800 3250
Wire Wire Line
	2800 5050 2950 5050
Connection ~ 2800 3800
Wire Wire Line
	2800 5350 2950 5350
Connection ~ 2800 5050
Connection ~ 3350 5050
Connection ~ 3350 5350
$Comp
L L L1
U 1 1 5A46BC16
P 3150 4500
F 0 "L1" V 3100 4500 50  0000 C CNN
F 1 "33 uH" V 3225 4500 50  0000 C CNN
F 2 "Diodes_THT:D_5W_P5.08mm_Vertical_KathodeUp" H 3150 4500 50  0001 C CNN
F 3 "" H 3150 4500 50  0001 C CNN
	1    3150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4350 3250 4350
Wire Wire Line
	3150 4650 3350 4650
Connection ~ 3350 4650
$Comp
L D_Schottky D1
U 1 1 5A46BEB7
P 2950 4350
F 0 "D1" H 2950 4450 50  0000 C CNN
F 1 "1n5824" H 2950 4250 50  0000 C CNN
F 2 "Diodes_THT:D_DO-201_P15.24mm_Horizontal" H 2950 4350 50  0001 C CNN
F 3 "" H 2950 4350 50  0001 C CNN
	1    2950 4350
	-1   0    0    1   
$EndComp
Connection ~ 3150 4350
Connection ~ 2800 4350
$Comp
L Q_NMOS_GDS Q2
U 1 1 5A46E3DA
P 12050 3100
F 0 "Q2" H 12250 3150 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 12250 3050 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 12250 3200 50  0001 C CNN
F 3 "" H 12050 3100 50  0001 C CNN
	1    12050 3100
	1    0    0    -1  
$EndComp
$Comp
L D D2
U 1 1 5A46E625
P 12150 2450
F 0 "D2" H 12150 2550 50  0000 C CNN
F 1 "D" H 12150 2350 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P5.08mm_Vertical_KathodeUp" H 12150 2450 50  0001 C CNN
F 3 "" H 12150 2450 50  0001 C CNN
	1    12150 2450
	0    1    1    0   
$EndComp
$Comp
L RSM822 K2
U 1 1 5A46E96F
P 11550 1950
F 0 "K2" H 12400 2100 50  0000 L CNN
F 1 "M1BS5V2-05T" H 12400 2000 50  0000 L CNN
F 2 "Relays_THT:Relay_DPDT_Finder_40.52" H 13100 1920 50  0001 C CNN
F 3 "" H 11550 1950 50  0001 C CNN
	1    11550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 2600 12150 2900
Wire Wire Line
	12150 2300 12150 2250
$Comp
L GND #PWR012
U 1 1 5A46EF59
P 11650 2600
F 0 "#PWR012" H 11650 2350 50  0001 C CNN
F 1 "GND" H 11650 2450 50  0000 C CNN
F 2 "" H 11650 2600 50  0001 C CNN
F 3 "" H 11650 2600 50  0001 C CNN
	1    11650 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	11750 2250 11750 2650
$Comp
L R R2
U 1 1 5A46F57E
P 11750 2800
F 0 "R2" V 11830 2800 50  0000 C CNN
F 1 "10k" V 11750 2800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11680 2800 50  0001 C CNN
F 3 "" H 11750 2800 50  0001 C CNN
	1    11750 2800
	1    0    0    -1  
$EndComp
Connection ~ 11750 2600
$Comp
L +12V #PWR013
U 1 1 5A46F84A
P 12150 3300
F 0 "#PWR013" H 12150 3150 50  0001 C CNN
F 1 "+12V" H 12150 3440 50  0000 C CNN
F 2 "" H 12150 3300 50  0001 C CNN
F 3 "" H 12150 3300 50  0001 C CNN
	1    12150 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	11650 1650 11650 1450
Wire Wire Line
	11650 1450 12250 1450
Wire Wire Line
	12250 1450 12250 1650
Wire Wire Line
	11850 1650 11850 1550
Wire Wire Line
	11850 1550 12050 1550
Wire Wire Line
	12050 1550 12050 1650
$Comp
L Conn_01x02 J16
U 1 1 5A46FD55
P 11900 1200
F 0 "J16" H 11900 1300 50  0000 C CNN
F 1 "Conn_01x02" H 11900 1000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 11900 1200 50  0001 C CNN
F 3 "" H 11900 1200 50  0001 C CNN
	1    11900 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11750 4100 11750 2950
Wire Wire Line
	11750 3100 11850 3100
Connection ~ 11750 3100
Wire Wire Line
	12000 1400 12000 1550
Connection ~ 12000 1550
Wire Wire Line
	11900 1400 11900 1450
Connection ~ 11900 1450
Wire Wire Line
	9650 4000 11350 4000
Wire Wire Line
	11350 4000 11350 2250
$Comp
L GND #PWR014
U 1 1 5A470E5E
P 11350 1450
F 0 "#PWR014" H 11350 1200 50  0001 C CNN
F 1 "GND" H 11350 1300 50  0000 C CNN
F 2 "" H 11350 1450 50  0001 C CNN
F 3 "" H 11350 1450 50  0001 C CNN
	1    11350 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	11350 1450 11350 1650
Wire Wire Line
	11650 2600 11750 2600
Wire Wire Line
	9650 4100 11750 4100
$Comp
L RSM822 K1
U 1 1 5A4714B5
P 9550 1950
F 0 "K1" H 10400 2100 50  0000 L CNN
F 1 "M1BS5V2-05T" H 10400 2000 50  0000 L CNN
F 2 "Relays_THT:Relay_DPDT_Finder_40.52" H 11100 1920 50  0001 C CNN
F 3 "" H 9550 1950 50  0001 C CNN
	1    9550 1950
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J17
U 1 1 5A471593
P 9900 1200
F 0 "J17" H 9900 1300 50  0000 C CNN
F 1 "Conn_01x02" H 9900 1000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9900 1200 50  0001 C CNN
F 3 "" H 9900 1200 50  0001 C CNN
	1    9900 1200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR015
U 1 1 5A471639
P 9350 1400
F 0 "#PWR015" H 9350 1150 50  0001 C CNN
F 1 "GND" H 9350 1250 50  0000 C CNN
F 2 "" H 9350 1400 50  0001 C CNN
F 3 "" H 9350 1400 50  0001 C CNN
	1    9350 1400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR016
U 1 1 5A471703
P 9650 2600
F 0 "#PWR016" H 9650 2350 50  0001 C CNN
F 1 "GND" H 9650 2450 50  0000 C CNN
F 2 "" H 9650 2600 50  0001 C CNN
F 3 "" H 9650 2600 50  0001 C CNN
	1    9650 2600
	0    1    1    0   
$EndComp
$Comp
L Q_NMOS_GDS Q1
U 1 1 5A471787
P 10050 3100
F 0 "Q1" H 10250 3150 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 10250 3050 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10250 3200 50  0001 C CNN
F 3 "" H 10050 3100 50  0001 C CNN
	1    10050 3100
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A471876
P 9750 2800
F 0 "R1" V 9830 2800 50  0000 C CNN
F 1 "10k" V 9750 2800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9680 2800 50  0001 C CNN
F 3 "" H 9750 2800 50  0001 C CNN
	1    9750 2800
	1    0    0    -1  
$EndComp
$Comp
L D D3
U 1 1 5A47192A
P 10150 2450
F 0 "D3" H 10150 2550 50  0000 C CNN
F 1 "D" H 10150 2350 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P5.08mm_Vertical_KathodeUp" H 10150 2450 50  0001 C CNN
F 3 "" H 10150 2450 50  0001 C CNN
	1    10150 2450
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR017
U 1 1 5A4719E3
P 10150 3300
F 0 "#PWR017" H 10150 3150 50  0001 C CNN
F 1 "+12V" H 10150 3440 50  0000 C CNN
F 2 "" H 10150 3300 50  0001 C CNN
F 3 "" H 10150 3300 50  0001 C CNN
	1    10150 3300
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR018
U 1 1 5A471AF6
P 3650 1800
F 0 "#PWR018" H 3650 1650 50  0001 C CNN
F 1 "+12V" H 3650 1940 50  0000 C CNN
F 2 "" H 3650 1800 50  0001 C CNN
F 3 "" H 3650 1800 50  0001 C CNN
	1    3650 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 1800 3000 1800
$Comp
L +12V #PWR019
U 1 1 5A472009
P 7750 4500
F 0 "#PWR019" H 7750 4350 50  0001 C CNN
F 1 "+12V" H 7750 4640 50  0000 C CNN
F 2 "" H 7750 4500 50  0001 C CNN
F 3 "" H 7750 4500 50  0001 C CNN
	1    7750 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 3900 9750 3900
Wire Wire Line
	9750 3900 9750 2950
Wire Wire Line
	9750 3100 9850 3100
Connection ~ 9750 3100
Wire Wire Line
	10150 2900 10150 2600
Wire Wire Line
	10150 2300 10150 2250
Wire Wire Line
	9650 2600 9750 2600
Wire Wire Line
	9750 2250 9750 2650
Connection ~ 9750 2600
Wire Wire Line
	9650 1650 9650 1450
Wire Wire Line
	9650 1450 10250 1450
Wire Wire Line
	10250 1450 10250 1650
Wire Wire Line
	10050 1650 10050 1550
Wire Wire Line
	10050 1550 9850 1550
Wire Wire Line
	9850 1550 9850 1650
Wire Wire Line
	10000 1400 10000 1550
Connection ~ 10000 1550
Wire Wire Line
	9900 1400 9900 1450
Connection ~ 9900 1450
Wire Wire Line
	9350 1400 9350 1650
Wire Wire Line
	9650 3800 9700 3800
Wire Wire Line
	9700 3800 9700 3100
Wire Wire Line
	9700 3100 9350 3100
Wire Wire Line
	9350 3100 9350 2250
$EndSCHEMATC
