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
L GND-RESCUE-StarSight #PWR01
U 1 1 5A367449
P 3000 8450
F 0 "#PWR01" H 3000 8200 50  0001 C CNN
F 1 "GND" H 3000 8300 50  0000 C CNN
F 2 "" H 3000 8450 50  0000 C CNN
F 3 "" H 3000 8450 50  0000 C CNN
	1    3000 8450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J12
U 1 1 5A3D8FAE
P 12800 5500
F 0 "J12" H 12800 5700 50  0000 C CNN
F 1 "ultSound1" H 12800 5200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 12800 5500 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 13700 5500 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5200 2100 50  0001 C CNN
F 3 "" H 5200 2100 50  0001 C CNN
	1    5200 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J9
U 1 1 5A3DA82C
P 4850 9700
F 0 "J9" H 4850 9900 50  0000 C CNN
F 1 "IR1" H 4850 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4850 9700 50  0001 C CNN
F 3 "" H 4850 9700 50  0001 C CNN
	1    4850 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J5
U 1 1 5A3E6418
P 5800 2100
F 0 "J5" H 5800 2300 50  0000 C CNN
F 1 "Line4" H 5800 1900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5800 2100 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6400 2100 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7000 2100 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 7600 2100 50  0001 C CNN
F 3 "" H 7600 2100 50  0001 C CNN
	1    7600 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J7
U 1 1 5A3E73C2
P 3650 9700
F 0 "J7" H 3650 9900 50  0000 C CNN
F 1 "IR1" H 3650 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3650 9700 50  0001 C CNN
F 3 "" H 3650 9700 50  0001 C CNN
	1    3650 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J8
U 1 1 5A3E75B6
P 4250 9700
F 0 "J8" H 4250 9900 50  0000 C CNN
F 1 "IR1" H 4250 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4250 9700 50  0001 C CNN
F 3 "" H 4250 9700 50  0001 C CNN
	1    4250 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J10
U 1 1 5A3E7A51
P 5450 9700
F 0 "J10" H 5450 9900 50  0000 C CNN
F 1 "IR1" H 5450 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5450 9700 50  0001 C CNN
F 3 "" H 5450 9700 50  0001 C CNN
	1    5450 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J11
U 1 1 5A3E7ACA
P 6050 9700
F 0 "J11" H 6050 9900 50  0000 C CNN
F 1 "IR1" H 6050 9500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6050 9700 50  0001 C CNN
F 3 "" H 6050 9700 50  0001 C CNN
	1    6050 9700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J14
U 1 1 5A3E8D84
P 14600 5500
F 0 "J14" H 14600 5700 50  0000 C CNN
F 1 "ultSound1" H 14600 5200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 14600 5500 50  0001 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 15500 5500 50  0001 C CNN
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
P 4300 10200
F 0 "#PWR07" H 4300 10200 30  0001 C CNN
F 1 "GND" H 4300 10130 30  0001 C CNN
F 2 "" H 4300 10200 60  0000 C CNN
F 3 "" H 4300 10200 60  0000 C CNN
	1    4300 10200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 5A3EA332
P 4250 9150
F 0 "#PWR08" H 4250 9240 20  0001 C CNN
F 1 "+5V" H 4250 9240 30  0000 C CNN
F 2 "" H 4250 9150 60  0000 C CNN
F 3 "" H 4250 9150 60  0000 C CNN
	1    4250 9150
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
F 1 "680 uF" H 3156 4965 40  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 3188 4900 30  0000 C CNN
F 3 "~" H 3150 5050 60  0000 C CNN
	1    3150 5050
	0    -1   -1   0   
$EndComp
$Comp
L C-RESCUE-StarSight C1
U 1 1 5A3EADB2
P 3150 3000
F 0 "C1" H 3150 3100 40  0000 L CNN
F 1 "220 uF" H 3156 2915 40  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 3188 2850 30  0000 C CNN
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
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P5.00mm" H 3188 5200 30  0000 C CNN
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
F 2 "arduino_shields:ARDUINO_MEGA_SHIELD" H 8750 5950 60  0001 C CNN
F 3 "" H 8750 5950 60  0000 C CNN
	1    8750 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 6200 14900 6200
