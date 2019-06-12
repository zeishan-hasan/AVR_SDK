#ifndef ARP_H
#define ARP_H
#include <stdint.h>
#include <macros.h>
#include <utils.h>
/* ARP Header
+---+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 |
+---+---+---+---+---+---+---+---+---+---+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
|                          Hardware type                              |                                  Protocol type                                |
+-------------------------------+-------------------------------------+-------------------------------------------------------------------------------+
| Hardware address length       |       Protocol address length       |                                     Opcode                                    |
+-------------------------------+-------------------------------------+-------------------------------------------------------------------------------+
|                                                          Source hardware address                                                                    |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                          Source protocol address                                                                    |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                        Destination hardware address                                                                 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                        Destination protocol address                                                                 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------+
*/
#pragma pack(1)
struct arp_header_t{
	u16t hardwareType;
	u16t protocolType;
	u8t hw_addr_length;
	u8t proto_addr_length;
	u16t opcode;
	u32t src_hw_addr;
	u32t src_proto_addr;
	u32t dst_hw_addr;
	u32t dst_proto_addr;
};

enum class HARDWARE_TYPE {
	ETHERNET																	 = 0x01,
	EXPERIMENTAL_ETHERNET					=	0x02,
	AMATEUR_RADIO_AX_25							=	0x03,
	PROTEON_PRONET_TOKEN_RING	=	0x04,
	CHAOS																					=	0x05,
	IEEE802																			=	0x06,
	ARCNET_RFC_1201											=	0x07,
	HYPERCHANNEL														=	0x08,
	LANSTAR																			=	0x09,
	AUTONET_SHORT_ADDRESS					=	0x0A,
	LOCALTALK																	=	0x0B,
	LOCALNET																		=	0x0C,	//(IBM PCNET OR SYTEK LOCALNET)
	ULTRA_LINK																=	0x0D,
	SMDS																						=	0x0E,
	FRAME_RELAY															=	0x0F,
	ATM0 																					=	0x10,
	HDLC																						=	0x11,
	FIBRE_CHANNEL													=	0x12,
	ATM1																						=	0x13,
	SERIAL_LINE															=	0x14,
	ATM2																						=	0x15,
	MIL_STD_188_220											=	0x16,
	METRICOM																		=	0x17,
	IEEE_1394_1995												=	0x18,
	MAPOS																					=	0x19,
	TWINAXIAL																	=	0x1A,
	EUI_64																				=	0x1B,
	HIPARP																				=	0x1C,
	IP_ARP_OVER_ISO7816_3					=	0x1D,
	ARPSEC																				=	0x1E,
	IPSEC_TUNNEL														=	0x1F,
	INFINIBAND																=	0x20,
	CAI																							=	0x21, //TIA-102 PROJECT 25 COMMON AIR INTERFACE
	WIEGAND_INTERFACE									=	0x22,
	PURE_IP																			=	0x23,
	HW_EXP1																			=	0x24,
	HW_EXP2																			=	0x100
};

