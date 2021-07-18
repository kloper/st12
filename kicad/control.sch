EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "T12 Soldering Station"
Date "2021-05-16"
Rev "20210516"
Comp ""
Comment1 "dimitry.kloper@gmail.com"
Comment2 "Dimitry Kloper"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J301
U 1 1 60B22F1C
P 1700 1300
F 0 "J301" H 1750 1717 50  0000 C CNN
F 1 "DEBUG" H 1750 1626 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm_SMD" H 1700 1300 50  0001 C CNN
F 3 "~" H 1700 1300 50  0001 C CNN
	1    1700 1300
	1    0    0    -1  
$EndComp
Text Label 1500 1100 2    50   ~ 0
~RST~
$Comp
L power:GND #PWR0304
U 1 1 60B23FAB
P 1500 1300
F 0 "#PWR0304" H 1500 1050 50  0001 C CNN
F 1 "GND" V 1505 1172 50  0000 R CNN
F 2 "" H 1500 1300 50  0001 C CNN
F 3 "" H 1500 1300 50  0001 C CNN
	1    1500 1300
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0305
U 1 1 60B24313
P 1500 1400
F 0 "#PWR0305" H 1500 1250 50  0001 C CNN
F 1 "+3.3V" V 1515 1528 50  0000 L CNN
F 2 "" H 1500 1400 50  0001 C CNN
F 3 "" H 1500 1400 50  0001 C CNN
	1    1500 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0306
U 1 1 60B24D59
P 1500 1500
F 0 "#PWR0306" H 1500 1350 50  0001 C CNN
F 1 "+5V" V 1515 1628 50  0000 L CNN
F 2 "" H 1500 1500 50  0001 C CNN
F 3 "" H 1500 1500 50  0001 C CNN
	1    1500 1500
	0    -1   -1   0   
$EndComp
Text Label 2000 1100 0    50   ~ 0
SWCLK
Text Label 2000 1200 0    50   ~ 0
SWDIO
$Comp
L power:GND #PWR0307
U 1 1 60B252B2
P 2000 1300
F 0 "#PWR0307" H 2000 1050 50  0001 C CNN
F 1 "GND" V 2005 1172 50  0000 R CNN
F 2 "" H 2000 1300 50  0001 C CNN
F 3 "" H 2000 1300 50  0001 C CNN
	1    2000 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0308
U 1 1 60B25736
P 2000 1400
F 0 "#PWR0308" H 2000 1250 50  0001 C CNN
F 1 "+3.3V" V 2015 1528 50  0000 L CNN
F 2 "" H 2000 1400 50  0001 C CNN
F 3 "" H 2000 1400 50  0001 C CNN
	1    2000 1400
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0309
U 1 1 60B25B47
P 2000 1500
F 0 "#PWR0309" H 2000 1350 50  0001 C CNN
F 1 "+5V" V 2015 1628 50  0000 L CNN
F 2 "" H 2000 1500 50  0001 C CNN
F 3 "" H 2000 1500 50  0001 C CNN
	1    2000 1500
	0    1    1    0   
$EndComp
NoConn ~ 1500 1200
$Comp
L Device:Rotary_Encoder_Switch SW301
U 1 1 60B2EC73
P 1850 3100
F 0 "SW301" H 1850 3375 50  0000 C CNN
F 1 "Encoder" H 1850 3376 50  0001 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 1700 3260 50  0001 C CNN
F 3 "~" H 1850 3360 50  0001 C CNN
	1    1850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3200 2150 3200
Wire Wire Line
	1500 3100 1550 3100
$Comp
L Device:R R302
U 1 1 60B310D9
P 1050 2750
F 0 "R302" H 1120 2796 50  0000 L CNN
F 1 "7.5K" H 1120 2705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 980 2750 50  0001 C CNN
F 3 "~" H 1050 2750 50  0001 C CNN
	1    1050 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R304
U 1 1 60B318D2
P 1350 2750
F 0 "R304" H 1420 2796 50  0000 L CNN
F 1 "7.5K" H 1420 2705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1280 2750 50  0001 C CNN
F 3 "~" H 1350 2750 50  0001 C CNN
	1    1350 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R306
U 1 1 60B31C11
P 2250 2750
F 0 "R306" H 2320 2796 50  0000 L CNN
F 1 "7.5K" H 2320 2705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2180 2750 50  0001 C CNN
F 3 "~" H 2250 2750 50  0001 C CNN
	1    2250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2600 1050 2550
