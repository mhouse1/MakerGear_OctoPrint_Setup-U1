; Configuration file for Duet Ethernet 
; Rev 14 03/20/19 JW/KG
; executed by the firmware on start-up
; Rev 14 - acceleration adjusment + temp limits
; Rev 13 - more speed adjusments
; Rev 12 - Many differenet changes tweaking settings (probing, temps)
; Rev 11 - changed the M208 Z maximum distance back to 350mm, from testing 50mm.  Changed by JW on KG direction.


; General preferences
M111 S0 							 ; Debugging off

G90                                  ; Send absolute coordinates...
M83                                  ; ...but relative extruder moves
M555 P2 ; Set firmware compatibility to look like marlin
; Network
M550 PU1P3                           ; Set machine name
M551 Pftppass

;M552 P0.0.0.0 S1                     ; Enable network and acquire dynamic address via DHCP
M552 S1 P172.16.31.5
M553 P255.255.255.0
M554 P172.16.31.4

M586 P0 S1                           ; Enable HTTP
M586 P1 S1                           ; Enable FTP
M586 P2 S1                           ; Enable Telnet

; Drives

M569 P0 S1 ; Drive 0 goes forwards ET0
M569 P1 S0 ; Drive 1 goes forwards X1/ U
M569 P2 S0 ; Drive 2 goes backwards X0
M569 P3 S1 ; Drive 3 goes forwards Z0
M569 P4 S1 ; Drive 4 goes forwards Z1
M569 P5 S0 ; Drive 5 goes forwards y
M569 P6 S1 ; Drive 6 goes forwards y
M569 P7 S1 ; Drive 7 goes forwards ET1
M569 P8 S1 ; Drive 8 goes forwards Z
M569 P9 S1 ; Drive 9 goes forwards Z

M584 X2 Y5:6 Z3:4:8:9 U1 E0:7 		 		; Apply custom drive mapping
M350 X16 Y16 Z16 U16 E16:16 I1           	; Configure microstepping with interpolation
M92 X80.1 Y80.1 U80.1 Z1007.7 E471.5:471.5 		; Set steps per mm
M566 X100 Y100 Z60 U100 E120:120          	; Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z600 U18000 E1800:1800 	; Set maximum speeds (mm/min)
M201 X1000 Y1000 Z10 U1200 E2000:2000 		; Set accelerations (mm/s^2)
M204 P2000 T2000							;max travel and priunting acceleration overide
M906 X1450 Y1450 Z1450 U1450 E950:950 		; Set motor currents (mA) and motor idle factor in per cent
M84 S0 										; Disable motor idle current reduction
	
; Axis Limits
M208 X-71.3 Y11 Z0 U0 S1 			 ; Set axis minima
M208 X410 Y340 Z350 U457 S0          ; Set axis maxima;
;M208 X520 Y340 Z350 U457 S0          ; Set axis maxima

; Endstops
M574 X1 Y2 U2 S1                     ; Set active high endstops

; Z-Probe
M574 Z1 S2                           ; Set endstops controlled by probe
M307 H7 A-1 C-1 D-1                  ; Disable 7th heater on PWM channel for BLTouch
M307 H3 A-1 C-1 D-1                  ; Disable 7th heater on PWM channel for BLTouch

M558 P9 H4 F400 T8000 B1 A2 S1               ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X21.0 Y0.0 Z0.0 U0.0            ; Set Z probe trigger value, offset and trigger height
M557 X15:390 Y15:340 S75:65         ; Define mesh grid
M671 X-131.6482:550.7482:-131.6482:550.7482 Y546.1:546.1:-76.2:-76.2 S4 ; four corner z motor points for auto leveling

; Heaters

M140 P0 H0		;Heater Pad 3 Tie the bed (H0) heater and thermistor to P0 as a bed heater. This is so by default but included for visual consistecy in this file.
M140 P1 H4		;Heater Pad 2+4 Tie the E4 (H5) heater and thermistor to P5 as a bed heater. 
M140 P2 H5		;Heater Pad 1  Tie the E5 (H6) heater and thermistor to P6 as a bed heater. 
M140 P3 H6		;Heater Pad 5 Tie the E5 (H6) heater and thermistor to P6 as a bed heater. 




