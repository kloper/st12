EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L TPS5430DDAR:TPS5430DDAR U?
U 1 1 60B0AF4B
P 4400 1700
AR Path="/60B0AF4B" Ref="U?"  Part="1" 
AR Path="/60AEC464/60B0AF4B" Ref="U202"  Part="1" 
F 0 "U202" H 4400 2467 50  0000 C CNN
F 1 "TPS5430DDAR" H 4400 2376 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 4400 1700 50  0001 L BNN
F 3 "" H 4400 1700 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 4400 1700 50  0001 L BNN "STANDARD"
F 5 "I" H 4400 1700 50  0001 L BNN "PARTREV"
F 6 "Texas Instruments" H 4400 1700 50  0001 L BNN "MANUFACTURER"
F 7 "1.70 mm" H 4400 1700 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    4400 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60B0AF51
P 850 1050
AR Path="/60B0AF51" Ref="J?"  Part="1" 
AR Path="/60AEC464/60B0AF51" Ref="J201"  Part="1" 
F 0 "J201" H 850 1150 50  0000 C CNN
F 1 "Conn_01x02_Male" H 958 1140 50  0001 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 850 1050 50  0001 C CNN
F 3 "~" H 850 1050 50  0001 C CNN
	1    850  1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0AF57
P 1350 1250
AR Path="/60B0AF57" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AF57" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 1350 1000 50  0001 C CNN
F 1 "GND" H 1355 1077 50  0000 C CNN
F 2 "" H 1350 1250 50  0001 C CNN
F 3 "" H 1350 1250 50  0001 C CNN
	1    1350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1150 1350 1250
Wire Wire Line
	1050 1150 1200 1150
$Comp
L power:+24V #PWR?
U 1 1 60B0AF5F
P 1350 1000
AR Path="/60B0AF5F" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AF5F" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 1350 850 50  0001 C CNN
F 1 "+24V" H 1365 1173 50  0000 C CNN
F 2 "" H 1350 1000 50  0001 C CNN
F 3 "" H 1350 1000 50  0001 C CNN
	1    1350 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60B0AF67
P 2650 1500
AR Path="/60B0AF67" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0AF67" Ref="C201"  Part="1" 
F 0 "C201" H 2768 1546 50  0000 L CNN
F 1 "220uF 35V" V 2600 1050 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D16.0mm_P7.50mm" H 2688 1350 50  0001 C CNN
F 3 "~" H 2650 1500 50  0001 C CNN
	1    2650 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60B0AF6D
P 3200 1500
AR Path="/60B0AF6D" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0AF6D" Ref="C204"  Part="1" 
F 0 "C204" H 3318 1546 50  0000 L CNN
F 1 "10uF 35V" V 3150 1100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 3238 1350 50  0001 C CNN
F 3 "~" H 3200 1500 50  0001 C CNN
	1    3200 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0AF73
P 2200 1500
AR Path="/60B0AF73" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0AF73" Ref="R203"  Part="1" 
F 0 "R203" H 2270 1546 50  0000 L CNN
F 1 "100K" H 2270 1455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2130 1500 50  0001 C CNN
F 3 "~" H 2200 1500 50  0001 C CNN
	1    2200 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0AF79
P 2200 1900
AR Path="/60B0AF79" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0AF79" Ref="R204"  Part="1" 
F 0 "R204" H 2270 1946 50  0000 L CNN
F 1 "10K" H 2270 1855 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2130 1900 50  0001 C CNN
F 3 "~" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0AF7F
P 2200 2150
AR Path="/60B0AF7F" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AF7F" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2200 1900 50  0001 C CNN
F 1 "GND" H 2205 1977 50  0000 C CNN
F 2 "" H 2200 2150 50  0001 C CNN
F 3 "" H 2200 2150 50  0001 C CNN
	1    2200 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1350 2200 1200
Connection ~ 2200 1200
Wire Wire Line
	2200 1750 2200 1700
Wire Wire Line
	2200 2150 2200 2100
Wire Wire Line
	2200 2100 2650 2100
Connection ~ 2200 2100
Wire Wire Line
	2200 2100 2200 2050
Wire Wire Line
	2650 1650 2650 2100
Connection ~ 2650 2100
Wire Wire Line
	2650 1350 2650 1200
Connection ~ 2650 1200
Wire Wire Line
	2650 1200 2200 1200
Wire Wire Line
	2650 1200 3200 1200
Wire Wire Line
	3200 1350 3200 1200
Wire Wire Line
	3200 1650 3200 2100
Wire Wire Line
	2650 2100 3200 2100
Wire Wire Line
	2200 1700 1950 1700
Connection ~ 2200 1700
Wire Wire Line
	2200 1700 2200 1650
Text Label 1950 1700 2    50   ~ 0
V24AVAIL
Text Label 3700 1400 2    50   ~ 0
V24AVAIL
$Comp
L Device:C C?
U 1 1 60B0AF9D
P 5400 1400
AR Path="/60B0AF9D" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0AF9D" Ref="C205"  Part="1" 
F 0 "C205" V 5148 1400 50  0000 C CNN
F 1 "10nF" V 5239 1400 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5438 1250 50  0001 C CNN
F 3 "~" H 5400 1400 50  0001 C CNN
	1    5400 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 1400 5250 1400
Wire Wire Line
	5100 1600 5650 1600
Wire Wire Line
	5650 1600 5650 1400
Wire Wire Line
	5650 1400 5550 1400
$Comp
L power:GND #PWR?
U 1 1 60B0AFA7
P 5250 2350
AR Path="/60B0AFA7" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AFA7" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 5250 2100 50  0001 C CNN
F 1 "GND" H 5255 2177 50  0000 C CNN
F 2 "" H 5250 2350 50  0001 C CNN
F 3 "" H 5250 2350 50  0001 C CNN
	1    5250 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 60B0AFB2
P 5850 1650
AR Path="/60B0AFB2" Ref="D?"  Part="1" 
AR Path="/60AEC464/60B0AFB2" Ref="D202"  Part="1" 
F 0 "D202" V 5804 1730 50  0000 L CNN
F 1 "30V 0.5A" V 5895 1730 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" H 5850 1650 50  0001 C CNN
F 3 "~" H 5850 1650 50  0001 C CNN
	1    5850 1650
	0    1    1    0   