Wire Wire Line
	14000 6100 9900 6100
Wire Wire Line
	5850 6200 7750 6200
Wire Wire Line
	5850 8500 5850 6200
Wire Wire Line
	5650 8500 5850 8500
Wire Wire Line
	5250 6100 7750 6100
Wire Wire Line
	5250 8400 5250 6100
Wire Wire Line
	5050 8400 5250 8400
Wire Wire Line
	4650 6000 7750 6000
Wire Wire Line
	4650 8300 4650 6000
Wire Wire Line
	4450 8300 4650 8300
Wire Wire Line
	4150 5900 7750 5900
Wire Wire Line
	4150 8200 4150 5900
Wire Wire Line
	3850 8200 4150 8200
Wire Wire Line
	3850 5800 7750 5800
Wire Wire Line
	3850 7900 3850 5800
Wire Wire Line
	3250 7900 3850 7900
Wire Wire Line
	4900 5200 7750 5200
Wire Wire Line
	4900 2000 4900 5200
Wire Wire Line
	5500 5100 7750 5100
Wire Wire Line
	5500 2000 5500 5100
Wire Wire Line
	5600 2000 5500 2000
Wire Wire Line
	6100 5000 7750 5000
Wire Wire Line
	6100 2000 6100 5000
Wire Wire Line
	6200 2000 6100 2000
Wire Wire Line
	6700 4900 7750 4900
Wire Wire Line
	6700 2000 6700 4900
Wire Wire Line
	6800 2000 6700 2000
Wire Wire Line
	7300 4800 7750 4800
Wire Wire Line
	7300 2000 7300 4800
Wire Wire Line
	7400 2000 7300 2000
Wire Wire Line
	3350 6100 2750 6100
Wire Wire Line
	2750 6300 3000 6300
Wire Wire Line
	3000 6300 3000 8450
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
	5850 9300 5850 9600
Wire Wire Line
	3450 9300 3450 9600
Wire Wire Line
	4050 9300 4050 9600
Connection ~ 4050 9300
Wire Wire Line
	4650 9300 4650 9600
Connection ~ 4650 9300
Wire Wire Line
	5250 9300 5250 9600
Connection ~ 5250 9300
Wire Wire Line
	5750 10100 5750 9700
Wire Wire Line
	5750 9700 5850 9700
Wire Wire Line
	5250 9700 5150 9700
Wire Wire Line
	5150 9700 5150 10100
Connection ~ 5150 10100
Wire Wire Line
	4650 9700 4550 9700
Wire Wire Line
	4550 9700 4550 10100
Connection ~ 4550 10100
Wire Wire Line
	4050 9700 3950 9700
Wire Wire Line
	3950 9700 3950 10100
Connection ~ 3950 10100
Wire Wire Line
	3450 9700 3350 9700
Wire Wire Line
	3350 9700 3350 10100
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
	3250 9800 3450 9800
Wire Wire Line
	3250 7900 3250 9800
Wire Wire Line
	3850 9800 4050 9800
Wire Wire Line
	3850 8200 3850 9800
Wire Wire Line
	4450 9800 4650 9800
Wire Wire Line
	4450 8300 4450 9800
Wire Wire Line
	5050 9800 5250 9800
Wire Wire Line
	5050 8400 5050 9800
Wire Wire Line
	5850 9800 5650 9800
Wire Wire Line
	5650 9800 5650 8500
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
	4250 9300 4250 9150
Connection ~ 4250 9300
Wire Wire Line
	4300 10100 4300 10200
Connection ~ 4300 10100
Wire Wire Line
	7050 4400 7750 4400
