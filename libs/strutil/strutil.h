#ifndef STRUTIL_H
#define STRUTIL_H
#include <string>
#include <vector>
#include <utils.h>
#include <macros.h>
#include <stdio.h>
#include <ctype.h>


// convert case
std::string to_lower(std::string str);
std::string to_upper(std::string str);

// remove space & tabs from string
void filterWhite(std::string &str);

// check if string is numeric
bool isNumeric(const std::string &str);

inline std::string &ltrim(std::string &str);
inline std::string &rtrim(std::string &str);
std::string trim(std::string & str);

// split string by delimeters
std::vector<std::string> split(const std::string& str,char delim = ' ');

// count occurrence of char in string
size_t countOccurrences(const std::string& text, char c);

inline bool isset(const std::string &str);
inline bool isPrintableChar(char &c);
inline bool isBlankChar(char &c);
#endif