$EndComp
$Comp
L Device:L L?
U 1 1 60B0AFB8
P 6150 1400
AR Path="/60B0AFB8" Ref="L?"  Part="1" 
AR Path="/60AEC464/60B0AFB8" Ref="L201"  Part="1" 
F 0 "L201" V 5969 1400 50  0000 C CNN
F 1 "15uH" V 6060 1400 50  0000 C CNN
F 2 "Inductors_SMD:L_10.4x10.4_H4.8" H 6150 1400 50  0001 C CNN
F 3 "~" H 6150 1400 50  0001 C CNN
	1    6150 1400
	0    1    1    0   
$EndComp
$Comp
L Device:CP C?
U 1 1 60B0AFBE
P 6450 1650
AR Path="/60B0AFBE" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0AFBE" Ref="C206"  Part="1" 
F 0 "C206" H 6568 1696 50  0000 L CNN
F 1 "220uF 6V" V 6600 1250 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-X_EIA-7343-43_Hand" H 6488 1500 50  0001 C CNN
F 3 "~" H 6450 1650 50  0001 C CNN
	1    6450 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0AFC4
P 5850 1900
AR Path="/60B0AFC4" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AFC4" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 5850 1650 50  0001 C CNN
F 1 "GND" H 5855 1727 50  0000 C CNN
F 2 "" H 5850 1900 50  0001 C CNN
F 3 "" H 5850 1900 50  0001 C CNN
	1    5850 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0AFCA
P 6450 1900
AR Path="/60B0AFCA" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AFCA" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 6450 1650 50  0001 C CNN
F 1 "GND" H 6455 1727 50  0000 C CNN
F 2 "" H 6450 1900 50  0001 C CNN
F 3 "" H 6450 1900 50  0001 C CNN
	1    6450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1900 5850 1800
Wire Wire Line
	6450 1900 6450 1800
Wire Wire Line
	6000 1400 5850 1400
Connection ~ 5650 1400
Wire Wire Line
	5850 1500 5850 1400
Connection ~ 5850 1400
Wire Wire Line
	5850 1400 5650 1400
Wire Wire Line
	6450 1500 6450 1400
Wire Wire Line
	6450 1400 6300 1400
$Comp
L Device:R R?
U 1 1 60B0AFD9
P 6800 1600
AR Path="/60B0AFD9" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0AFD9" Ref="R210"  Part="1" 
F 0 "R210" H 6870 1646 50  0000 L CNN
F 1 "100K" H 6870 1555 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6730 1600 50  0001 C CNN
F 3 "~" H 6800 1600 50  0001 C CNN
	1    6800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1450 6800 1400
Wire Wire Line
	6800 1400 6650 1400
Connection ~ 6450 1400
$Comp
L Device:R R?
U 1 1 60B0AFE2
P 6800 2000
AR Path="/60B0AFE2" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0AFE2" Ref="R211"  Part="1" 
F 0 "R211" H 6870 2046 50  0000 L CNN
F 1 "24K" H 6870 1955 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 6730 2000 50  0001 C CNN
F 3 "~" H 6800 2000 50  0001 C CNN
	1    6800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0AFE8
P 6800 2250
AR Path="/60B0AFE8" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AFE8" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 6800 2000 50  0001 C CNN
F 1 "GND" H 6805 2077 50  0000 C CNN
F 2 "" H 6800 2250 50  0001 C CNN
F 3 "" H 6800 2250 50  0001 C CNN
	1    6800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1750 6800 1800
Wire Wire Line
	6800 2150 6800 2250
Wire Wire Line
	6800 1800 6950 1800
Connection ~ 6800 1800
Wire Wire Line
	6800 1800 6800 1850
Text Label 6950 1800 0    50   ~ 0
VSENS
Text Label 3700 1600 2    50   ~ 0
VSENS
$Comp
L power:+6V #PWR?
U 1 1 60B0AFF7
P 6800 1250
AR Path="/60B0AFF7" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0AFF7" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 6800 1100 50  0001 C CNN
F 1 "+6V" H 6815 1423 50  0000 C CNN
F 2 "" H 6800 1250 50  0001 C CNN
F 3 "" H 6800 1250 50  0001 C CNN
	1    6800 1250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-5.0 U?
U 1 1 60B0AFFD
P 8650 1500
AR Path="/60B0AFFD" Ref="U?"  Part="1" 
AR Path="/60AEC464/60B0AFFD" Ref="U203"  Part="1" 
F 0 "U203" H 8650 1742 50  0000 C CNN
F 1 "AMS1117-5.0" H 8650 1651 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 8650 1700 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 8750 1250 50  0001 C CNN
	1    8650 1500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U?
U 1 1 60B0B003
P 10100 1500
AR Path="/60B0B003" Ref="U?"  Part="1" 
AR Path="/60AEC464/60B0B003" Ref="U205"  Part="1" 
F 0 "U205" H 10100 1742 50  0000 C CNN
F 1 "AMS1117-3.3" H 10100 1651 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 10100 1700 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 10200 1250 50  0001 C CNN
	1    10100 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1500 8150 1500
Wire Wire Line
	8950 1500 9100 1500
Wire Wire Line
	10400 1500 10550 1500
$Comp
L Device:C C?
U 1 1 60B0B00D
P 8150 1750
AR Path="/60B0B00D" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B00D" Ref="C207"  Part="1" 
F 0 "C207" H 8035 1704 50  0000 R CNN
F 1 "100nF" H 8035 1795 50  0000 R CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8188 1600 50  0001 C CNN
F 3 "~" H 8150 1750 50  0001 C CNN
	1    8150 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60B0B013
P 9550 1750
AR Path="/60B0B013" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B013" Ref="C209"  Part="1" 
F 0 "C209" H 9435 1704 50  0000 R CNN
F 1 "100nF" H 9435 1795 50  0000 R CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 9588 1600 50  0001 C CNN
F 3 "~" H 9550 1750 50  0001 C CNN
	1    9550 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C?
U 1 1 60B0B019
P 9100 1750
AR Path="/60B0B019" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B019" Ref="C208"  Part="1" 
F 0 "C208" H 9218 1796 50  0000 L CNN
F 1 "10uF" H 9200 1650 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9138 1600 50  0001 C CNN
F 3 "~" H 9100 1750 50  0001 C CNN
	1    9100 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60B0B01F
