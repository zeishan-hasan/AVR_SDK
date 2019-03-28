#ifndef I2CMASTER_H
#define I2CMASTER_H
#include <util/twi.h>
#include <avr/iom2560.h>
#ifndef F_CPU
#define F_CPU 16000000UL
#endif


#define F_SCL 100000UL // SCL frequency
#define Prescaler 1
#define TWBR_val ((((F_CPU / F_SCL) / Prescaler) - 16 ) / 2)

#define I2C_READ 0x01
#define I2C_WRITE 0x00

class I2CMaster
{
public:
	I2CMaster();

	void init();
	uint8_t start(uint8_t address);
	uint8_t write(uint8_t data);
	uint8_t read_ack(void);
	uint8_t read_nack(void);
	uint8_t transmit(uint8_t address, uint8_t* data, uint16_t length);
	uint8_t receive(uint8_t address, uint8_t* data, uint16_t length);
	uint8_t writeReg(uint8_t devaddr, uint8_t regaddr, uint8_t* data, uint16_t length);
	uint8_t readReg(uint8_t devaddr, uint8_t regaddr, uint8_t* data, uint16_t length);
	void stop(void);

};

#endif
