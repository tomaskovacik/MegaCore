# MegaCore
An Arduino core for the ATmega64 and ATmega128, all running a [modified version of Optiboot](#write-to-own-flash). Major libraries such as SD, Servo, SPI and Wire are modified to work with this core. Still, a large amount of third-party libraries often works without any modifications. <br/>
This core requires at least Arduino IDE v1.6, where v1.6.5+ is recommended. <br/>
If you're into "pure" AVR programming, I'm happy to tell you that all relevant keywords are being highlighted by the IDE through a separate keywords file. Make sure to test the [example files](https://github.com/MCUdude/MegaCore/tree/master/avr/libraries/AVR_examples/examples) (File > Examples > AVR C code examples).

# Table of contents
* [Supported microcontrollers](#supported-microcontrollers)
* [Supported clock frequencies](#supported-clock-frequencies)
* [BOD option](#bod-option)
* [Programmers](#programmers)
* [Why add Arduino support for these microcontrollers?](#why-add-arduino-support-for-these-microcontrollers)
* [Write to own flash](#write-to-own-flash)
* [How to install](#how-to-install)
	- [Boards Manager Installation](#boards-manager-installation)
	- [Manual Installation](#manual-installation)
* [Pinout](#pinout)
* [Minimal setup](#minimal-setup)


## Supported microcontrollers:
* ATmega128*
* ATmega64*
 
(* All variants - A, L and so on)


## Why add Arduino support for these microcontrollers?
* They're dirt cheap (can be bought for less than a dollar at AliExpress and Ebay)
* They're still hand solderable (The TQFP variant have 0.8mm pin pitch)
* They're been around for more than a decade, and can be found in a lot of different equipment
* They got 53 IO pins (vs 32 for the [MightyCore](https://github.com/MCUdude/MightyCore) compatible ones and 86 for the ATmega1280/2560)


##Supported clock frequencies
* 20 MHz external oscillator
* 16 MHz external oscillator (default)
* 8 MHz external oscillator
* 8 MHz internal oscillator*
* 1 MHz internal oscillator

Select your microcontroller in the boards menu, then select the clock frequency. You'll have to hit "Burn bootloader" in order to set the correct fuses and upload the correct bootloader. <br/>
Make sure you connect an ISP programmer, and select the correct one in the "Programmers" menu. For time critical operations an external oscillator is recommended. 
</br></br>
*There might be some issues related to the internal oscillator. It's factory calibrated, but may be a little "off" depending on the calibration, ambient temperature and operating voltage. If uploading failes while using the 8 MHz internal oscillator you have three options:
* Edit the [boards.txt](https://github.com/MCUdude/MegaCore/blob/9793029aea382b41fc5dd81aa8af909fbf244026/avr/boards.txt#L48-L52) file and choose a precompiled bootloader with a higher or lower baudrate (115200, 57600 or 38400 baud)
* Upload the code using a programmer (USBasp, USBtinyISP etc.) or skip the bootloader
* Use the 1 MHz option instead 


##BOD option
Brown out detection, or BOD for short lets the microcontroller sense the input voltage and shut down if the voltage goes below the brown out setting. The ATmega64/128 haven't dedicated the BOD selection to extended fuse, so there's no way to only change the BOD option in the Arduino IDE. If you need to change this setting you'll have to edit the boards.txt file.


##Programmers
MegaCore does not adds its own copies of all the standard programmers to the "Programmer" menu. Just select one of the stock programmers in the "Programmers" menu, and you're ready to "Burn Bootloader" or "Upload Using Programmer".

 
Select your microcontroller in the boards menu, then select the clock frequency. You'll have to hit "Burn bootloader" in order to set the correct fuses and upload the correct bootloader. <br/>
Make sure you connect an ISP programmer, and select the correct one in the "Programmers" menu. For time critical operations an external oscillator is recommended.
 
##Write to own flash
A while ago [@majekw](https://github.com/majekw) announced that he'd [successfully modified the Optiboot bootloader](http://forum.arduino.cc/index.php?topic=332191.0) to let the running program permanently store content in the flash memory.
The flash memory is much faster than the EEPROM, and can handle about 10 000 write cycles. <br/>
With help from [majek](https://github.com/MCUdude/MegaCore/issues/6) this feature is working perfectly with the MegaCore! To enable this feature the bootloader needs to be replaced by the new one. Simply hit "Burn Bootloader", and it's done! <br/>
Please check out the [Optiboot flasher example](https://github.com/MCUdude/MegaCore/blob/9793029aea382b41fc5dd81aa8af909fbf244026/avr/libraries/Optiboot_flasher/examples/SerialReadWrite/SerialReadWrite.ino) for more info about how this feature works, and how you can try it on your MegaCore compatible microcontroller.


##How to install
#### Boards Manager Installation
This installation method requires Arduino IDE version 1.6.4 or greater.
* Open the Arduino IDE.
* Open the **File > Preferences** menu item.
* Enter the following URL in **Additional Boards Manager URLs**: `https://mcudude.github.io/MegaCore/package_MCUdude_MegaCore_index.json`
* Open the **Tools > Board > Boards Manager...** menu item.
* Wait for the platform indexes to finish downloading.
* Scroll down until you see the **MegaCore** entry and click on it.
  * **Note**: If you are using Arduino IDE 1.6.6 then you may need to close **Boards Manager** and then reopen it before the **MegaCore** entry will appear.
* Click **Install**.
* After installation is complete close the **Boards Manager** window.


#### Manual Installation
Click on the "Download ZIP" button in the upper right corner. Exctract the ZIP file, and move the extracted folder to the location "**~/Documents/Arduino/hardware**". Create the "hardware" folder if it doesn't exist.
Open Arduino IDE, and a new category in the boards menu called "MegaCore" will show up.


##Pinout
Since there are no standarized Arduino pinout for the ATmega64/128, I decided to create my own. I've tried to make it as simple and logical as possible. This pinout makes great sense if you're buying this [cheap breakout boards](http://www.ebay.com/itm/381547311629) at Ebay or AliExpress (just make sure to remove C3 in order to get auto reset working). The standard LED pin is assigned to Arduino pin 13 (PB5), and will blink twice if you hit the reset button. 
<b>Click to enlarge:</b> 
</br> </br>
<img src="http://i.imgur.com/dEnj88B.jpg" width="800">


##Minimal setup
Here is a simple schematic showing a minimal setup using an external crystal. Skip the crystal and the two 22pF capacitors if you're using the internal oscillator. <br/>
<img src="http://i.imgur.com/UIino8I.png" width="750">