P 10550 1750
AR Path="/60B0B01F" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B01F" Ref="C210"  Part="1" 
F 0 "C210" H 10668 1796 50  0000 L CNN
F 1 "10uF" H 10650 1650 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 10588 1600 50  0001 C CNN
F 3 "~" H 10550 1750 50  0001 C CNN
	1    10550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1600 8150 1500
Wire Wire Line
	9100 1600 9100 1500
Wire Wire Line
	10550 1600 10550 1500
$Comp
L power:GND #PWR?
U 1 1 60B0B029
P 8650 1950
AR Path="/60B0B029" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B029" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 8650 1700 50  0001 C CNN
F 1 "GND" H 8655 1777 50  0000 C CNN
F 2 "" H 8650 1950 50  0001 C CNN
F 3 "" H 8650 1950 50  0001 C CNN
	1    8650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0B02F
P 10100 1950
AR Path="/60B0B02F" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B02F" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 10100 1700 50  0001 C CNN
F 1 "GND" H 10105 1777 50  0000 C CNN
F 2 "" H 10100 1950 50  0001 C CNN
F 3 "" H 10100 1950 50  0001 C CNN
	1    10100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1900 8650 1900
Wire Wire Line
	8650 1950 8650 1900
Connection ~ 8650 1900
Wire Wire Line
	8650 1900 9100 1900
Wire Wire Line
	8650 1800 8650 1900
Wire Wire Line
	9550 1900 10100 1900
Wire Wire Line
	10100 1950 10100 1900
Connection ~ 10100 1900
Wire Wire Line
	10100 1900 10550 1900
Wire Wire Line
	10100 1800 10100 1900
$Comp
L power:+6V #PWR?
U 1 1 60B0B03F
P 8150 1450
AR Path="/60B0B03F" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B03F" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 8150 1300 50  0001 C CNN
F 1 "+6V" H 8165 1623 50  0000 C CNN
F 2 "" H 8150 1450 50  0001 C CNN
F 3 "" H 8150 1450 50  0001 C CNN
	1    8150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+6V #PWR?
U 1 1 60B0B045
P 9550 1450
AR Path="/60B0B045" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B045" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 9550 1300 50  0001 C CNN
F 1 "+6V" H 9565 1623 50  0000 C CNN
F 2 "" H 9550 1450 50  0001 C CNN
F 3 "" H 9550 1450 50  0001 C CNN
	1    9550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B0B04F
P 9100 1450
AR Path="/60B0B04F" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B04F" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 9100 1300 50  0001 C CNN
F 1 "+5V" H 9115 1623 50  0000 C CNN
F 2 "" H 9100 1450 50  0001 C CNN
F 3 "" H 9100 1450 50  0001 C CNN
	1    9100 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60B0B055
P 10550 1450
AR Path="/60B0B055" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B055" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 10550 1300 50  0001 C CNN
F 1 "+3.3V" H 10565 1623 50  0000 C CNN
F 2 "" H 10550 1450 50  0001 C CNN
F 3 "" H 10550 1450 50  0001 C CNN
	1    10550 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1500 9100 1450
Connection ~ 9100 1500
Wire Wire Line
	10550 1500 10550 1450
Connection ~ 10550 1500
$Comp
L Sensor_Current:ACS756xCB-050B-PFF U?
U 1 1 60B0B05F
P 1950 3200
AR Path="/60B0B05F" Ref="U?"  Part="1" 
AR Path="/60AEC464/60B0B05F" Ref="U201"  Part="1" 
F 0 "U201" H 2100 3600 50  0000 L CNN
F 1 "ACS756xCB-050B-PFF" H 2100 3500 50  0000 L CNN
F 2 "Sensor_Current:Allegro_CB_PFF" H 1950 3200 50  0001 C CNN
F 3 "http://www.allegromicro.com/~/media/Files/Datasheets/ACS756-Datasheet.ashx?la=en" H 1950 3200 50  0001 C CNN
	1    1950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR?
U 1 1 60B0B065
P 1450 3000
AR Path="/60B0B065" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B065" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 1450 2850 50  0001 C CNN
F 1 "+24V" H 1465 3173 50  0000 C CNN
F 2 "" H 1450 3000 50  0001 C CNN
F 3 "" H 1450 3000 50  0001 C CNN
	1    1450 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B0B06D
P 1950 2850
AR Path="/60B0B06D" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B06D" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 1950 2700 50  0001 C CNN
F 1 "+5V" H 1965 3023 50  0000 C CNN
F 2 "" H 1950 2850 50  0001 C CNN
F 3 "" H 1950 2850 50  0001 C CNN
	1    1950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2900 1950 2850
$Comp
L power:GND #PWR?
U 1 1 60B0B074
P 1950 3550
AR Path="/60B0B074" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B074" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 1950 3300 50  0001 C CNN
F 1 "GND" H 1955 3377 50  0000 C CNN
F 2 "" H 1950 3550 50  0001 C CNN
F 3 "" H 1950 3550 50  0001 C CNN
	1    1950 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3550 1950 3500
$Comp
L Device:R R?
U 1 1 60B0B07B
P 2650 3200
AR Path="/60B0B07B" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B07B" Ref="R205"  Part="1" 
F 0 "R205" V 2443 3200 50  0000 C CNN
F 1 "47" V 2534 3200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2580 3200 50  0001 C CNN
F 3 "~" H 2650 3200 50  0001 C CNN
	1    2650 3200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B0B081
P 2950 3450
AR Path="/60B0B081" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B081" Ref="C203"  Part="1" 
F 0 "C203" H 3065 3496 50  0000 L CNN
F 1 "100nF" H 3065 3405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2988 3300 50  0001 C CNN
F 3 "~" H 2950 3450 50  0001 C CNN
	1    2950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3200 2500 3200
Wire Wire Line
	2800 3200 2950 3200
Wire Wire Line
	2950 3200 2950 3300
Wire Wire Line
	2950 3600 2350 3600
Wire Wire Line
	2350 3600 2350 3550
Wire Wire Line
	2350 3550 1950 3550
