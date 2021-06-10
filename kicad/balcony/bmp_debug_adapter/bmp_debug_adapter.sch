EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 60C0631C
P 2450 1900
F 0 "J1" H 2500 2317 50  0000 C CNN
F 1 "ST12_DEBUG" H 2500 2226 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm_SMD" H 2450 1900 50  0001 C CNN
F 3 "~" H 2450 1900 50  0001 C CNN
	1    2450 1900
	1    0    0    -1  
$EndComp
Text Label 2250 1700 2    50   ~ 0
~RST~
NoConn ~ 2250 1800
$Comp
L power:GND #PWR01
U 1 1 60C06A2D
P 2250 1900
F 0 "#PWR01" H 2250 1650 50  0001 C CNN
F 1 "GND" V 2255 1772 50  0000 R CNN
F 2 "" H 2250 1900 50  0001 C CNN
F 3 "" H 2250 1900 50  0001 C CNN
	1    2250 1900
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 60C0712F
P 2250 2000
F 0 "#PWR02" H 2250 1850 50  0001 C CNN
F 1 "+3.3V" V 2265 2128 50  0000 L CNN
F 2 "" H 2250 2000 50  0001 C CNN
F 3 "" H 2250 2000 50  0001 C CNN
	1    2250 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 60C0788B
P 2250 2100
F 0 "#PWR03" H 2250 1950 50  0001 C CNN
F 1 "+5V" V 2265 2228 50  0000 L CNN
F 2 "" H 2250 2100 50  0001 C CNN
F 3 "" H 2250 2100 50  0001 C CNN
	1    2250 2100
	0    -1   -1   0   
$EndComp
Text Label 2750 1700 0    50   ~ 0
SWCLK
Text Label 2750 1800 0    50   ~ 0
SWDIO
$Comp
L power:GND #PWR04
U 1 1 60C0828A
P 2750 1900
F 0 "#PWR04" H 2750 1650 50  0001 C CNN
F 1 "GND" V 2755 1772 50  0000 R CNN
F 2 "" H 2750 1900 50  0001 C CNN
F 3 "" H 2750 1900 50  0001 C CNN
	1    2750 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 60C08858
P 2750 2000
F 0 "#PWR05" H 2750 1850 50  0001 C CNN
F 1 "+3.3V" V 2765 2128 50  0000 L CNN
F 2 "" H 2750 2000 50  0001 C CNN
F 3 "" H 2750 2000 50  0001 C CNN
	1    2750 2000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 60C0904F
P 2750 2100
F 0 "#PWR06" H 2750 1950 50  0001 C CNN
F 1 "+5V" V 2765 2228 50  0000 L CNN
F 2 "" H 2750 2100 50  0001 C CNN
F 3 "" H 2750 2100 50  0001 C CNN
	1    2750 2100
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 60C0961A
P 4400 1900
F 0 "J2" H 4450 2317 50  0000 C CNN
F 1 "BMP_DEBUG" H 4450 2226 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 4400 1900 50  0001 C CNN
F 3 "~" H 4400 1900 50  0001 C CNN
	1    4400 1900
	1    0    0    -1  
$EndComp
Text Label 4200 1700 2    50   ~ 0
RST
Text Label 4200 1800 2    50   ~ 0
TDI
Text Label 4200 1900 2    50   ~ 0
TDO
Text Label 4200 2000 2    50   ~ 0
TCK
Text Label 4200 2100 2    50   ~ 0
TMS
NoConn ~ 4700 1800
$Comp
L power:GND #PWR08
U 1 1 60C0A5F3
P 5050 1700
F 0 "#PWR08" H 5050 1450 50  0001 C CNN
F 1 "GND" V 5055 1572 50  0000 R CNN
F 2 "" H 5050 1700 50  0001 C CNN
F 3 "" H 5050 1700 50  0001 C CNN
	1    5050 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 1700 4850 1700
Wire Wire Line
	4700 1900 4850 1900
Wire Wire Line
	4850 1900 4850 1700
Connection ~ 4850 1700
Wire Wire Line
	4850 1700 5050 1700
Wire Wire Line
	4700 2000 4850 2000
Wire Wire Line
	4850 2000 4850 1900
Connection ~ 4850 1900
Text Label 4700 2100 0    50   ~ 0
TPWR
Wire Wire Line
	3250 900  3850 900 
Wire Wire Line
	3250 1000 3850 1000
Wire Wire Line
	3250 1100 3850 1100
Wire Wire Line
	3250 1200 3850 1200
Text Label 3250 900  2    50   ~ 0
~RST~
Text Label 3850 900  0    50   ~ 0
RST
Text Label 3250 1000 2    50   ~ 0
SWCLK
Text Label 3850 1000 0    50   ~ 0
TCK
Text Label 3250 1100 2    50   ~ 0
SWDIO
Text Label 3850 1100 0    50   ~ 0
TMS
Text Label 3850 1200 0    50   ~ 0
TPWR
$Comp
L power:+3.3V #PWR07
U 1 1 60C0C1F9
P 3250 1200
F 0 "#PWR07" H 3250 1050 50  0001 C CNN
F 1 "+3.3V" V 3265 1328 50  0000 L CNN
F 2 "" H 3250 1200 50  0001 C CNN
F 3 "" H 3250 1200 50  0001 C CNN
	1    3250 1200
	0    -1   -1   0   
$EndComp
NoConn ~ 4200 1800
NoConn ~ 4200 1900
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60C0D094
P 2250 2100
F 0 "#FLG0101" H 2250 2175 50  0001 C CNN
F 1 "PWR_FLAG" H 2250 2273 50  0001 C CNN
F 2 "" H 2250 2100 50  0001 C CNN
F 3 "~" H 2250 2100 50  0001 C CNN
	1    2250 2100
	-1   0    0    1   
$EndComp
Connection ~ 2250 2100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 60C0D769
P 2750 2000
F 0 "#FLG0102" H 2750 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 2173 50  0001 C CNN
F 2 "" H 2750 2000 50  0001 C CNN
F 3 "~" H 2750 2000 50  0001 C CNN
	1    2750 2000
	-1   0    0    1   
$EndComp
Connection ~ 2750 2100
Connection ~ 2750 2000
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 60C0DD61
P 2250 1900
F 0 "#FLG0103" H 2250 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 2250 2073 50  0001 C CNN
F 2 "" H 2250 1900 50  0001 C CNN
F 3 "~" H 2250 1900 50  0001 C CNN
	1    2250 1900
	-1   0    0    1   
$EndComp
Connection ~ 2250 1900
$EndSCHEMATC
