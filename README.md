# PyInstaller Example

## Overview

[PyInstaller|https://pyinstaller.org/] is a program used to batch up a python program into a single executable.  See the web site for more info about it.

Customers using PyInstaller run into problems with it when using embedded python because PyInstaller tries to pack up the `iris` library, which needs to run from the IRIS installdir.

This library shows how (at least in Linux) to avoid packaging `iris` and to tell the resulting packaged installer to use it from the iris insatlldir.

## Setup

* Make sure that iris is installed and the environment vars are set correctly.  Example Dockerfile provided be sure to run it like this `docker run iris-embedded-pyinstaller --check-caps false`
* Install python3
* Install pyinstaller `pip3 install pyinstaller`
* Install the libraries used in this example `pip3 install tqdm colorama` 

You should now be able to `python3 irisbench.py` successfully.  

## Using PyInstaller

PyInstaller needs to be told to ignore the `iris` library and to run a bit of code to add the right directories to the python path at runtime.

* Build the package `/home/irisowner/.local/bin/pyinstaller irisbench.py --exclude-module iris --runtime-hook=runtimehook.py`
* Run the package `dist/irisbench/irisbench`

That's it!