Connection ~ 1950 3550
$Comp
L FDS4435BZ:FDS4435BZ Q?
U 1 1 60B0B08F
P 2250 4400
AR Path="/60B0B08F" Ref="Q?"  Part="1" 
AR Path="/60AEC464/60B0B08F" Ref="Q202"  Part="1" 
F 0 "Q202" H 2348 4354 50  0000 L CNN
F 1 "FDS4435BZ" H 2348 4445 50  0000 L CNN
F 2 "FDS4435BZ:SO08-E3" H 2250 4400 50  0001 L BNN
F 3 "" H 2250 4400 50  0001 L BNN
	1    2250 4400
	1    0    0    1   
$EndComp
Wire Wire Line
	2250 4200 2250 3950
Wire Wire Line
	2250 3950 1950 3950
Wire Wire Line
	1550 3950 1550 3300
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 60B0B098
P 1350 4500
AR Path="/60B0B098" Ref="Q?"  Part="1" 
AR Path="/60AEC464/60B0B098" Ref="Q201"  Part="1" 
F 0 "Q201" H 1554 4546 50  0000 L CNN
F 1 "2N7002" H 1554 4455 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 1550 4425 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 1350 4500 50  0001 L CNN
	1    1350 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B09E
P 1700 4300
AR Path="/60B0B09E" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B09E" Ref="R201"  Part="1" 
F 0 "R201" V 1600 4250 50  0000 C CNN
F 1 "1K" V 1700 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1630 4300 50  0001 C CNN
F 3 "~" H 1700 4300 50  0001 C CNN
	1    1700 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B0A4
P 1950 4150
AR Path="/60B0B0A4" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B0A4" Ref="R202"  Part="1" 
F 0 "R202" H 1880 4104 50  0000 R CNN
F 1 "2K" V 1950 4200 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1880 4150 50  0001 C CNN
F 3 "~" H 1950 4150 50  0001 C CNN
	1    1950 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 4000 1950 3950
Connection ~ 1950 3950
Wire Wire Line
	1950 3950 1550 3950
Wire Wire Line
	2050 4300 1950 4300
Wire Wire Line
	1950 4300 1850 4300
Connection ~ 1950 4300
Wire Wire Line
	1550 4300 1450 4300
$Comp
L power:GND #PWR?
U 1 1 60B0B0B1
P 1450 4750
AR Path="/60B0B0B1" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B0B1" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 1450 4500 50  0001 C CNN
F 1 "GND" H 1455 4577 50  0000 C CNN
F 2 "" H 1450 4750 50  0001 C CNN
F 3 "" H 1450 4750 50  0001 C CNN
	1    1450 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4750 1450 4700
Wire Wire Line
	1150 4500 1100 4500
$Comp
L Device:D_Schottky D?
U 1 1 60B0B0BA
P 2850 4750
AR Path="/60B0B0BA" Ref="D?"  Part="1" 
AR Path="/60AEC464/60B0B0BA" Ref="D201"  Part="1" 
F 0 "D201" V 2804 4830 50  0000 L CNN
F 1 "30V 0.5A" V 2895 4830 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" H 2850 4750 50  0001 C CNN
F 3 "~" H 2850 4750 50  0001 C CNN
	1    2850 4750
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60B0B0C0
P 2850 4350
AR Path="/60B0B0C0" Ref="C?"  Part="1" 
AR Path="/60AEC464/60B0B0C0" Ref="C202"  Part="1" 
F 0 "C202" H 2965 4396 50  0000 L CNN
F 1 "1uF" H 2965 4305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2888 4200 50  0001 C CNN
F 3 "~" H 2850 4350 50  0001 C CNN
	1    2850 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4200 2850 3950
Wire Wire Line
	2850 3950 2250 3950
Connection ~ 2250 3950
Wire Wire Line
	2850 4500 2850 4550
Wire Wire Line
	2250 4600 2550 4600
Wire Wire Line
	2550 4600 2550 4550
Wire Wire Line
	2550 4550 2850 4550
Connection ~ 2850 4550
Wire Wire Line
	2850 4550 2850 4600
$Comp
L power:GND #PWR?
U 1 1 60B0B0CF
P 2850 4950
AR Path="/60B0B0CF" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B0CF" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 2850 4700 50  0001 C CNN
F 1 "GND" H 2855 4777 50  0000 C CNN
F 2 "" H 2850 4950 50  0001 C CNN
F 3 "" H 2850 4950 50  0001 C CNN
	1    2850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4950 2850 4900
Wire Wire Line
	2250 4600 2250 4800
Wire Wire Line
	2250 4800 2150 4800
Connection ~ 2250 4600
Text Label 2150 4800 2    50   ~ 0
V24HEATER
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60B0B0DA
P 2350 4800
AR Path="/60B0B0DA" Ref="#FLG?"  Part="1" 
AR Path="/60AEC464/60B0B0DA" Ref="#FLG0101"  Part="1" 
F 0 "#FLG0101" H 2350 4875 50  0001 C CNN
F 1 "PWR_FLAG" H 2500 4700 50  0000 C CNN
F 2 "" H 2350 4800 50  0001 C CNN
F 3 "~" H 2350 4800 50  0001 C CNN
	1    2350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4800 2250 4800
Connection ~ 2250 4800
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J?
U 1 1 60B0B0E2
P 1300 6250
AR Path="/60B0B0E2" Ref="J?"  Part="1" 
AR Path="/60AEC464/60B0B0E2" Ref="J202"  Part="1" 
F 0 "J202" H 1300 6050 50  0000 L CNN
F 1 "T12_Sense" H 1300 5950 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm_SMD" H 1300 6250 50  0001 C CNN
F 3 "~" H 1300 6250 50  0001 C CNN
	1    1300 6250
	1    0    0    -1  
$EndComp
Text Label 1100 6350 2    50   ~ 0
SHAKE
Text Label 1600 6350 0    50   ~ 0
COLD
$Comp
L power:GND #PWR?
U 1 1 60B0B0EA
P 1100 6250
AR Path="/60B0B0EA" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B0EA" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 1100 6000 50  0001 C CNN
F 1 "GND" V 1105 6122 50  0000 R CNN
F 2 "" H 1100 6250 50  0001 C CNN
F 3 "" H 1100 6250 50  0001 C CNN
	1    1100 6250
	0    1    1    0   
