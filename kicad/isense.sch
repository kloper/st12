EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Current Sensor Balcony for ST12"
Date "2021-06-08"
Rev "20210806"
Comp ""
Comment1 "Dimitry Kloper"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L st12-rescue:OPA237NA_250-OPA237NA_250 U401
U 1 1 60BE946A
P 3450 3550
F 0 "U401" H 3450 4120 50  0000 C CNN
F 1 "OPA237NA_250" H 3450 4029 50  0000 C CNN
F 2 "OPA237NA:SOT95P280X145-5N" H 3450 3550 50  0001 L BNN
F 3 "" H 3450 3550 50  0001 L BNN
	1    3450 3550
	1    0    0    -1  
$EndComp
$Comp
L st12-rescue:OPA237NA_250-OPA237NA_250 U402
U 1 1 60BE9D2E
P 6600 3550
F 0 "U402" H 6600 4120 50  0000 C CNN
F 1 "OPA237NA_250" H 6600 4029 50  0000 C CNN
F 2 "OPA237NA:SOT95P280X145-5N" H 6600 3550 50  0001 L BNN
F 3 "" H 6600 3550 50  0001 L BNN
	1    6600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3550 2750 4050
$Comp
L Device:R R401
U 1 1 60BEAB6E
P 1850 3200
F 0 "R401" H 1920 3246 50  0000 L CNN
F 1 "7.5K" H 1920 3155 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1780 3200 50  0001 C CNN
F 3 "~" H 1850 3200 50  0001 C CNN
	1    1850 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R402
U 1 1 60BEB0E9
P 1850 3650
F 0 "R402" H 1920 3696 50  0000 L CNN
F 1 "7.5K" H 1920 3605 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1780 3650 50  0001 C CNN
F 3 "~" H 1850 3650 50  0001 C CNN
	1    1850 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0402
U 1 1 60BEB676
P 1850 3900
F 0 "#PWR0402" H 1850 3650 50  0001 C CNN
F 1 "GND" H 1855 3727 50  0000 C CNN
F 2 "" H 1850 3900 50  0001 C CNN
F 3 "" H 1850 3900 50  0001 C CNN
	1    1850 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0401
U 1 1 60BEBB07
P 1850 2950
F 0 "#PWR0401" H 1850 2800 50  0001 C CNN
F 1 "+5V" H 1865 3123 50  0000 C CNN
F 2 "" H 1850 2950 50  0001 C CNN
F 3 "" H 1850 2950 50  0001 C CNN
	1    1850 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2950 1850 3050
Wire Wire Line
	1850 3350 1850 3450
Wire Wire Line
	2750 3450 1850 3450
Connection ~ 1850 3450
Wire Wire Line
	1850 3450 1850 3500
Wire Wire Line
	4500 3450 4500 4050
Wire Wire Line
	2750 4050 4500 4050
$Comp
L power:GND #PWR0404
U 1 1 60BEC477
P 4150 3850
F 0 "#PWR0404" H 4150 3600 50  0001 C CNN
F 1 "GND" H 4155 3677 50  0000 C CNN
F 2 "" H 4150 3850 50  0001 C CNN
F 3 "" H 4150 3850 50  0001 C CNN
	1    4150 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0403
U 1 1 60BECB92
P 4150 3250
F 0 "#PWR0403" H 4150 3100 50  0001 C CNN
F 1 "+5V" H 4165 3423 50  0000 C CNN
F 2 "" H 4150 3250 50  0001 C CNN
F 3 "" H 4150 3250 50  0001 C CNN
	1    4150 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R403
U 1 1 60BED1D3
P 5100 3550
F 0 "R403" V 4893 3550 50  0000 C CNN
F 1 "20K" V 4984 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5030 3550 50  0001 C CNN
F 3 "~" H 5100 3550 50  0001 C CNN
	1    5100 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 3450 4500 3450
Wire Wire Line
	7550 3450 7450 3450
$Comp
L Device:R R404
U 1 1 60BEEAEA
P 5000 2450
F 0 "R404" V 4793 2450 50  0000 C CNN
F 1 "20K" V 4884 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4930 2450 50  0001 C CNN
F 3 "~" H 5000 2450 50  0001 C CNN
	1    5000 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R R405
U 1 1 60BEEE7F
P 5300 2750
F 0 "R405" H 5230 2704 50  0000 R CNN
F 1 "470K" H 5230 2795 50  0000 R CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5230 2750 50  0001 C CNN
F 3 "~" H 5300 2750 50  0001 C CNN
	1    5300 2750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0405
U 1 1 60BEF45E
P 5300 2900
F 0 "#PWR0405" H 5300 2650 50  0001 C CNN
F 1 "GND" H 5305 2727 50  0000 C CNN
F 2 "" H 5300 2900 50  0001 C CNN
F 3 "" H 5300 2900 50  0001 C CNN
	1    5300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2600 5300 2450
