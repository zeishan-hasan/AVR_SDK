# AVR_SDK

This is my concept of AVR programming.

### Supported microcontroller
  atmega2560
#
In future others boards will be supported.
This libraries are shared as is, without any warranty.

## Getting Started
### Prerequisites

First of all install some dependencies:

#### Ubuntu 18.04.1 LTS
```
sudo apt install libftdi1 libusb-0.1-4 binutils-avr gcc-avr avr-libc avrdude
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### Makefile usage
```
  Usage:

    make <target> [flags...]

  Targets:

    clean        Remove all build files
    help         Show this help prompt.
    monitor      Open putty with selected port
    ota          Remote upload
    rawMonitor   Open terminal in raw mode
    upload       Local upload

  Flags:

    COM_BAUDRATE      Com Baudrate (default: 1000000)
    COM_PORT          Com Port (default: /dev/ttyUSB0)
    FLASH_BAUDRATE    Flash Baudrate (default: 115200)
    FLASH_PORT        Flash port (default: /dev/ttyUSB0)

  Example:

    make upload FLASH_PORT=/dev/ttyACM0 FLASH_BAUDRATE=115200
    make monitor COM_PORT=/dev/ttyACM0 COM_BAUDRATE=1000000
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