$EndComp
Text Label 1200 6950 2    50   ~ 0
V24HEATER
$Comp
L OPA237NA_250:OPA237NA_250 U?
U 1 1 60B0B126
P 9150 3200
AR Path="/60B0B126" Ref="U?"  Part="1" 
AR Path="/60AEC464/60B0B126" Ref="U204"  Part="1" 
F 0 "U204" H 9150 3770 50  0000 C CNN
F 1 "OPA237NA_250" H 9150 3679 50  0000 C CNN
F 2 "OPA237NA:SOT95P280X145-5N" H 9150 3200 50  0001 L BNN
F 3 "" H 9150 3200 50  0001 L BNN
	1    9150 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B12C
P 8000 3100
AR Path="/60B0B12C" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B12C" Ref="R212"  Part="1" 
F 0 "R212" H 7930 3054 50  0000 R CNN
F 1 "7.5K" V 8000 3200 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7930 3100 50  0001 C CNN
F 3 "~" H 8000 3100 50  0001 C CNN
	1    8000 3100
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60B0B132
P 9900 2850
AR Path="/60B0B132" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B132" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 9900 2700 50  0001 C CNN
F 1 "+3.3V" H 9915 3023 50  0000 C CNN
F 2 "" H 9900 2850 50  0001 C CNN
F 3 "" H 9900 2850 50  0001 C CNN
	1    9900 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0B138
P 9900 3550
AR Path="/60B0B138" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B138" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 9900 3300 50  0001 C CNN
F 1 "GND" H 9905 3377 50  0000 C CNN
F 2 "" H 9900 3550 50  0001 C CNN
F 3 "" H 9900 3550 50  0001 C CNN
	1    9900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2900 9900 2900
Wire Wire Line
	9900 2900 9900 2850
Wire Wire Line
	9900 3550 9900 3500
Wire Wire Line
	9900 3500 9850 3500
$Comp
L Device:R R?
U 1 1 60B0B142
P 10050 4000
AR Path="/60B0B142" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B142" Ref="R213"  Part="1" 
F 0 "R213" H 9980 3954 50  0000 R CNN
F 1 "249K" V 10050 4100 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9980 4000 50  0001 C CNN
F 3 "~" H 10050 4000 50  0001 C CNN
	1    10050 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B148
P 10300 4250
AR Path="/60B0B148" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B148" Ref="R214"  Part="1" 
F 0 "R214" H 10230 4204 50  0000 R CNN
F 1 "1K" V 10300 4350 50  0000 R CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 10230 4250 50  0001 C CNN
F 3 "~" H 10300 4250 50  0001 C CNN
	1    10300 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 3200 8450 4000
Wire Wire Line
	8450 4000 9900 4000
Wire Wire Line
	10200 4000 10300 4000
Wire Wire Line
	10300 4000 10300 3100
Wire Wire Line
	10300 3100 9850 3100
Wire Wire Line
	10300 4100 10300 4000
Connection ~ 10300 4000
$Comp
L power:GND #PWR?
U 1 1 60B0B155
P 10300 4450
AR Path="/60B0B155" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B155" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 10300 4200 50  0001 C CNN
F 1 "GND" H 10305 4277 50  0000 C CNN
F 2 "" H 10300 4450 50  0001 C CNN
F 3 "" H 10300 4450 50  0001 C CNN
	1    10300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4450 10300 4400
$Comp
L Device:D D?
U 1 1 60B0B15C
P 8150 3400
AR Path="/60B0B15C" Ref="D?"  Part="1" 
AR Path="/60AEC464/60B0B15C" Ref="D203"  Part="1" 
F 0 "D203" V 8196 3320 50  0000 R CNN
F 1 "RS1M" V 8105 3320 50  0000 R CNN
F 2 "Diodes_SMD:D_SMA-SMB_Universal_Handsoldering" H 8150 3400 50  0001 C CNN
F 3 "~" H 8150 3400 50  0001 C CNN
	1    8150 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B0B162
P 8150 3600
AR Path="/60B0B162" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B162" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 8150 3350 50  0001 C CNN
F 1 "GND" H 8155 3427 50  0000 C CNN
F 2 "" H 8150 3600 50  0001 C CNN
F 3 "" H 8150 3600 50  0001 C CNN
	1    8150 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3100 8250 3100
Wire Wire Line
	8150 3250 8250 3250
Wire Wire Line
	8250 3250 8250 3100
Connection ~ 8250 3100
Wire Wire Line
	8250 3100 8450 3100
Wire Wire Line
	8150 3600 8150 3550
Text Label 7850 3100 2    50   ~ 0
V24HEATER
Text GLabel 5650 3150 2    50   Output ~ 0
I_SENSE
Connection ~ 2950 3200
Text GLabel 1000 4500 0    50   Input ~ 0
HEATER_CTL
Text GLabel 10450 3100 2    50   Output ~ 0
T_SENSE
Wire Wire Line
	10450 3100 10300 3100
Connection ~ 10300 3100
Wire Wire Line
	8150 1450 8150 1500
Connection ~ 8150 1500
Wire Wire Line
	5250 2350 5250 2200
Wire Wire Line
	5250 2200 5100 2200
Wire Wire Line
	5100 2100 5250 2100
Wire Wire Line
	5250 2100 5250 2200
Connection ~ 5250 2200
Wire Wire Line
	6800 1250 6800 1400
Connection ~ 6800 1400
Wire Wire Line
	3700 1200 3500 1200
Connection ~ 3200 1200
Wire Wire Line
	1550 3100 1450 3100
Wire Wire Line
	1450 3100 1450 3000
Wire Wire Line
	1350 1000 1350 1050
Wire Wire Line
	1350 1050 1200 1050
Wire Wire Line
	9800 1500 9550 1500
Wire Wire Line
	9550 1450 9550 1500
Connection ~ 9550 1500
Wire Wire Line
	9550 1500 9550 1600
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 60BF7CA9
P 1200 1050
F 0 "#FLG0102" H 1200 1125 50  0001 C CNN
F 1 "PWR_FLAG" H 1000 1250 50  0001 C CNN
F 2 "" H 1200 1050 50  0001 C CNN
F 3 "~" H 1200 1050 50  0001 C CNN
	1    1200 1050
	1    0    0    -1  