Wire Wire Line
	7050 4400 7050 4250
Wire Wire Line
	15300 5200 15300 5400
Wire Wire Line
	5000 2400 7400 2400
Wire Wire Line
	3450 9300 5850 9300
Wire Wire Line
	3350 10100 5750 10100
Wire Wire Line
	3350 1800 3350 3250
Connection ~ 3350 1800
Wire Wire Line
	3350 4350 3350 6200
Connection ~ 3350 3000
Wire Wire Line
	12000 5500 12000 5800
Wire Wire Line
	12000 5800 9650 5800
Wire Wire Line
	9650 5900 10450 5900
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
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 2650 1900 60  0001 C CNN
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
F 2 "reg:TO170P470X1016X2092-5P" H 2950 4050 60  0001 C CNN
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
F 2 "Inductors_THT:L_Toroid_Vertical_L16.0mm_W8.0mm_P7.62mm" H 3150 4500 50  0001 C CNN
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
L +12V #PWR012
U 1 1 5A471AF6
P 3650 1800
F 0 "#PWR012" H 3650 1650 50  0001 C CNN
F 1 "+12V" H 3650 1940 50  0000 C CNN
F 2 "" H 3650 1800 50  0001 C CNN
F 3 "" H 3650 1800 50  0001 C CNN
	1    3650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 4000 1800
$Comp
L Conn_01x02 J16
U 1 1 5A8B16B7
P 12150 2200
F 0 "J16" H 12150 2300 50  0000 C CNN
F 1 "Conn_01x02" H 12150 2000 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 12150 2200 50  0001 C CNN
F 3 "" H 12150 2200 50  0001 C CNN
	1    12150 2200
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR013
U 1 1 5A8B615B
P 12250 2500
F 0 "#PWR013" H 12250 2350 50  0001 C CNN
F 1 "+12V" H 12250 2640 50  0000 C CNN
F 2 "" H 12250 2500 50  0001 C CNN
F 3 "" H 12250 2500 50  0001 C CNN
	1    12250 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	12150 3350 12150 3250
$Comp
L GND #PWR014
U 1 1 5A8B5D3D
P 12150 3350
F 0 "#PWR014" H 12150 3100 50  0001 C CNN
F 1 "GND" H 12150 3200 50  0000 C CNN
F 2 "" H 12150 3350 50  0001 C CNN
F 3 "" H 12150 3350 50  0001 C CNN
	1    12150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 2850 12150 2400
Wire Wire Line
	11750 2550 11750 2600
Wire Wire Line
	11550 2550 11750 2550
Wire Wire Line
	11750 2900 11750 3200
$Comp
L R R6
U 1 1 5A8B5D26
P 11750 3350
F 0 "R6" V 11830 3350 50  0000 C CNN
F 1 "100" V 11750 3350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 11680 3350 50  0001 C CNN
F 3 "" H 11750 3350 50  0001 C CNN
	1    11750 3350
	1    0    0    -1  
$EndComp
Connection ~ 11750 3050
Wire Wire Line
	11750 3050 11850 3050
$Comp
L R R5
U 1 1 5A8B5CFA
P 11750 2750
F 0 "R5" V 11830 2750 50  0000 C CNN
F 1 "10k" V 11750 2750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P20.32mm_Horizontal" V 11680 2750 50  0001 C CNN
F 3 "" H 11750 2750 50  0001 C CNN
	1    11750 2750
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GDS Q4
U 1 1 5A8B5CF4
P 12050 3050
F 0 "Q4" H 12250 3100 50  0000 L CNN
F 1 "BUZZ TO220" H 12250 3000 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 12250 3150 50  0001 C CNN
F 3 "" H 12050 3050 50  0001 C CNN
	1    12050 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5A8B5CEE
P 11550 2600
F 0 "#PWR015" H 11550 2350 50  0001 C CNN
F 1 "GND" H 11550 2450 50  0000 C CNN
F 2 "" H 11550 2600 50  0001 C CNN
F 3 "" H 11550 2600 50  0001 C CNN
	1    11550 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 2600 11550 2550