Wire Wire Line
	1050 2550 1350 2550
Wire Wire Line
	2250 2550 2250 2600
Wire Wire Line
	1350 2600 1350 2550
Connection ~ 1350 2550
Wire Wire Line
	1350 2550 2250 2550
Wire Wire Line
	1550 3000 1350 3000
Wire Wire Line
	1350 3000 1350 2900
Wire Wire Line
	1550 3200 1050 3200
Wire Wire Line
	1050 3200 1050 2900
Wire Wire Line
	2150 3000 2250 3000
Wire Wire Line
	2250 3000 2250 2900
Text Label 1350 3000 2    50   ~ 0
ROTA
Text Label 1050 3200 2    50   ~ 0
ROTB
Text Label 2250 3000 0    50   ~ 0
ROTP
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J302
U 1 1 60B355C6
P 3250 2900
F 0 "J302" H 3420 2690 50  0000 L CNN
F 1 "ROT_OUT" H 3430 2600 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm_SMD" H 3250 2900 50  0001 C CNN
F 3 "~" H 3250 2900 50  0001 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
Text Label 3050 2800 2    50   ~ 0
ROTA
Text Label 3050 2900 2    50   ~ 0
ROTB
Text Label 3050 3000 2    50   ~ 0
ROTP
$Comp
L Memory_EEPROM:24LC1025 U301
U 1 1 60C4DB85
P 2000 4900
F 0 "U301" H 2150 5250 50  0000 C CNN
F 1 "24LC1025" H 2300 5150 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 2000 4900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21941B.pdf" H 2000 4900 50  0001 C CNN
	1    2000 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0310
U 1 1 60C4F7AA
P 2000 4600
F 0 "#PWR0310" H 2000 4450 50  0001 C CNN
F 1 "+3.3V" H 2015 4773 50  0000 C CNN
F 2 "" H 2000 4600 50  0001 C CNN
F 3 "" H 2000 4600 50  0001 C CNN
	1    2000 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0311
U 1 1 60C4FD69
P 2000 5200
F 0 "#PWR0311" H 2000 4950 50  0001 C CNN
F 1 "GND" H 2005 5027 50  0000 C CNN
F 2 "" H 2000 5200 50  0001 C CNN
F 3 "" H 2000 5200 50  0001 C CNN
	1    2000 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R305
U 1 1 60C51855
P 1350 4550
F 0 "R305" H 1420 4596 50  0000 L CNN
F 1 "7.5K" H 1420 4505 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1280 4550 50  0001 C CNN
F 3 "~" H 1350 4550 50  0001 C CNN
	1    1350 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R303
U 1 1 60C52C0C
P 1150 5150
F 0 "R303" H 1220 5196 50  0000 L CNN
F 1 "7.5K" H 1220 5105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1080 5150 50  0001 C CNN
F 3 "~" H 1150 5150 50  0001 C CNN
	1    1150 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R301
U 1 1 60C536F7
P 850 5150
F 0 "R301" H 920 5196 50  0000 L CNN
F 1 "7.5K" H 920 5105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 780 5150 50  0001 C CNN
F 3 "~" H 850 5150 50  0001 C CNN
	1    850  5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R307
U 1 1 60C53AE0
P 2550 5200
F 0 "R307" H 2620 5246 50  0000 L CNN
F 1 "7.5K" H 2620 5155 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2480 5200 50  0001 C CNN
F 3 "~" H 2550 5200 50  0001 C CNN
	1    2550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R308
U 1 1 60C54152
P 2950 4500
F 0 "R308" H 3020 4546 50  0000 L CNN
F 1 "7.5K" H 3020 4455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 4500 50  0001 C CNN
F 3 "~" H 2950 4500 50  0001 C CNN
	1    2950 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R309
U 1 1 60C545A2
P 3250 4500
F 0 "R309" H 3320 4546 50  0000 L CNN
F 1 "7.5K" H 3320 4455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3180 4500 50  0001 C CNN
F 3 "~" H 3250 4500 50  0001 C CNN
	1    3250 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0301
U 1 1 60C5492E
P 850 5300
F 0 "#PWR0301" H 850 5050 50  0001 C CNN
F 1 "GND" H 855 5127 50  0000 C CNN
F 2 "" H 850 5300 50  0001 C CNN
F 3 "" H 850 5300 50  0001 C CNN
	1    850  5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0302