$EndComp
Connection ~ 1200 1050
Wire Wire Line
	1200 1050 1050 1050
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 60BF86F9
P 1200 1150
F 0 "#FLG0103" H 1200 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1400 1350 50  0001 C CNN
F 2 "" H 1200 1150 50  0001 C CNN
F 3 "~" H 1200 1150 50  0001 C CNN
	1    1200 1150
	-1   0    0    1   
$EndComp
Connection ~ 1200 1150
Wire Wire Line
	1200 1150 1350 1150
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 60BF9107
P 6650 1400
F 0 "#FLG0104" H 6650 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 6650 1573 50  0001 C CNN
F 2 "" H 6650 1400 50  0001 C CNN
F 3 "~" H 6650 1400 50  0001 C CNN
	1    6650 1400
	1    0    0    -1  
$EndComp
Connection ~ 6650 1400
Wire Wire Line
	6650 1400 6450 1400
$Comp
L OPA237NA_250:OPA237NA_250 U?
U 1 1 60C04D7C
P 4300 3250
AR Path="/60C04D7C" Ref="U?"  Part="1" 
AR Path="/60AEC464/60C04D7C" Ref="U206"  Part="1" 
F 0 "U206" H 4300 3820 50  0000 C CNN
F 1 "OPA237NA_250" H 4300 3729 50  0000 C CNN
F 2 "OPA237NA:SOT95P280X145-5N" H 4300 3250 50  0001 L BNN
F 3 "" H 4300 3250 50  0001 L BNN
	1    4300 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60C05214
P 5100 2900
AR Path="/60C05214" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60C05214" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 5100 2750 50  0001 C CNN
F 1 "+3.3V" H 5115 3073 50  0000 C CNN
F 2 "" H 5100 2900 50  0001 C CNN
F 3 "" H 5100 2900 50  0001 C CNN
	1    5100 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60C0575E
P 5100 3600
AR Path="/60C0575E" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60C0575E" Ref="#PWR0203"  Part="1" 
F 0 "#PWR0203" H 5100 3350 50  0001 C CNN
F 1 "GND" H 5105 3427 50  0000 C CNN
F 2 "" H 5100 3600 50  0001 C CNN
F 3 "" H 5100 3600 50  0001 C CNN
	1    5100 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C05CB5
P 4800 3950
AR Path="/60C05CB5" Ref="R?"  Part="1" 
AR Path="/60AEC464/60C05CB5" Ref="R215"  Part="1" 
F 0 "R215" H 4730 3904 50  0000 R CNN
F 1 "1K" V 4800 4050 50  0000 R CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4730 3950 50  0001 C CNN
F 3 "~" H 4800 3950 50  0001 C CNN
	1    4800 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60C063B7
P 5050 4200
AR Path="/60C063B7" Ref="R?"  Part="1" 
AR Path="/60AEC464/60C063B7" Ref="R216"  Part="1" 
F 0 "R216" H 4980 4154 50  0000 R CNN
F 1 "1K" V 5050 4300 50  0000 R CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4980 4200 50  0001 C CNN
F 3 "~" H 5050 4200 50  0001 C CNN
	1    5050 4200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60C122E8
P 5050 4450
AR Path="/60C122E8" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60C122E8" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0201" H 5050 4200 50  0001 C CNN
F 1 "GND" H 5055 4277 50  0000 C CNN
F 2 "" H 5050 4450 50  0001 C CNN
F 3 "" H 5050 4450 50  0001 C CNN
	1    5050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3250 3600 3950
Wire Wire Line
	3600 3950 4650 3950
Wire Wire Line
	4950 3950 5050 3950
Wire Wire Line
	5050 3950 5050 4050
Wire Wire Line
	5000 3150 5400 3150
Wire Wire Line
	5400 3150 5400 3950
Wire Wire Line
	5400 3950 5050 3950
Connection ~ 5400 3150
Wire Wire Line
	5400 3150 5650 3150
Connection ~ 5050 3950
Wire Wire Line
	5100 3600 5100 3550
Wire Wire Line
	5100 3550 5000 3550
Wire Wire Line
	3350 3200 3350 3150
Wire Wire Line
	3350 3150 3600 3150
Wire Wire Line
	2950 3200 3350 3200
Wire Wire Line
	5000 2950 5100 2950
Wire Wire Line
	5100 2950 5100 2900
Wire Wire Line
	5050 4450 5050 4350
$Comp
L Connector:TestPoint TP201
U 1 1 60D2E5F9
P 4500 6000
F 0 "TP201" H 4558 6118 50  0000 L CNN
F 1 "GND" H 4558 6027 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 4700 6000 50  0001 C CNN
F 3 "~" H 4700 6000 50  0001 C CNN
	1    4500 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP203
U 1 1 60D2FEF2
P 5100 6000
F 0 "TP203" H 5158 6118 50  0000 L CNN
F 1 "24V" H 5158 6027 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5300 6000 50  0001 C CNN
F 3 "~" H 5300 6000 50  0001 C CNN
	1    5100 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP204
U 1 1 60D30107
P 5650 6000
F 0 "TP204" H 5708 6118 50  0000 L CNN
F 1 "6V" H 5708 6027 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5850 6000 50  0001 C CNN
F 3 "~" H 5850 6000 50  0001 C CNN
	1    5650 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP205
U 1 1 60D3070C
P 6150 6000
F 0 "TP205" H 6208 6118 50  0000 L CNN
F 1 "5V" H 6208 6027 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 6350 6000 50  0001 C CNN
F 3 "~" H 6350 6000 50  0001 C CNN
	1    6150 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 60D30ABB
P 4500 6000
F 0 "#PWR0204" H 4500 5750 50  0001 C CNN
F 1 "GND" H 4505 5827 50  0000 C CNN
F 2 "" H 4500 6000 50  0001 C CNN
F 3 "" H 4500 6000 50  0001 C CNN
	1    4500 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0205
U 1 1 60D31447
P 5100 6000
F 0 "#PWR0205" H 5100 5850 50  0001 C CNN
F 1 "+24V" H 5115 6173 50  0000 C CNN
F 2 "" H 5100 6000 50  0001 C CNN
F 3 "" H 5100 6000 50  0001 C CNN
	1    5100 6000
	-1   0    0    1   