Wire Wire Line
	12250 2500 12250 2400
Wire Wire Line
	3350 6200 2750 6200
Connection ~ 3350 6100
Wire Wire Line
	2750 7000 3000 7000
Connection ~ 3000 7000
Wire Wire Line
	2750 6700 3000 6700
Connection ~ 3000 6700
Wire Wire Line
	2000 6500 2250 6500
Wire Wire Line
	2000 6500 2000 8250
Wire Wire Line
	2000 8250 3000 8250
Connection ~ 3000 8250
Wire Wire Line
	2000 7300 2250 7300
Connection ~ 2000 7300
$Comp
L Conn_02x20_Odd_Even J1
U 1 1 5A921469
P 2450 7000
F 0 "J1" H 2500 8000 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 2500 5900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 2450 7000 50  0001 C CNN
F 3 "" H 2450 7000 50  0001 C CNN
	1    2450 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 7500 3000 7500
Connection ~ 3000 7500
Wire Wire Line
	2750 7700 3000 7700
Connection ~ 3000 7700
Wire Wire Line
	2250 8000 2000 8000
Connection ~ 2000 8000
$Comp
L GND-RESCUE-StarSight #PWR016
U 1 1 5A927DAF
P 11450 8550
F 0 "#PWR016" H 11450 8550 30  0001 C CNN
F 1 "GND" H 11450 8480 30  0001 C CNN
F 2 "" H 11450 8550 60  0000 C CNN
F 3 "" H 11450 8550 60  0000 C CNN
	1    11450 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	12100 8150 11450 8150
Wire Wire Line
	11450 8150 11450 8550
Wire Wire Line
	12100 8250 11600 8250
Wire Wire Line
	12100 8350 11600 8350
Wire Wire Line
	9650 5700 10650 5700
Wire Wire Line
	9650 5600 10650 5600
Text Label 10550 5700 0    60   ~ 0
RX
Text Label 10550 5600 0    60   ~ 0
TX
Text Label 11600 8250 0    60   ~ 0
RX
Text Label 11600 8350 0    60   ~ 0
TX
$Comp
L +5V #PWR017
U 1 1 5A92A4D2
P 3600 5300
F 0 "#PWR017" H 3600 5390 20  0001 C CNN
F 1 "+5V" H 3600 5390 30  0000 C CNN
F 2 "" H 3600 5300 60  0000 C CNN
F 3 "" H 3600 5300 60  0000 C CNN
	1    3600 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5350 3600 5350
Wire Wire Line
	3600 5350 3600 5300
$Comp
L Conn_01x03 J17
U 1 1 5A92B2C4
P 12300 8250
F 0 "J17" H 12300 8450 50  0000 C CNN
F 1 "Conn_01x03" H 12300 8050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 12300 8250 50  0001 C CNN
F 3 "" H 12300 8250 50  0001 C CNN
	1    12300 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4500 11750 4500
Wire Wire Line
	11750 4500 11750 3500
Wire Wire Line
	10450 5900 10450 5100
Wire Wire Line
	10450 5100 13100 5100
$Comp
L Conn_01x09 J?
U 1 1 5A92B9C8
P 10050 5050
F 0 "J?" H 10050 5550 50  0000 C CNN
F 1 "Conn_01x09" H 10050 4550 50  0000 C CNN
F 2 "" H 10050 5050 50  0001 C CNN
F 3 "" H 10050 5050 50  0001 C CNN
	1    10050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4600 9750 4600
Wire Wire Line
	9750 4600 9750 4650
Wire Wire Line
	9750 4650 9850 4650
Wire Wire Line
	9650 4700 9750 4700
Wire Wire Line
	9750 4700 9750 4750
Wire Wire Line
	9750 4750 9850 4750
