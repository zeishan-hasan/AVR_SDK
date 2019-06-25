#include "avr_sdk.h"

bool debug = false;
#define MISO 50
#define MOSI 51
#define SCK 52
#define SS 53
int main(){
	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	serial0->clear();
	Enc28j60 encj2860;
	encj2860.setSPI(MISO,MOSI,SCK,SS);
	encj2860.init();

	//encj2860.setMAC(std::vector<uint8_t>{0xAA,0xBB,0xCC,0xDD,0xEE,0xFF});
	//std::vector<uint8_t> a{0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	//u8t c[] = {0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	//encj2860.setMAC(c);
	//macaddr_t mac = encj2860.getMAC();
	//if(memcmp(c, mac._mac, MACADDR_N_OCTECTS) == 0){
	//	serial0->printf("Mac set ok\r\n");
	//}


	u8t frameLittle[] = {
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xA0, 0xB1, 0xC2, 0xD3, 0xE4, 0xF5,
		0x08, 0x06, 0x00, 0x01, 0x08, 0x00,
		0x06, 0x04, 0x00, 0x01, 0xA0, 0xB1,
		0xC2,	0xD3, 0xE4, 0xF5, 0xC0, 0xA8,
		0x02,	0xC8, 0x00, 0x00, 0x00, 0x00,
		0x00,	0x00, 0xC0, 0xA8, 0x02, 0x01
	};
	u8t frameBig[] = {
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xF5, 0xE4, 0xD3, 0xC2, 0xB1, 0xA0,
		0x06, 0x08, 0x01, 0x00, 0x00, 0x08,
		0x04, 0x06, 0x01, 0x00, 0xF5, 0xE4,
		0xD3,	0xC2, 0xB1, 0xA0, 0xC8, 0x02,
		0xA8,	0xC0, 0x00, 0x00, 0x00, 0x00,
		0x00,	0x00, 0x01, 0x02, 0xA8, 0xC0
	};

	/*
ff ff ff ff ff ff
40 62 31 02 f8 51
08 06 00 01 08 00
06 04 00 01 40 62
31 02 f8 51 c0 a8
02 01 00 00 00 00
00 00 c0 a8 02 c8


*/
	u8t _dst[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
	u8t _src[] = {0xA0, 0xB1, 0xC2, 0xD3, 0xE4, 0xF5};
	macaddr_t dst((char*)_dst);
	macaddr_t src((char*)_src);

	eth_frame_t eth(dst, src);
	eth.etherType = 0x0608;

	arp_header_t arp;
	arp.hardwareType = 0x0100;
	arp.protocolType = 0x0008;
	arp.hw_addr_length = 6;
	arp.proto_addr_length = 4;
	arp.opcode = 0x0100;
	arp.src_hw_addr = (u64t)__inet_eth_aton("A0:B1:C2:D3:E4:F5")._mac;//0xF5E4D3C2B1A0;
	//arp.src_proto_addr = 0xC0A802C8;
	arp.src_proto_addr = __inet_ipv4_aton("192.168.2.200").ip;//0xC802A8C0;
	arp.dst_hw_addr = 0;
	//arp.dst_proto_addr = 0xC0A80201;
	arp.dst_proto_addr = __inet_ipv4_aton("192.168.2.1").ip;//0x0102A8C0;
	//arp.dst_proto_addr = 0x0102A8C0;

	std::vector<u8t> ptr;
	ptr.insert(ptr.begin(), (u8t*)&eth, (u8t*)&eth+sizeof(eth));
	ptr.insert(ptr.end(), (u8t*)&arp, (u8t*)&arp+sizeof(arp));



	//u8t mac[6];
	//encj2860._spi_getMAC(mac);
	//for(size_t i = 0; i < 6; ++i){
	//	serial0->printf("Data[%u] 0x%02X\r\n", i, mac[i]);
	//}


	//	for(size_t i = 0; i < SIZE_OF_ARRAY(frame); ++i){
	//		if(i % 15 == 0){
	//			serial0->printf("\r\n");
	//		}
	//		serial0->printf("[%02u] 0x%02X ", i, frame[i]);
	//	}
	//	serial0->printf("\r\n");
	//	__swapEndian(frame, 4, SIZE_OF_ARRAY(frame));
	//	for(size_t i = 0; i < SIZE_OF_ARRAY(frame); ++i){
	//		if(i % 15 == 0){
	//			serial0->printf("\r\n");
	//		}
	//		serial0->printf("[%02u] 0x%02X ", i, frame[i]);
	//	}
	//encj2860._spi_selectBank(3);
	u8t buff[128];

	//for(size_t i = 0; i < SIZE_OF_ARRAY(frameLittle); ++i){
	//	if(i % 15 == 0){
	//		serial0->printf("\r\n");
	//	}
	//	serial0->printf("[%02u] 0x%02X ", i, buff[i]);
	//}

	//encj2860.sendPacket(frameLittle, SIZE_OF_ARRAY(frameLittle));
	while(1){
	encj2860.sendPacket(ptr.begin(), ptr.size());
		//if(encj2860.isLinkUp()) {
			//serial0->printf("Sending...\r\n");
			//encj2860.sendPacket(frameBig, SIZE_OF_ARRAY(frameBig));
			//encj2860.sendPacket(frameLittle, SIZE_OF_ARRAY(frameLittle));
			//if(encj2860.isReceivingData()){
			//	u16t size = encj2860.receivePacket(buff, SIZE_OF_ARRAY(buff));
			//	//encj2860._spi_readBuffer(buff, SIZE_OF_ARRAY(buff));
			//	arp_header_t _arp;
			//	//__swapEndian(buff, 42, 4);
			//	//__swapEndian(buff, 42, 2);
			//	//memcpy((u8t*)&arp, buff, sizeof(arp));
			//	//serial0->printf("IP src %ld", _arp.dst_hw_addr);
			//	//serial0->printf("IP dst %ld", _arp.src_hw_addr);
			//	for(u16t i = 0; i < size; ++i){
			//		if(i % 15 == 0){
			//			serial0->printf("\r\n");
			//		}
			//		serial0->printf("[%02u] 0x%02X ",i , buff[i]);
			//	}
			//}
		//}
		//else {
		//	//serial0->printf("Link is down\r\n");
		//}

		//encj2860._spi_readBuffer(buff, SIZE_OF_ARRAY(buff));
		////
		//for(u8t i = 0; i < SIZE_OF_ARRAY(buff); ++i){
		//	if(i % 15 == 0){
		//		serial0->printf("\r\n");
		//	}
		//	serial0->printf("[%02u] 0x%02X ",i , buff[i]);
		//}
		//serial0->printf("\r\n");
		//serial0->printf("Check for link 0x%04X\r\n", encj2860._spi_readPhy(REG_PHSTAT2));
		//encj2860.isLinkUp();
		//serial0->printf("read op %02X\r\n",encj2860._spi_readOP(ENC28J60_ISA(0x0A)));
		//serial0->printf("Link is down\r\n");
		//if(encj2860.isLinkUp()){
		//	//serial0->printf("Link is up\r\n");
		//	encj2860.send(ptr.begin(), ptr.size());
		//}
		_delay_ms(500);
	}


}
