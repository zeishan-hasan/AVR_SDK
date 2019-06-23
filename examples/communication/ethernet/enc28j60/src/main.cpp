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
	//encj2860.init();
	//encj2860.setMAC(std::vector<uint8_t>{0xAA,0xBB,0xCC,0xDD,0xEE,0xFF});
	//std::vector<uint8_t> a{0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	u8t c[] = {0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	//encj2860.setMAC(c);
	//macaddr_t mac = encj2860.getMAC();
	//if(memcmp(c, mac._mac, MACADDR_N_OCTECTS) == 0){
	//	serial0->printf("Mac set ok\r\n");
	//}
	arp_header_t arp;
	arp.hardwareType = toU16(HARDWARE_TYPE::ETHERNET);
	arp.protocolType = 0x0800;
	arp.hw_addr_length = 6;
	arp.proto_addr_length = 4;
	arp.opcode = toU16(OPCODE::REQUEST);
	arp.src_hw_addr = 0xA0B1C2D3E4F5;
	arp.src_proto_addr = 0xC0A801C8;
	arp.dst_hw_addr = 0;
	arp.dst_proto_addr = 0xC0A801C5;

	std::vector<u8t> ptr;
	ptr.insert(ptr.begin(), (u8t*)&arp, (u8t*)&arp+sizeof(arp));

	//__swapEndian(ptr, 2);

	//for(size_t i = 0; i < ptr.size(); ++i){
	//	serial0->printf("Data[%u] 0x%02X\r\n", i, ptr[i]);
	//}
	//encj2860._spi_selectBank(3);
	while(1){
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