$EndComp
$Comp
L power:+6V #PWR0206
U 1 1 60D3218B
P 5650 6000
F 0 "#PWR0206" H 5650 5850 50  0001 C CNN
F 1 "+6V" H 5665 6173 50  0000 C CNN
F 2 "" H 5650 6000 50  0001 C CNN
F 3 "" H 5650 6000 50  0001 C CNN
	1    5650 6000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0207
U 1 1 60D32E42
P 6150 6000
F 0 "#PWR0207" H 6150 5850 50  0001 C CNN
F 1 "+5V" H 6165 6173 50  0000 C CNN
F 2 "" H 6150 6000 50  0001 C CNN
F 3 "" H 6150 6000 50  0001 C CNN
	1    6150 6000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP206
U 1 1 60D3392D
P 6650 6000
F 0 "TP206" H 6708 6118 50  0000 L CNN
F 1 "3.3V" H 6708 6027 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 6850 6000 50  0001 C CNN
F 3 "~" H 6850 6000 50  0001 C CNN
	1    6650 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0208
U 1 1 60D33CD8
P 6650 6000
F 0 "#PWR0208" H 6650 5850 50  0001 C CNN
F 1 "+3.3V" H 6665 6173 50  0000 C CNN
F 2 "" H 6650 6000 50  0001 C CNN
F 3 "" H 6650 6000 50  0001 C CNN
	1    6650 6000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP202
U 1 1 60D352E7
P 4500 6550
F 0 "TP202" H 4558 6668 50  0000 L CNN
F 1 "ISENSE" H 4558 6577 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 4700 6550 50  0001 C CNN
F 3 "~" H 4700 6550 50  0001 C CNN
	1    4500 6550
	1    0    0    -1  
$EndComp
Text GLabel 4600 6700 2    50   Input ~ 0
I_SENSE
Wire Wire Line
	4600 6700 4500 6700
Wire Wire Line
	4500 6700 4500 6550
$Comp
L Connector:TestPoint TP207
U 1 1 60D3BE83
P 5100 6550
F 0 "TP207" H 5158 6668 50  0000 L CNN
F 1 "TSENSE" H 5158 6577 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5300 6550 50  0001 C CNN
F 3 "~" H 5300 6550 50  0001 C CNN
	1    5100 6550
	1    0    0    -1  
$EndComp
Text GLabel 5150 6700 2    50   Input ~ 0
T_SENSE
Wire Wire Line
	5150 6700 5100 6700
Wire Wire Line
	5100 6700 5100 6550
$Comp
L power:GND #PWR?
U 1 1 60A76B0E
P 1600 6250
AR Path="/60A76B0E" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60A76B0E" Ref="#PWR0209"  Part="1" 
F 0 "#PWR0209" H 1600 6000 50  0001 C CNN
F 1 "GND" V 1605 6122 50  0000 R CNN
F 2 "" H 1600 6250 50  0001 C CNN
F 3 "" H 1600 6250 50  0001 C CNN
	1    1600 6250
	0    -1   -1   0   
$EndComp
Text GLabel 2900 6250 2    50   Output ~ 0
SHAKE_SENSE
Wire Wire Line
	2700 5950 2700 5900
Text Label 2300 6250 2    50   ~ 0
SHAKE
Connection ~ 2700 6250
Wire Wire Line
	2700 6250 2900 6250
$Comp
L power:+3.3V #PWR?
U 1 1 60B0B103
P 2700 5900
AR Path="/60B0B103" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B103" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 2700 5750 50  0001 C CNN
F 1 "+3.3V" H 2715 6073 50  0000 C CNN
F 2 "" H 2700 5900 50  0001 C CNN
F 3 "" H 2700 5900 50  0001 C CNN
	1    2700 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6250 2700 6250
Text GLabel 3300 7100 2    50   Output ~ 0
COLD_SENSE
Wire Wire Line
	3100 6800 3100 6750
Text Label 2700 7100 2    50   ~ 0
COLD
Connection ~ 3100 7100
Wire Wire Line
	3100 7100 3300 7100
$Comp
L power:+3.3V #PWR?
U 1 1 60B0B11B
P 3100 6750
AR Path="/60B0B11B" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60B0B11B" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 3100 6600 50  0001 C CNN
F 1 "+3.3V" H 3115 6923 50  0000 C CNN
F 2 "" H 3100 6750 50  0001 C CNN
F 3 "" H 3100 6750 50  0001 C CNN
	1    3100 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7100 3100 7100
$Comp
L Device:R R?
U 1 1 60B0B114
P 3100 6950
AR Path="/60B0B114" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B114" Ref="R209"  Part="1" 
F 0 "R209" H 3030 6904 50  0000 R CNN
F 1 "7.5K" V 3100 7050 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3030 6950 50  0001 C CNN
F 3 "~" H 3100 6950 50  0001 C CNN
	1    3100 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B10E
P 2850 7100
AR Path="/60B0B10E" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B10E" Ref="R207"  Part="1" 
F 0 "R207" H 2780 7054 50  0000 R CNN
F 1 "7.5K" V 2850 7200 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2780 7100 50  0001 C CNN
F 3 "~" H 2850 7100 50  0001 C CNN
	1    2850 7100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B0FC
P 2700 6100
AR Path="/60B0B0FC" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B0FC" Ref="R208"  Part="1" 
F 0 "R208" H 2950 6200 50  0000 R CNN
F 1 "7.5K" V 2700 6200 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2630 6100 50  0001 C CNN
F 3 "~" H 2700 6100 50  0001 C CNN
	1    2700 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B0B0F6
P 2450 6250
AR Path="/60B0B0F6" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B0B0F6" Ref="R206"  Part="1" 
F 0 "R206" V 2350 6350 50  0000 R CNN
F 1 "7.5K" V 2450 6350 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2380 6250 50  0001 C CNN
F 3 "~" H 2450 6250 50  0001 C CNN
	1    2450 6250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 60A8D67C
P 2700 6500
AR Path="/60A8D67C" Ref="C?"  Part="1" 
AR Path="/60AEC464/60A8D67C" Ref="C211"  Part="1" 
F 0 "C211" H 2815 6546 50  0000 L CNN
F 1 "10nF" H 2815 6455 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2738 6350 50  0001 C CNN
F 3 "~" H 2700 6500 50  0001 C CNN
	1    2700 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A8DC2F
