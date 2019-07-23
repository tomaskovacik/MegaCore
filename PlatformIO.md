# PlatformIO

[PlatformIO](https://platformio.org) is an open source ecosystem for embedded development. 
It has a built-in library manager and is Arduino compatible. It supports most operating systems; Windows, MacOS, Linux 32 and 64-bit; ARM and X86.  
And best of all, MegaCore is supported!

* [What is PlatformIO?](http://docs.platformio.org/en/latest/what-is-platformio.html)
* [PlatformIO IDE](http://platformio.org/#!/platformio-ide)
* Getting started with [PlatformIO IDE](http://docs.platformio.org/en/latest/ide/atom.html#quick-start) or [PlatformIO command line interface](http://docs.platformio.org/en/latest/quickstart.html)
* [Advanced functionality](http://docs.platformio.org/en/latest/platforms/atmelavr.html) 
* [Project Examples](http://docs.platformio.org/en/latest/platforms/atmelavr.html#examples)


## MegaCore + PlatformIO 
At the moment it is not possible to burn the bootloader or set fuses using PlatformIO. You will still have to use Arduino IDE for this. 
However, PlatformIO really shows its stength when working on large projects, often with a lot of dependencies. 
I've made a simple platformio.ini template you can use when creating a project for a MegaCore compatible device. The most common functionality is available through this template.
For more information about the `build` option, check out PlatformIO's [Project Configuration File Doc page](https://docs.platformio.org/page/projectconf.html).

``` ini
; PlatformIO Project Configuration File for MegaCore
; https://github.com/MCUdude/MegaCore/
;
;   Build options: build flags, source filter
;   Upload options: custom upload port, speed, and extra flags
;   Library options: dependencies, extra library storages
;   Advanced options: extra scripting
;
; Please visit documentation for the other options
; https://github.com/MCUdude/MegaCore/PlatformIO.md
; https://docs.platformio.org/page/projectconf.html


; ENVIRONMENT SETTINGS
[env:MegaCore]
platform = atmelavr
framework = arduino

; TARGET SETTINGS
; PlatformIO requires the board parameter. Must match your actual hardware
board = ATmega128
; Clock frequency in [Hz]
board_build.f_cpu = 16000000L

; BUILD OPTIONS
; Comment out to enable LTO (this line unflags it)
build_unflags = -flto
; Extra build flags
build_flags = 

; UPLOAD SETTINGS
; Upload serial port is automatically detected by default. Override by uncommenting the line below
;upload_port = /dev/cu.usbserial*
; Upload baud rate
board_upload.speed = 115200

; Upload using programmer
;upload_protocol = usbasp
; Aditional upload flags
;upload_flags = -Pusb

; SERIAL MONITOR OPTIONS
; Monitor and upload port is the same by default
;monitor_port = 
; Serial monitor baud rate
monitor_speed = 9600
```


### `board`
PlatformIO requires the `board` parameter to be present.
The table below shows what board name should be used for each target

| Target                                         | Board name |
|------------------------------------------------|------------|
| ATmega2561/V                                   | ATmega2561 |
| ATmega2560/V                                   | ATmega2560 |
| ATmega1281/V                                   | ATmega1281 |
| ATmega1280/V                                   | ATmega1280 |
| ATmega640/V                                    | ATmega640  |
| ATmega128/A                                    | ATmega128  |
| ATmega64/A                                     | ATmega64   |
| AT90CAN128                                     | AT90CAN128 |
| AT90CAN64                                      | AT90CAN64  |
| AT90CAN32                                      | AT90CAN32  |



### `board_build.f_cpu`
Holds the main clock frequency in [Hz]. 
Note that the clock frequency and upload baud rate will have to match if uploading using a serial bootloader.  
Below is a table with the default clocks and baud rates for MightyCore:

| Clock speed | Oscillator | board_build.f_cpu | board_upload.speed |
|-------------|------------|-------------------|--------------------|
| 20 MHz      | External   | 20000000L         | 115200             |
| 18.4320 MHz | External   | 18432000L         | 115200             |
| 16 MHz      | External   | 16000000L         | 115200             |
| 14.7456 MHz | External   | 14745600L         | 115200             |
| 12 MHz      | External   | 12000000L         | 57600              |
| 11.0592 MHz | External   | 11059200L         | 115200             |
| 8 MHz       | External   | 8000000L          | 57600              |
| 7.3728  MHz | External   | 7372800L          | 115200             |
| 3.6864  MHz | External   | 3686400L          | 115200             |
| 1.8432  MHz | External   | 1843200L          | 115200             |
| 8 MHz       | Internal   | 8000000L          | 38400              |
| 1 MHz       | Internal   | 1000000L          | 9600               |


### `board_build.variant`
Holds the current pinout in use. Alternative pinout is only avaiable for ATmega640/1280/2560, So this parameter isn't really needed if you're not using the 100-pin AVR pinout.
See [pinout pics](https://github.com/MCUdude/MegaCore#pinout) for more info.

| Target                                                                                                        | Default pinout                  | Alternative pinout     |
|---------------------------------------------------------------------------------------------------------------|---------------------------------|------------------------|
| ATmega2560/V <br/>ATmega1280/V <br/>ATmega640/V                                                               | `megacore_100-pin-arduino-mega` | `megacore_100-pin-avr` |
| ATmega2561/V <br/>ATmega1281/V <br/>ATmega128/A <br/>ATmega64/A <br/>AT90CAN128 <br/>AT90CAN64 <br/>AT90CAN32 | `megacore_100-pin-avr`          |                        |


### `build_unflags`
This parameter is used to unflag. Since LTO is enabled by default in PlatformIO we may disable it by unflagging `-flto`.

### `build_flags`
This parameter is used to set compiler flags. This is useful if you want to for instance want to chage the serial RX or TX buffer. Here's a list of the current available core files flags:

| Flag                        | Default size | Description                                               |
|-----------------------------|--------------|-----------------------------------------------------------|
| -DSERIAL_RX_BUFFER_SIZE=128 | 64 bytes     | Sets the serial RX buffer to 128 bytes                    |
| -DSERIAL_TX_BUFFER_SIZE=128 | 64 bytes     | Sets the serial TX buffer to 128 bytes                    |
| -DTWI_BUFFER_SIZE=64        | 32 bytes     | Sets the TWI (i2c) buffer to 64 bytes                     |
| -DTWI1_BUFFER_SIZE=64       | 32 bytes     | Sets the TWI1 (i2c) buffer to 64 bytes (ATmega324PB only) |

**Example:**
`build_flags = -DSERIAL_RX_BUFFER_SIZE=128 -DSERIAL_TX_BUFFER_SIZE=128`


### `upload_port`
Holds the serial port used for uploading. PlatformIO automatically detects the serial port. However, uf you want to ovverride this you can uncomment `upload_port`. Use `/dev/[port]` on Unix compatible systems, and use `COMx` on Windows.


### `board_upload.speed`
Upload baudrate. See [board_build.f_cpu](#board_buildf_cpu) for more details.


### `upload_protocol`
Used when using a programmer rather than using a USB to serial adapter.  
Supports all Avrdude compatible programmers such as `usbasp`, `usbtiny` and `stk500v1`.


### `upload_flags`
Used to pass extra flags to Avrdude when uploading using a programmer.  
Typical parameters are `-PUSB`, `-B[clock divider]` and `-b[baudrate]`


### `monitor_port`
PlatformIO detects serial ports automatically. However, if you want to override this you can uncomment `monitor_port`. Use `/dev/[port]` on Unix compatible systems, and use `COMx` on Windows.


### `monitor_speed`
Sets the serial monitor baud rate. Defaults to 9600 if not defined.