U 1 1 60C54BD2
P 1150 5300
F 0 "#PWR0302" H 1150 5050 50  0001 C CNN
F 1 "GND" H 1155 5127 50  0000 C CNN
F 2 "" H 1150 5300 50  0001 C CNN
F 3 "" H 1150 5300 50  0001 C CNN
	1    1150 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0312
U 1 1 60C551F1
P 2550 5350
F 0 "#PWR0312" H 2550 5100 50  0001 C CNN
F 1 "GND" H 2555 5177 50  0000 C CNN
F 2 "" H 2550 5350 50  0001 C CNN
F 3 "" H 2550 5350 50  0001 C CNN
	1    2550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0303
U 1 1 60C55651
P 1350 4400
F 0 "#PWR0303" H 1350 4250 50  0001 C CNN
F 1 "+3.3V" H 1365 4573 50  0000 C CNN
F 2 "" H 1350 4400 50  0001 C CNN
F 3 "" H 1350 4400 50  0001 C CNN
	1    1350 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0313
U 1 1 60C56D8A
P 2950 4350
F 0 "#PWR0313" H 2950 4200 50  0001 C CNN
F 1 "+3.3V" H 2965 4523 50  0000 C CNN
F 2 "" H 2950 4350 50  0001 C CNN
F 3 "" H 2950 4350 50  0001 C CNN
	1    2950 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0314
U 1 1 60C571DD
P 3250 4350
F 0 "#PWR0314" H 3250 4200 50  0001 C CNN
F 1 "+3.3V" H 3265 4523 50  0000 C CNN
F 2 "" H 3250 4350 50  0001 C CNN
F 3 "" H 3250 4350 50  0001 C CNN
	1    3250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4800 2950 4800
Wire Wire Line
	2950 4800 2950 4650
Wire Wire Line
	2400 4900 3250 4900
Wire Wire Line
	3250 4900 3250 4650
Text Label 2700 4800 2    50   ~ 0
SDA
Text Label 2700 4900 2    50   ~ 0
SCL
Wire Wire Line
	2400 5000 2550 5000
Wire Wire Line
	2550 5000 2550 5050
Wire Wire Line
	1350 4700 1350 5000
Wire Wire Line
	1350 5000 1600 5000
Wire Wire Line
	1150 5000 1150 4900
Wire Wire Line
	1150 4900 1600 4900
Wire Wire Line
	850  5000 850  4800
Wire Wire Line
	850  4800 1600 4800
Text Label 1750 2550 2    50   ~ 0
ROT_VCC
Text Label 3550 2800 0    50   ~ 0
ROT_VCC
Text Label 2250 3200 0    50   ~ 0
ROT_GND
Text Label 3550 3000 0    50   ~ 0
ROT_GND
Text Label 1500 3100 2    50   ~ 0
ROT_GND
$Comp
L power:+3.3V #PWR0323
U 1 1 60C62441
P 10150 2100
F 0 "#PWR0323" H 10150 1950 50  0001 C CNN
F 1 "+3.3V" H 10165 2273 50  0000 C CNN
F 2 "" H 10150 2100 50  0001 C CNN
F 3 "" H 10150 2100 50  0001 C CNN
	1    10150 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0324
U 1 1 60C61EB7
P 10150 2300
F 0 "#PWR0324" H 10150 2050 50  0001 C CNN
F 1 "GND" H 10155 2127 50  0000 C CNN
F 2 "" H 10150 2300 50  0001 C CNN
F 3 "" H 10150 2300 50  0001 C CNN
	1    10150 2300
	1    0    0    -1  
$EndComp
NoConn ~ 7900 2700
Wire Wire Line
	9350 950  9600 950 
Connection ~ 9350 950 
$Comp
L power:+3.3V #PWR0321
U 1 1 60B3FFCF
P 9350 950
F 0 "#PWR0321" H 9350 800 50  0001 C CNN
F 1 "+3.3V" H 9365 1123 50  0000 C CNN
F 2 "" H 9350 950 50  0001 C CNN
F 3 "" H 9350 950 50  0001 C CNN
	1    9350 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1300 9600 1300
Connection ~ 9350 1300
Wire Wire Line
	9350 1350 9350 1300
Wire Wire Line
	9050 1300 9350 1300
$Comp
L power:GND #PWR0322
U 1 1 60B3E6ED
P 9350 1350
F 0 "#PWR0322" H 9350 1100 50  0001 C CNN
F 1 "GND" H 9355 1177 50  0000 C CNN
F 2 "" H 9350 1350 50  0001 C CNN
F 3 "" H 9350 1350 50  0001 C CNN
	1    9350 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C306