P 3100 7300
AR Path="/60A8DC2F" Ref="C?"  Part="1" 
AR Path="/60AEC464/60A8DC2F" Ref="C212"  Part="1" 
F 0 "C212" H 3215 7346 50  0000 L CNN
F 1 "10nF" H 3215 7255 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3138 7150 50  0001 C CNN
F 3 "~" H 3100 7300 50  0001 C CNN
	1    3100 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A8DFE1
P 2700 6650
AR Path="/60A8DFE1" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60A8DFE1" Ref="#PWR0210"  Part="1" 
F 0 "#PWR0210" H 2700 6400 50  0001 C CNN
F 1 "GND" V 2705 6522 50  0000 R CNN
F 2 "" H 2700 6650 50  0001 C CNN
F 3 "" H 2700 6650 50  0001 C CNN
	1    2700 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A8E430
P 3100 7450
AR Path="/60A8E430" Ref="#PWR?"  Part="1" 
AR Path="/60AEC464/60A8E430" Ref="#PWR0211"  Part="1" 
F 0 "#PWR0211" H 3100 7200 50  0001 C CNN
F 1 "GND" V 3105 7322 50  0000 R CNN
F 2 "" H 3100 7450 50  0001 C CNN
F 3 "" H 3100 7450 50  0001 C CNN
	1    3100 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6350 2700 6250
Wire Wire Line
	3100 7150 3100 7100
$Comp
L Mechanical:MountingHole H201
U 1 1 60AAD1AD
P 8050 5000
F 0 "H201" H 8150 5000 50  0000 L CNN
F 1 "MountingHole" H 8150 4955 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 8050 5000 50  0001 C CNN
F 3 "~" H 8050 5000 50  0001 C CNN
	1    8050 5000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H202
U 1 1 60AADB96
P 8050 5250
F 0 "H202" H 8150 5250 50  0000 L CNN
F 1 "MountingHole" H 8150 5205 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 8050 5250 50  0001 C CNN
F 3 "~" H 8050 5250 50  0001 C CNN
	1    8050 5250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H203
U 1 1 60AADDAB
P 8050 5500
F 0 "H203" H 8150 5500 50  0000 L CNN
F 1 "MountingHole" H 8150 5455 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 8050 5500 50  0001 C CNN
F 3 "~" H 8050 5500 50  0001 C CNN
	1    8050 5500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H204
U 1 1 60AADF77
P 8050 5750
F 0 "H204" H 8150 5750 50  0000 L CNN
F 1 "MountingHole" H 8150 5705 50  0001 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 8050 5750 50  0001 C CNN
F 3 "~" H 8050 5750 50  0001 C CNN
	1    8050 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J203
U 1 1 60AD23B3
P 1400 6950
F 0 "J203" H 1480 6942 50  0000 L CNN
F 1 "T12_POWER" H 1480 6851 50  0000 L CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 1400 6950 50  0001 C CNN
F 3 "~" H 1400 6950 50  0001 C CNN
	1    1400 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0212
U 1 1 60AD2ED3
P 1200 7050
F 0 "#PWR0212" H 1200 6800 50  0001 C CNN
F 1 "GND" H 1205 6877 50  0000 C CNN
F 2 "" H 1200 7050 50  0001 C CNN
F 3 "" H 1200 7050 50  0001 C CNN
	1    1200 7050
	1    0    0    -1  
$EndComp
Text Label 1950 1200 0    50   ~ 0
V24SRC
$Comp
L power:+24V #PWR0127
U 1 1 60AE0D8D
P 1850 900
F 0 "#PWR0127" H 1850 750 50  0001 C CNN
F 1 "+24V" H 1865 1073 50  0000 C CNN
F 2 "" H 1850 900 50  0001 C CNN
F 3 "" H 1850 900 50  0001 C CNN
	1    1850 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60AEF598
P 1850 1050
AR Path="/60AEF598" Ref="R?"  Part="1" 
AR Path="/60AEC464/60AEF598" Ref="R217"  Part="1" 
F 0 "R217" H 1920 1096 50  0000 L CNN
F 1 "0" H 1920 1005 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1780 1050 50  0001 C CNN
F 3 "~" H 1850 1050 50  0001 C CNN
	1    1850 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1200 2200 1200
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 60AF7055
P 3500 1200
F 0 "#FLG0105" H 3500 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 3500 1373 50  0001 C CNN
F 2 "" H 3500 1200 50  0001 C CNN
F 3 "~" H 3500 1200 50  0001 C CNN
	1    3500 1200
	1    0    0    -1  
$EndComp
Connection ~ 3500 1200
Wire Wire Line
	3500 1200 3200 1200
$Comp
L Connector:TestPoint TP208
U 1 1 60B2EABF
P 5750 6550
F 0 "TP208" H 5808 6668 50  0000 L CNN
F 1 "CTRL" H 5808 6577 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5950 6550 50  0001 C CNN
F 3 "~" H 5950 6550 50  0001 C CNN
	1    5750 6550
	1    0    0    -1  
$EndComp
Text GLabel 5800 6700 2    50   Input ~ 0
HEATER_CTL
Wire Wire Line
	5800 6700 5750 6700
Wire Wire Line
	5750 6700 5750 6550
$Comp
L Device:R R?
U 1 1 60B76A3A
P 1100 4700
AR Path="/60B76A3A" Ref="R?"  Part="1" 
AR Path="/60AEC464/60B76A3A" Ref="R218"  Part="1" 
F 0 "R218" H 1350 4800 50  0000 R CNN
F 1 "7.5K" V 1100 4800 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1030 4700 50  0001 C CNN
F 3 "~" H 1100 4700 50  0001 C CNN
	1    1100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 4550 1100 4500
Connection ~ 1100 4500
Wire Wire Line
	1100 4500 1000 4500
$Comp
L power:GND #PWR0213
U 1 1 60B7DCE2
P 1100 4850
F 0 "#PWR0213" H 1100 4600 50  0001 C CNN
F 1 "GND" H 1105 4677 50  0000 C CNN
F 2 "" H 1100 4850 50  0001 C CNN
F 3 "" H 1100 4850 50  0001 C CNN
	1    1100 4850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
