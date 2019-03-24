#ifndef VECTOR_H
#define VECTOR_H
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#define ELEMENT_IN_ARRAY(x)  (*(&x + 1) - x)


namespace yanujz {
template<class T> class vector {
public:
	vector(){
		_size = 0;
		_value = (T*)malloc((_size * sizeof(T)));
		//for(int i = 0; i < size; i++){
		//	_value[i] = ptr[i];
		//}
	}
	vector(T *ptr, size_t size){
		_size = size;
		_value = (T*)malloc((_size * sizeof(T)));
		for(int i = 0; i < size; i++){
			_value[i] = ptr[i];
		}
	}

	T getValue(T index){
		if(index > _size - 1){
			return 255;
		}
		return *(_value + index);
	}

	T first(){
		return *_value;
	}

	T last(){
		return *(_value + (_size-1));
	}

	T* begin(){
		return _value;
	}
	T* end(){
		return _value + (_size-1);
	}

	void pushLeft(T value){
		if( _value == nullptr ){
			return;
		}

		size_t _tempSize = _size * sizeof(T);
		T *temp = (T*) malloc( _tempSize );
		memcpy(temp, _value, _tempSize);

		++_size;

		_value = reinterpret_cast<T*> (realloc( _value, _size * sizeof(T)-1 ));
		if(_value == nullptr){
			delete temp;
			return;
		}

		*_value  = value;

		memcpy(_value+1, temp, _tempSize);

		delete temp;
	}

	void pushLeft(T arr[],T size){
		if(_value == nullptr){
			return;
		}

		size_t _tempSize = _size*sizeof(T);
		T *temp = (T*)malloc(_tempSize);
		memcpy(temp, _value, _tempSize);


		_size += size;


		_value = reinterpret_cast<T*>(realloc(_value, _size * sizeof(T)));

		if(_value == nullptr){
			printf("Can't realloc\r\n");
			delete temp;
			return;
		}

		memcpy(_value, arr, size*sizeof(T));
		memcpy(_value + size, temp, _tempSize);
	}

	void pushRight(T value){
		if(_value == nullptr){
			return;
		}
		++_size;
		_value = reinterpret_cast<T*> (realloc( _value,  _size * sizeof(T) ));
		if(_value== nullptr){
			return;
		}
		_value[_size - 1] = value;
	}

	void insert(size_t index,T arr[],size_t size){
		if(_value == nullptr){
			return;
		}

		size_t _tempSize = _size*sizeof(T);
		T *temp = (T*)malloc(_tempSize);
		memcpy(temp, _value, _tempSize);

		_size += size;


		_value = reinterpret_cast<T*> (realloc( _value, _size * sizeof(T)));

		if(_value == nullptr){
			delete temp;
			return;
		}

		memcpy(_value + index, arr, size*sizeof(T));

		memcpy(_value + size + index, temp + index, _tempSize);

		delete  temp;
	}

	void popRight(size_t value = 1){
		if(value > _size){
			return;
		}
		_size -= value;
		_value = reinterpret_cast<T*>(realloc(_value, (_size * sizeof(T)) ) );


	}
	void popLeft(size_t value = 1){
		if(value > _size){
			return;
		}
		_size -= value;
		memmove(_value, _value + value, _size*sizeof(T));
		_value = reinterpret_cast<T*>(realloc(_value, (_size * sizeof(T)) ) );

	}

	size_t size(){
		return _size;
	}
	bool empty(){
		return size()==0;
	}
	void clear(){
		_value = reinterpret_cast<T*>(realloc(_value, (0 * sizeof(T)) ) );
	}

	//TODO Implementare gli operator
	T& operator[](size_t index){
			return _value[index];
	}
/*
	T& operator=(T a[]){
		memcpy(_value,a,sizeof(a));
	}
*/
private:
	T *_value;
	size_t _size;
};

}
#endif // VECTOR_H