Wire Wire Line
	9850 4850 9750 4850
Wire Wire Line
	9750 4850 9750 4800
Wire Wire Line
	9750 4800 9650 4800
Wire Wire Line
	9650 4900 9750 4900
Wire Wire Line
	9750 4900 9750 4950
Wire Wire Line
	9750 4950 9850 4950
Wire Wire Line
	9850 5050 9750 5050
Wire Wire Line
	9750 5050 9750 5000
Wire Wire Line
	9750 5000 9650 5000
Wire Wire Line
	9650 5100 9750 5100
Wire Wire Line
	9750 5100 9750 5150
Wire Wire Line
	9750 5150 9850 5150
Wire Wire Line
	9850 5250 9750 5250
Wire Wire Line
	9750 5250 9750 5200
Wire Wire Line
	9750 5200 9650 5200
Wire Wire Line
	9650 5400 9750 5400
Wire Wire Line
	9750 5400 9750 5350
Wire Wire Line
	9750 5350 9850 5350
Wire Wire Line
	9650 5500 9750 5500
Wire Wire Line
	9750 5500 9750 5450
Wire Wire Line
	9750 5450 9850 5450
$Comp
L Conn_01x04 J?
U 1 1 5A92CF57
P 7350 5550
F 0 "J?" H 7350 5750 50  0000 C CNN
F 1 "Conn_01x04" H 7350 5250 50  0000 C CNN
F 2 "" H 7350 5550 50  0001 C CNN
F 3 "" H 7350 5550 50  0001 C CNN
	1    7350 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 5700 7650 5700
Wire Wire Line
	7650 5700 7650 5650
Wire Wire Line
	7650 5650 7550 5650
Wire Wire Line
	7550 5550 7650 5550
Wire Wire Line
	7650 5550 7650 5600
Wire Wire Line
	7650 5600 7750 5600
Wire Wire Line
	7750 5400 7650 5400
Wire Wire Line
	7650 5400 7650 5450
Wire Wire Line
	7650 5450 7550 5450
Wire Wire Line
	7550 5350 7650 5350
Wire Wire Line
	7650 5350 7650 5300
Wire Wire Line
	7650 5300 7750 5300
Wire Wire Line
	7750 4700 7450 4700
Text Label 7450 4700 0    60   ~ 0
V_READ
$Comp
L R R?
U 1 1 5A92FC36
P 4000 2350
F 0 "R?" V 4080 2350 50  0000 C CNN
F 1 "20k" V 4000 2350 50  0000 C CNN
F 2 "" V 3930 2350 50  0001 C CNN
F 3 "" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5A92FD21
P 4000 2900
F 0 "R?" V 4080 2900 50  0000 C CNN
F 1 "10k" V 4000 2900 50  0000 C CNN
F 2 "" V 3930 2900 50  0001 C CNN
F 3 "" H 4000 2900 50  0001 C CNN
	1    4000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2500 4000 2750
Wire Wire Line
	4000 1800 4000 2200
Connection ~ 3650 1800
$Comp
L GND-RESCUE-StarSight #PWR?
U 1 1 5A930057
P 4000 3300
F 0 "#PWR?" H 4000 3300 30  0001 C CNN
F 1 "GND" H 4000 3230 30  0001 C CNN
F 2 "" H 4000 3300 60  0000 C CNN
F 3 "" H 4000 3300 60  0000 C CNN
	1    4000 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3300 4000 3050
Wire Wire Line
	4000 2650 4350 2650
Connection ~ 4000 2650
Text Label 4050 2650 0    60   ~ 0
V_READ
$Comp
L Conn_01x12 J?
U 1 1 5A930804
P 11150 8150
F 0 "J?" H 11150 8750 50  0000 C CNN
F 1 "Conn_01x12" H 11150 7450 50  0000 C CNN
F 2 "" H 11150 8150 50  0001 C CNN
F 3 "" H 11150 8150 50  0001 C CNN
	1    11150 8150
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x19 J?
U 1 1 5A930887
P 6050 8150
F 0 "J?" H 6050 9150 50  0000 C CNN
F 1 "Conn_01x19" H 6050 7150 50  0000 C CNN
F 2 "" H 6050 8150 50  0001 C CNN
F 3 "" H 6050 8150 50  0001 C CNN
	1    6050 8150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 6650 7400 6650