Wire Wire Line
	5300 2450 5150 2450
Wire Wire Line
	5900 3450 5700 3450
Connection ~ 5300 2450
$Comp
L power:+5V #PWR0406
U 1 1 60BF00E5
P 7300 3250
F 0 "#PWR0406" H 7300 3100 50  0001 C CNN
F 1 "+5V" H 7315 3423 50  0000 C CNN
F 2 "" H 7300 3250 50  0001 C CNN
F 3 "" H 7300 3250 50  0001 C CNN
	1    7300 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0407
U 1 1 60BF0647
P 7300 3850
F 0 "#PWR0407" H 7300 3600 50  0001 C CNN
F 1 "GND" H 7305 3677 50  0000 C CNN
F 2 "" H 7300 3850 50  0001 C CNN
F 3 "" H 7300 3850 50  0001 C CNN
	1    7300 3850
	1    0    0    -1  
$EndComp
Text GLabel 2750 1500 0    50   Input ~ 0
I_SENSE_RAW
Text GLabel 7550 3450 2    50   Input ~ 0
I_SENSE
Wire Wire Line
	1850 3800 1850 3900
$Comp
L Device:R R406
U 1 1 60BEE044
P 6550 4350
F 0 "R406" V 6343 4350 50  0000 C CNN
F 1 "470K" V 6434 4350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6480 4350 50  0001 C CNN
F 3 "~" H 6550 4350 50  0001 C CNN
	1    6550 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 3550 4650 3550
Wire Wire Line
	4650 3550 4650 3450
Wire Wire Line
	4650 3450 4500 3450
Connection ~ 4500 3450
Wire Wire Line
	5250 3550 5500 3550
Wire Wire Line
	6700 4350 7450 4350
Wire Wire Line
	7450 4350 7450 3600
Connection ~ 7450 3450
Wire Wire Line
	7450 3450 7300 3450
Wire Wire Line
	6400 4350 5500 4350
Wire Wire Line
	5500 4350 5500 3550
Connection ~ 5500 3550
Wire Wire Line
	5500 3550 5900 3550
Wire Wire Line
	5700 2450 5700 3450
Wire Wire Line
	5300 2450 5700 2450
$Comp
L Device:CP C401
U 1 1 60CA4B23
P 8050 3950
F 0 "C401" H 8168 3996 50  0000 L CNN
F 1 "10uF" H 8168 3905 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 8088 3800 50  0001 C CNN
F 3 "~" H 8050 3950 50  0001 C CNN
	1    8050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3800 8050 3600
Wire Wire Line
	8050 3600 7450 3600
Connection ~ 7450 3600
Wire Wire Line
	7450 3600 7450 3450
$Comp
L power:GND #PWR0408
U 1 1 60CA7409
P 8050 4100
F 0 "#PWR0408" H 8050 3850 50  0001 C CNN
F 1 "GND" H 8055 3927 50  0000 C CNN
F 2 "" H 8050 4100 50  0001 C CNN
F 3 "" H 8050 4100 50  0001 C CNN
	1    8050 4100
	1    0    0    -1  
$EndComp
$Comp
L st12-rescue:OPA237NA_250-OPA237NA_250 U?
U 1 1 6157CD9B
P 3450 1600
F 0 "U?" H 3450 2170 50  0000 C CNN
F 1 "OPA237NA_250" H 3450 2079 50  0000 C CNN
F 2 "OPA237NA:SOT95P280X145-5N" H 3450 1600 50  0001 L BNN
F 3 "" H 3450 1600 50  0001 L BNN
	1    3450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1600 2750 2100
Wire Wire Line
	4500 1500 4500 2100
Wire Wire Line
	2750 2100 4500 2100
$Comp
L power:GND #PWR?
U 1 1 6157CDA5
P 4150 1900
F 0 "#PWR?" H 4150 1650 50  0001 C CNN
F 1 "GND" H 4155 1727 50  0000 C CNN
F 2 "" H 4150 1900 50  0001 C CNN
F 3 "" H 4150 1900 50  0001 C CNN
	1    4150 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6157CDAB
P 4150 1300
F 0 "#PWR?" H 4150 1150 50  0001 C CNN
F 1 "+5V" H 4165 1473 50  0000 C CNN
F 2 "" H 4150 1300 50  0001 C CNN
F 3 "" H 4150 1300 50  0001 C CNN
	1    4150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1500 4500 1500
Wire Wire Line
	4850 2450 4500 2450
Wire Wire Line
	4500 2450 4500 2100
Connection ~ 4500 2100
$EndSCHEMATC