U 1 1 60B396B4
P 9050 1150
F 0 "C306" H 9165 1196 50  0000 L CNN
F 1 "100nF" H 9165 1105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9088 1000 50  0001 C CNN
F 3 "~" H 9050 1150 50  0001 C CNN
	1    9050 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C307
U 1 1 60B39F75
P 9600 1150
F 0 "C307" H 9718 1196 50  0000 L CNN
F 1 "4.7uF" H 9718 1105 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9638 1000 50  0001 C CNN
F 3 "~" H 9600 1150 50  0001 C CNN
	1    9600 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 950  9600 1000
Wire Wire Line
	9050 950  9350 950 
Wire Wire Line
	9050 1000 9050 950 
Wire Wire Line
	7900 1800 7800 1800
$Comp
L power:GND #PWR0318
U 1 1 60B38B98
P 7800 1800
F 0 "#PWR0318" H 7800 1550 50  0001 C CNN
F 1 "GND" H 7805 1627 50  0000 C CNN
F 2 "" H 7800 1800 50  0001 C CNN
F 3 "" H 7800 1800 50  0001 C CNN
	1    7800 1800
	1    0    0    -1  
$EndComp
Text Label 9600 2300 2    50   ~ 0
ROTP_IN
Text Label 9600 2200 2    50   ~ 0
ROTB_IN
Text Label 9600 2100 2    50   ~ 0
ROTA_IN
Wire Wire Line
	9650 2300 8900 2300
Wire Wire Line
	9650 2200 8900 2200
Wire Wire Line
	9650 2100 8900 2100
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J304
U 1 1 60B36947
P 9850 2200
F 0 "J304" H 9700 1900 50  0000 L CNN
F 1 "ROT_IN" H 9700 2000 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm_SMD" H 9850 2200 50  0001 C CNN
F 3 "~" H 9850 2200 50  0001 C CNN
	1    9850 2200
	1    0    0    -1  
$EndComp
Text GLabel 8900 2000 2    50   Output ~ 0
HEATER_CTL
Text GLabel 8900 1900 2    50   Input ~ 0
COLD_SENSE
Text GLabel 8900 1800 2    50   Input ~ 0
SHAKE_SENSE
Text GLabel 8900 1700 2    50   Input ~ 0
T_SENSE
Text GLabel 8900 1600 2    50   Input ~ 0
I_SENSE
Text Label 8900 2500 0    50   ~ 0
SDA
Text Label 8900 2400 0    50   ~ 0
SCL
Text Label 8900 2700 0    50   ~ 0
SWCLK
Text Label 8900 2600 0    50   ~ 0
SWDIO
Text Label 7900 1600 2    50   ~ 0
~RST~
Wire Wire Line
	6800 2450 6800 2600
Connection ~ 6800 2450
Wire Wire Line
	6700 2450 6800 2450
Wire Wire Line
	6800 2600 6900 2600
Wire Wire Line
	6800 2300 6800 2450
Wire Wire Line
	6900 2300 6800 2300
$Comp
L power:GND #PWR0317
U 1 1 60B2A929
P 6700 2450
F 0 "#PWR0317" H 6700 2200 50  0001 C CNN
F 1 "GND" H 6705 2277 50  0000 C CNN
F 2 "" H 6700 2450 50  0001 C CNN
F 3 "" H 6700 2450 50  0001 C CNN
	1    6700 2450
	1    0    0    -1  
$EndComp
Connection ~ 7650 2300
Wire Wire Line
	7200 2300 7650 2300
Connection ~ 7650 2600
Wire Wire Line
	7650 2600 7200 2600
Wire Wire Line
	7850 2600 7650 2600
Wire Wire Line
	7850 2500 7850 2600
Wire Wire Line
	7900 2500 7850 2500
Wire Wire Line
	7850 2400 7900 2400
Wire Wire Line
	7850 2300 7850 2400
Wire Wire Line
	7650 2300 7850 2300
$Comp
L Device:C C305
U 1 1 60B286EF
P 7050 2600
F 0 "C305" V 7200 2700 50  0000 C CNN
F 1 "22pF" V 7150 2450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7088 2450 50  0001 C CNN
F 3 "~" H 7050 2600 50  0001 C CNN
	1    7050 2600
	0    1    1    0   
