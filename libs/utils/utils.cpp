#include "utils.h"

void __swapBytes(vector<uint8_t> &v, size_t src, size_t dst)
{
	uint8_t tmp = v[src];
	v[src] = v[dst];
	v[dst] = tmp;
}

void __swapEndian(vector<uint8_t> &v, size_t wordlen)
{
	for(size_t idx = 0; idx < v.size()/wordlen; idx++) {
		for(size_t j = 0; j<wordlen/2; j++) {
			size_t src = (wordlen*idx)+j;
			size_t dst = (wordlen*idx)+(wordlen-1)-j;
			__swapBytes(v, src, dst);
		}
	}
}


void __swapNibbles(vector<uint8_t> &v){
	for(size_t i = 0; i < v.size(); i++) {
		v[i] = ( (v[i] & 0x0F) << 4 | (v[i] & 0xF0) >> 4 );
	}

}

void __fill(vector<uint8_t> &v, uint8_t fill_byte, size_t size)
{
	for (size_t i = 0;i < size ;++i) {
		v.push_back(fill_byte);
	}
}
void __fill(uint8_t &buff, uint8_t fill_byte, size_t currentSize,size_t size){
	size_t lastIndex = currentSize;
	buff = *(uint8_t*) realloc(&buff, size);
	size_t newIndex = (lastIndex+size);
	for(size_t i = lastIndex; i < newIndex; ++i ){
		*(&buff+i) = fill_byte;
	}
}
