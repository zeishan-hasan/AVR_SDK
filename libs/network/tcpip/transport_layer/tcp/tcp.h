#ifndef TCP_H
#define TCP_H
#include <stdint.h>
#include <macros.h>
#include <utils.h>
/* TCP Header
+---+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 |
+---+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
|                              Source Port                            |                                Destination Port                               |
+---------------+-----------+-----------+-----------------------------+-------------------------------------------------------------------------------+
|                                                                Sequence Number                                                                      |
+---------------+-----------+-----------+-----------------------------+-------------------------------------------------------------------------------+
|                                                             Acknowledgment Number                                                                   |
+---------------+-----------+-----------+-----------------------------+-------------------------------------------------------------------------------+
|  Data Offset  | reserved  |    ECN    |         Control Bits        |                                    Window                                     |
+---------------+-----------+-----------+-----------------------------+-------------------------------------------------------------------------------+
|                           Checksum                                  |                                  Urgent Pointer                               |
+---------------------------------------------------------------------+-------------------------------------------------------------------------------+
|                                                               Option and Padding                                                                    |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+
*/
struct tcp_header_t
{
	u16t srcPort;
	u16t dstPort;
	u32t seqNumber;
	u32t ackNumber;
	u8t dataOffset:4;
	const u8t reserved:3;
	u8t ECN:3; // Explicit Congestion Notification. 3 bits.
	u8t controlBits:6;
	u16t window; // The number of data bytes beginning with the one indicated in the acknowledgment field which the sender of this segment is willing to accept.
	u16t crc;
	u16t urgetPointer; //If the URG bit is set, this field points to the sequence number of the last byte in a sequence of urgent data.
	u32t option_pad;
};
enum class ECN
{
	NONCE_SUM 	= (1 << 0),
	CWR								= (1 << 1),
	ECN_ECHO   = (1 << 2)

};
enum class TCP_CONTROL_BITS
{
	URG = (1 << 0),
	ACK = (1 << 1),
	PSH = (1 << 2),
	RST = (1 << 3),
	SYN = (1 << 4),
	FIN = (1 << 5)
};

class Tcp
{
public:
	Tcp();
};

#endif // TCP_H
