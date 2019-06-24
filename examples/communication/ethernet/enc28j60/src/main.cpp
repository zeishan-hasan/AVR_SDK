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
	//encj2860.init();
	//encj2860.setMAC(std::vector<uint8_t>{0xAA,0xBB,0xCC,0xDD,0xEE,0xFF});
	//std::vector<uint8_t> a{0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	//u8t c[] = {0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	//encj2860.setMAC(c);
	//macaddr_t mac = encj2860.getMAC();
	//if(memcmp(c, mac._mac, MACADDR_N_OCTECTS) == 0){
	//	serial0->printf("Mac set ok\r\n");
	//}
	arp_header_t arp;
	arp.hardwareType = 0x01;
	arp.protocolType = 0x0800;
	arp.hw_addr_length = 6;
	arp.proto_addr_length = 4;
	arp.opcode = 0x01;
	arp.src_hw_addr = 0xA0B1C2D3E4F5;
	arp.src_proto_addr = 0xC0A802C8;
	//arp.src_proto_addr = 0xC802A8C0;
	arp.dst_hw_addr = 0;
	arp.dst_proto_addr = 0xC0A80201;
	//arp.dst_proto_addr = 0x0102A8C0;

	std::vector<u8t> ptr;
	ptr.insert(ptr.begin(), (u8t*)&arp, (u8t*)&arp+sizeof(arp));


	__swapEndian(ptr, 4);
	u8t mac[6];
	encj2860._spi_getMAC(mac);
	for(size_t i = 0; i < 6; ++i){
		serial0->printf("Data[%u] 0x%02X\r\n", i, mac[i]);
	}

	//for(size_t i = 0; i < ptr.size(); ++i){
	//	serial0->printf("Data[%u] 0x%02X\r\n", i, ptr[i]);
	//}
	//encj2860._spi_selectBank(3);
	u8t buff[128];
	while(1){

		if(encj2860.isLinkUp()) {
	//		serial0->printf("Link is up\r\n");
			//encj2860.sendPacket(ptr.begin(), ptr.size());
			if(encj2860.isReceivingData()){
				u16t size = encj2860.receivePacket(buff, SIZE_OF_ARRAY(buff));
				//encj2860._spi_readBuffer(buff, SIZE_OF_ARRAY(buff));
				arp_header_t _arp;
				//__swapEndian(buff, 42, 4);
				//__swapEndian(buff, 42, 2);
				//memcpy((u8t*)&arp, buff, sizeof(arp));
				//serial0->printf("IP src %ld", _arp.dst_hw_addr);
				//serial0->printf("IP dst %ld", _arp.src_hw_addr);
				for(u16t i = 0; i < size; ++i){
					if(i % 15 == 0){
						serial0->printf("\r\n");
					}
					serial0->printf("[%02u] 0x%02X ",i , buff[i]);
				}
			}
		}
		else {
			serial0->printf("Link is down\r\n");
		}

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
		//_delay_ms(500);
	}


}