/* REMOVE ME! THIS IS ETHERNET!
enum class PROTOCOL_TYPE : uint16_t {
	IPV4																																					= 0x0800,
	ARP																																						= 0x0806,
	WAKE_ON_LAN																														= 0x0842,
	IETF_TRILL																															= 0x22F3,
	STREAM_RESERVATION_PROTOCOL														= 0x22EA,
	DEC_MOP_RC																															= 0x6002,
	DECNET_PHASE_IV_DNA_ROUTING														= 0x6003,
	RARP																																					= 0x8035,
	APPLETALK_ETHERTALK																						= 0x809B,
	AARP																																					= 0x80F3,
	IEEE802_1QAND802_1AQ																					= 0x8100,
	SLPP																																					= 0x8102,
	IPX																																						= 0x8137,
	QNX_QNET																																	= 0x8204,
	IPV6																																					= 0x86DD,
	ETHERNET_FLOW_CONTROL																				= 0x8808,
	ETHERNET_SLOW_PROTOCOLS																		= 0x8809,
	COBRANET																																	= 0x8819,
	MPLS_UNICAST																													= 0x8847,
	MPLS_MULTICAST																											= 0x8848,
	PPPOE_DISCOVERY_STAGE																				= 0x8863,
	PPPOE_SESSION_STAGE																						= 0x8864,
	INTEL_ADVANCED_NETWORKING_SERVICES							= 0x886D,
	JUMBO_FRAMES																													= 0x8870,
	HOMEPLUG_1_0_MME																									= 0x887B,
	EAP_OVER_LAN_IEEE802_1X																		= 0x888E,
	PROFINET_PROTOCOL																								= 0x8892,
	HYPERSCSI																																= 0x889A,
	ATA_OVER_ETHERNET																								= 0x88A2,
	ETHERCAT_PROTOCOL																								= 0x88A4,
	PROVIDER_BRIDGING_SHORTEST_PATH_BRIDGING	= 0x88A8,
	ETHERNET_POWERLINK																							= 0x88AB,
	GOOSE																																				= 0x88B8,
	GSE_MANAGEMENT_SERVICES																		= 0x88B9,
	SV																																							= 0x88BA,
	LLDP																																					= 0x88CC,
	SERCOS_III																															= 0x88CD,
	WSMP																																					= 0x88DC,
	HOMEPLUG_AV_MME																										= 0x88E1,
	MEDIA_REDUNDANCY																									= 0x88E3,
	MAC_SECURITY																													= 0x88E5,
	PROVIDER_BACKBONE_BRIDGES																= 0x88E7,
	PRECISION_TIME_PROTOCOL_OVER_ETHERNET				= 0x88F7,
	NC_SI																																				= 0x88F8,
	PRP																																						= 0x88FB,
	CONNECTIVITY_FAULT_MANAGEMENT												= 0x8902,
	FIBRE_CHANNEL_OVER_ETHERNET														= 0x8906,
	FCOE_INITIALIZATION_PROTOCOL													= 0x8914,
	RDMA_OVER_CONVERGED_ETHERNET													= 0x8915,
	TTETHERNET_PROTOCOL_CONTROL_FRAME								= 0x891D,
	HIGH_AVAILABILITY_SEAMLESS_REDUNDANCY				= 0x892F,
	ETHERNET_CONFIGURATION_TESTING_PROTOCOL		= 0x9000,
	IEEE_802_1Q_DOUBLE_TAGGING															= 0x9100,
	LOW_LATENCY_TRANSPORT																				= 0xCAFE
};
*/
enum class OPCODE{
	REQUEST																 = 0x01,
	REPLY																		 = 0x02,
	REQUEST_REVERSE								 = 0x03,
	REPLY_REVERSE										 = 0x04,
	DRARP_REQUEST										 = 0x05,
	DRARP_REPLY												 = 0x06,
	DRARP_ERROR												 = 0x07,
	INARP_REQUEST										 = 0x08,
	INARP_REPLY												 = 0x09,
	ARP_NAK																 = 0x0A,
	MARS_REQUEST											 = 0x0B,
	MARS_MULTI													 = 0x0C,
	MARS_MSERV													 = 0x0D,
	MARS_JOIN														 = 0x0E,
	MARS_LEAVE													 = 0x0F,
	MARS_NAK															 = 0x10,
	MARS_UNSERV												 = 0x11,
	MARS_SJOIN													 = 0x12,
	MARS_SLEAVE												 = 0x13,
	MARS_GROUPLIST_REQUEST  = 0x14,
	MARS_GROUPLIST_REPLY			 = 0x15,
	MARS_REDIRECT_MAP						 = 0x16,
	MAPOS_UNARP												 = 0x17,
	OP_EXP1																 = 0x18,
	OP_EXP2																 = 0x19,
};


#pragma pop
class Arp
{
public:
	Arp();
	~Arp();
};

#endif // ARP_H
/*





























*/