$EndComp
$Comp
L Device:C C304
U 1 1 60B2802D
P 7050 2300
F 0 "C304" V 6900 2400 50  0000 C CNN
F 1 "22pF" V 6900 2150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7088 2150 50  0001 C CNN
F 3 "~" H 7050 2300 50  0001 C CNN
	1    7050 2300
	0    1    1    0   
$EndComp
$Comp
L Device:Crystal Y301
U 1 1 60B26F4F
P 7650 2450
F 0 "Y301" V 7750 2200 50  0000 L CNN
F 1 "MA-506-8MHz" V 7850 2100 50  0000 L CNN
F 2 "XTAL-MA-505:XTAL_MA-506_4.0000M-C3_ROHS" H 7650 2450 50  0001 C CNN
F 3 "~" H 7650 2450 50  0001 C CNN
	1    7650 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 2900 8400 3000
$Comp
L power:GND #PWR0320
U 1 1 60B266D9
P 8400 3000
F 0 "#PWR0320" H 8400 2750 50  0001 C CNN
F 1 "GND" H 8405 2827 50  0000 C CNN
F 2 "" H 8400 3000 50  0001 C CNN
F 3 "" H 8400 3000 50  0001 C CNN
	1    8400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1350 8400 1300
Connection ~ 8400 1350
Wire Wire Line
	8500 1350 8400 1350
Wire Wire Line
	8500 1400 8500 1350
Wire Wire Line
	8400 1400 8400 1350
$Comp
L power:+3.3V #PWR0319
U 1 1 60B25EAC
P 8400 1300
F 0 "#PWR0319" H 8400 1150 50  0001 C CNN
F 1 "+3.3V" H 8415 1473 50  0000 C CNN
F 2 "" H 8400 1300 50  0001 C CNN
F 3 "" H 8400 1300 50  0001 C CNN
	1    8400 1300
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F0:STM32F030F4Px U?
U 1 1 60B20C2E
P 8400 2100
AR Path="/60B20C2E" Ref="U?"  Part="1" 
AR Path="/60B20B39/60B20C2E" Ref="U302"  Part="1" 
F 0 "U302" H 8650 1200 50  0000 C CNN
F 1 "STM32F030F4Px" H 8900 1300 50  0000 C CNN
F 2 "Housings_SSOP:TSSOP-20_4.4x6.5mm_Pitch0.65mm" H 8000 1400 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00088500.pdf" H 8400 2100 50  0001 C CNN
	1    8400 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C303
U 1 1 60CED4C7
P 2250 3550
F 0 "C303" H 2365 3596 50  0000 L CNN
F 1 "100nF" H 2365 3505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2288 3400 50  0001 C CNN
F 3 "~" H 2250 3550 50  0001 C CNN
	1    2250 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3400 2250 3300
Wire Wire Line
	2250 3300 2500 3300
Wire Wire Line
	2500 3300 2500 3000
Wire Wire Line
	2500 3000 2250 3000
Connection ~ 2250 3000
Wire Wire Line
	2250 3750 2250 3700
NoConn ~ 10150 2200
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J303
U 1 1 60A83A32
P 3700 1300
F 0 "J303" H 3750 1617 50  0000 C CNN
F 1 "DISPLAY" H 3750 1526 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 3700 1300 50  0001 C CNN
F 3 "~" H 3700 1300 50  0001 C CNN
	1    3700 1300
	1    0    0    -1  
$EndComp
Text Label 4000 1300 0    50   ~ 0
SDA
Text Label 3500 1300 2    50   ~ 0
SCL
$Comp
L power:+5V #PWR0315
U 1 1 60A87E82
P 4000 1200
F 0 "#PWR0315" H 4000 1050 50  0001 C CNN
F 1 "+5V" H 4015 1373 50  0000 C CNN
F 2 "" H 4000 1200 50  0001 C CNN
F 3 "" H 4000 1200 50  0001 C CNN
	1    4000 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0316
U 1 1 60A88994
P 4000 1400
F 0 "#PWR0316" H 4000 1150 50  0001 C CNN
F 1 "GND" H 4005 1227 50  0000 C CNN
F 2 "" H 4000 1400 50  0001 C CNN
F 3 "" H 4000 1400 50  0001 C CNN
	1    4000 1400
	1    0    0    -1  
$EndComp
NoConn ~ 3500 1200
NoConn ~ 3500 1400
NoConn ~ 3550 2900
NoConn ~ 3800 3660
Text Label 2250 3750 2    50   ~ 0
ROT_GND
$EndSCHEMATC