Wire Wire Line
	7400 6650 7400 7250
Wire Wire Line
	7400 7250 6250 7250
Wire Wire Line
	7750 6800 7450 6800
Wire Wire Line
	7450 6800 7450 7350
Wire Wire Line
	7450 7350 6250 7350
Wire Wire Line
	7750 7000 7500 7000
Wire Wire Line
	7500 7000 7500 7450
Wire Wire Line
	7500 7450 6250 7450
Wire Wire Line
	7750 7250 7550 7250
Wire Wire Line
	7550 7250 7550 7550
Wire Wire Line
	7550 7550 6250 7550
Wire Wire Line
	7750 7450 7600 7450
Wire Wire Line
	7600 7450 7600 7650
Wire Wire Line
	7600 7650 6250 7650
Wire Wire Line
	7750 7650 7650 7650
Wire Wire Line
	7650 7650 7650 7750
Wire Wire Line
	7650 7750 6250 7750
Wire Wire Line
	7750 7850 6250 7850
Wire Wire Line
	7750 8100 7650 8100
Wire Wire Line
	7650 8100 7650 7950
Wire Wire Line
	7650 7950 6250 7950
Wire Wire Line
	7600 8050 7600 8300
Wire Wire Line
	7600 8050 6250 8050
Wire Wire Line
	7600 8300 7750 8300
Wire Wire Line
	9650 8150 9650 8700
Wire Wire Line
	9650 8700 7550 8700
Wire Wire Line
	7550 8700 7550 8150
Wire Wire Line
	7550 8150 6250 8150
Wire Wire Line
	9700 7950 9700 8750
Wire Wire Line
	9700 8750 7500 8750
Wire Wire Line
	7500 8750 7500 8250
Wire Wire Line
	7500 8250 6250 8250
Wire Wire Line
	9700 7950 9650 7950
Wire Wire Line
	9650 7750 9750 7750
Wire Wire Line
	9750 7750 9750 8800
Wire Wire Line
	9750 8800 7450 8800
Wire Wire Line
	7450 8800 7450 8350
Wire Wire Line
	7450 8350 6250 8350
Wire Wire Line
	9650 7550 9800 7550
Wire Wire Line
	9800 7550 9800 8850
Wire Wire Line
	9800 8850 7400 8850
Wire Wire Line
	7400 8850 7400 8450
Wire Wire Line
	7400 8450 6250 8450
Wire Wire Line
	6250 8550 7350 8550
Wire Wire Line
	7350 8550 7350 8900
Wire Wire Line
	7350 8900 9850 8900
Wire Wire Line
	9850 8900 9850 7300
Wire Wire Line
	9850 7300 9650 7300
Wire Wire Line
	9650 7100 9900 7100
Wire Wire Line
	9900 7100 9900 8950
Wire Wire Line
	9900 8950 7300 8950
Wire Wire Line
	7300 8950 7300 8650
Wire Wire Line
	7300 8650 6250 8650
Wire Wire Line
	9650 6900 9950 6900
Wire Wire Line
	9950 6900 9950 9000
Wire Wire Line
	9950 9000 7250 9000
Wire Wire Line
	7250 9000 7250 8750
Wire Wire Line
	7250 8750 6250 8750
Wire Wire Line
	6250 8850 7200 8850
Wire Wire Line
	7200 8850 7200 9050
Wire Wire Line
	7200 9050 10000 9050
Wire Wire Line
	10000 9050 10000 6700
Wire Wire Line
	10000 6700 9650 6700
