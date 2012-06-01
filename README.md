# Launchpad + AIR BoosterPack on mspgcc #

This is a project to simplify the use of AIR BoosterPack by Anaren with mspgcc 'uniarch'. The purpose is to make the code portable, and forget about Anaren's unreadable code, and instead use the [TI slaa325a application note](http://www.ti.com/general/docs/litabsmultiplefilelist.tsp?literatureNumber=slaa325a).

Forked from [mobilar's code](https://github.com/mobilars/LarsRF-mspgcc).

# License #

The TI files are under the BSD License, as clearly stated per-file in its header.

# Original README #

This is the MSPGCC Branch of the code. It has a different directory structure and content.

This is a simple RF library for TI Launchpad w / RF Boosterpack running MSP430G2553.

I started writing my own library, but then I was told of a TI-library
with BSD-license that were more compatible across multiple chips. This library is at:

http://www.ti.com/general/docs/litabsmultiplefilelist.tsp?literatureNumber=slaa325a 
  
I have now deleted my original files, and have included the TI-files here as a
library under the directory /ti (so I'm not the copyright-holder of the files in
the /ti-directory, and not the original author). 

All files are licensed under BSD, including both the TI-files and my own. 
Please see the headers of the files for more information. I have made some 
modifications to the TI-files to make it work with the Launchpad and MSP430G2553

I am going to make a few test-apps that I will put under the directory /apps
These test-apps are based on test-code from TI, and are also available as BSD. 

Thanks to CorB for testing, contributing source code and helping out.

More information about my various projects at http://lars.roland.bz/
