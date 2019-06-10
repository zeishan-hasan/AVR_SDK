#ifndef STRUTIL_H
#define STRUTIL_H
#include <string>
#include <vector>
#include <utils.h>
#include <macros.h>
#include <stdio.h>
#include <ctype.h>
using namespace  std;
// convert case

std::string to_lower(std::string str);
std::string to_upper(std::string str);

// leave only visible charaters from string
//void filterVisible(std::string &str);

// remove space & tabs from string
void filterWhite(std::string &str);

// check if string is numeric
bool isNumeric(const std::string &str);

//inline std::string& ltrim(std::string &s, const char* blank_spaces = " \t\r\n");
char *ltrim(char *str, const char *blank_spaces);
//inline std::string& rtrim(std::string& s, const char* blank_spaces = " \t\r\n");
char *rtrim(char *str, const char *blank_spaces);

//std::string &trim(std::string& s, const char* blank_spaces = " \t\r\n");


// split string by delimeters
std::vector<std::string> split(const std::string& text, const std::string& delims = " ");

// merge strings into single string, using delimiters
//std::string merge(const std::vector<std::string> &parts, std::string delim="");

// count occurrence of char in string
size_t countOccurrences(const std::string& text, char c);

//void filter_to_text(std::string *str);

// split string by regex
//std::vector<std::string> rsplit(const std::string &text, const std::string& regex, bool full_match=false);

// replace escape character with corresponding value
//bool unescape(const std::string& src, std::string &dst);

// convert string to wide string

// replace placeholders (%1, %2, ..., %N) with string args
//std::string fillPlaceholders(const std::string &input, const std::vector<std::string> & args);

// trim and collapse multiple spaces into single space
// example: " ab   c " --> "ab c"
//std::string removeExtraSpaces(std::string input);

bool isset(const std::string &str);

#endif