Wire Wire Line
	9650 6450 10050 6450
Wire Wire Line
	10050 6450 10050 9100
Wire Wire Line
	10050 9100 7150 9100
Wire Wire Line
	7150 9100 7150 8950
Wire Wire Line
	7150 8950 6250 8950
Wire Wire Line
	6250 9050 7100 9050
Wire Wire Line
	7100 9050 7100 9150
Wire Wire Line
	7100 9150 10100 9150
Wire Wire Line
	10100 9150 10100 6350
Wire Wire Line
	10100 6350 9650 6350
Wire Wire Line
	9650 7650 10950 7650
Wire Wire Line
	9650 7850 10150 7850
Wire Wire Line
	10150 7850 10150 7750
Wire Wire Line
	10150 7750 10950 7750
Wire Wire Line
	9650 8050 10200 8050
Wire Wire Line
	10200 8050 10200 7850
Wire Wire Line
	10200 7850 10950 7850
Wire Wire Line
	7750 8400 7650 8400
Wire Wire Line
	7650 8400 7650 9200
Wire Wire Line
	7650 9200 10250 9200
Wire Wire Line
	10250 9200 10250 7950
Wire Wire Line
	10250 7950 10950 7950
Wire Wire Line
	7750 8200 7050 8200
Wire Wire Line
	7050 8200 7050 9250
Wire Wire Line
	7050 9250 10300 9250
Wire Wire Line
	10300 9250 10300 8050
Wire Wire Line
	10300 8050 10950 8050
Wire Wire Line
	10950 8150 10350 8150
Wire Wire Line
	10350 8150 10350 9300
Wire Wire Line
	10350 9300 7000 9300
Wire Wire Line
	7000 9300 7000 8000
Wire Wire Line
	7000 8000 7700 8000
Wire Wire Line
	7700 8000 7700 7950
Wire Wire Line
	7700 7950 7750 7950
Wire Wire Line
	7750 7750 7700 7750
Wire Wire Line
	7700 7750 7700 7800
Wire Wire Line
	7700 7800 6950 7800
Wire Wire Line
	6950 7800 6950 9350
Wire Wire Line
	6950 9350 10400 9350
Wire Wire Line
	10400 9350 10400 8250
Wire Wire Line
	10400 8250 10950 8250
Wire Wire Line
	7750 7550 7700 7550
Wire Wire Line
	7700 7550 7700 7600
Wire Wire Line
	7700 7600 6900 7600
Wire Wire Line
	6900 7600 6900 9400
Wire Wire Line
	6900 9400 10450 9400
Wire Wire Line
	10450 9400 10450 8350
Wire Wire Line
	10450 8350 10950 8350
Wire Wire Line
	10950 8450 10500 8450
Wire Wire Line
	10500 8450 10500 9450
Wire Wire Line
	10500 9450 6850 9450
Wire Wire Line
	6850 9450 6850 7400
Wire Wire Line
	6850 7400 7700 7400
Wire Wire Line
	7700 7400 7700 7350
Wire Wire Line
	7700 7350 7750 7350
Wire Wire Line
	7750 7100 6800 7100
Wire Wire Line
	6800 7100 6800 9500
Wire Wire Line
	6800 9500 10550 9500
Wire Wire Line
	10550 9500 10550 8550
Wire Wire Line
	10550 8550 10950 8550
Wire Wire Line
	10950 8650 10600 8650
Wire Wire Line
	10600 8650 10600 9550
Wire Wire Line
	10600 9550 6750 9550
Wire Wire Line
	6750 9550 6750 6900
Wire Wire Line
	6750 6900 7750 6900
Wire Wire Line
	7750 6550 6700 6550
Wire Wire Line
	6700 6550 6700 9600
Wire Wire Line
	6700 9600 10650 9600
Wire Wire Line
	10650 9600 10650 8750
Wire Wire Line
	10650 8750 10950 8750
$EndSCHEMATC