;heater pad 3 = Heater # 0
M305 P0 R4700 T100000 B4138 C0        ; Set thermistor + ADC parameters for heater 0
M143 H0 S145                         ; Set temperature limit for heater 0 to 145C

;Extrduer Heater 0 = Heater # 1
M305 P1 T100000 B4138 C0 R4700       ; Set thermistor + ADC parameters for heater 1
M143 H1 S310                         ; Set temperature limit for heater 1 to 300C

;Extrduer Heater 1 = Heater # 2
M305 P2 T100000 B4138 C0 R4700       ; Set thermistor + ADC parameters for heater 2
M143 H2 S310                         ; Set temperature limit for heater 2 to 300C

;heater #3 unused, eventually will be used for pad #2


;heater pad 2+4 = Heater # 4
M305 P4 R4700 T100000 B4138 C0
M143 H4 S145                         ; Set temperature limit for heater 0 to 145C   

;heater pad 1 = Heater # 5
M305 P5 R4700 T100000 B4138 C0
M143 H5 S145                         ; Set temperature limit for heater 0 to 145C   

;heater pad 5 = Heater # 6
M305 P6 R4700 T100000 B4138 C0
M143 H6 S145                         ; Set temperature limit for heater 0 to 145C   


M570 H0 S1200
M570 H4 S1200
M570 H5 S1200
M570 H6 S1200


M307 H0 A90.0 C700.0 D10.0 B1
M307 H4 A90.0 C700.0 D10.0 B1
M307 H5 A90.0 C700.0 D10.0 B1
M307 H6 A90.0 C700.0 D10.0 B1

; Fans
M106 P0 S0 I0 F500 H-1 C"T0F0"             			  ;T0 Fan0          Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1.0 I0 F500 H1 T45  C"T0F1"         		  ;T0 Fan1          Set fan 100% value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S0 I0 F500 H-1  C"ENCLOSURE"          		  ;Enclosure Fan    Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P3 S0 I0 F500 H-1  C"T1F0"                       ;T1 Fan0          Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P4 S1.0 I0 F500 H2 T45   C"T1F1"                 ;T1 Fan1          Set fan 100% value, PWM signal inversion and frequency. Thermostatic control is turned on

M106 P7 S1.0 I0 F500 H-1   C"ELECTRONICS0"            ;Electronics 0    Set fan 100% value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P8 S1.0 I0 F500 H-1   C"ELECTRONICS1"            ;Electronics 1    Set fan 100% value, PWM signal inversion and frequency. Thermostatic control is turned off




; Tools
M563 P0 D0 H1 F0                        ; Define tool 0
G10 P0 X0.0 Y0.0 Z0.0                      ; Set tool 0 axis offsets
G10 P0 R0 S0                         ; Set initial tool 0 active and standby temperatures to 0C
M563 P1 D1 H2 X3 F3                        ; Define tool 1
G10 P1 U0.0 Y0.0 Z0.0                     ; Set tool 1 axis offsets
G10 P1 R0 S0                         ; Set initial tool 1 active and standby temperatures to 0C

M563 P2 D0:1 H1:2 X0:3 F0:3 ; tool 2 uses both extruders and hot end heaters, maps X to both X and U, and uses both print cooling fans

G10 P2 X0 Y0 U-203.2    ; set tool offsets and temperatures for tool 2
G10 P2 R0 S0                         ; Set initial tool 1 active and standby temperatures to 0C

M567 P2 E1:1 ; set mix ratio 100% on both extruders
M568 P2 S1 ; turn on mixing for tool 2

; Automatic saving after power loss is not enabled

; Custom settings are not configured


;stall detection
M915 Z S3 F0 ; low z value, no filtering - for checking if we bottom out on Z

M581 T2 E2 C0 S1 ; Trigger 2, e2 endstop, always trigger/look, falling edge
M582 T2 ; check for button being pressed down, eternally reset if its on
M501
T0