#include "strutil.h"
#include <serial.h>

std::string to_lower(std::string str)
{
    for(size_t i = 0; i < str.size();++i){
        str[i] = tolower(str[i]);
    }
    return str;
}

std::string to_upper(std::string str)
{
    for(size_t i = 0; i < str.size();++i){
        str[i] = toupper(str[i]);
    }
    return str;
}


void filterWhite(std::string &str)
{
    str.erase(std::remove(str.begin(), str.end(), ' '), str.end());
    str.erase(std::remove(str.begin(), str.end(), '\t'), str.end());
}


bool isNumeric(const std::string &str)
{
    size_t i = 0;
    if(str[0] == 43 || str[0] == 45) {
        ++i;
    }
    while (str[i] >= 0x30 && str[i] <= 0x39) {
        ++i;

    }
    if(i == str.size()){
        return true;
    }


    return false;

}

//inline std::string & ltrim(std::string&  s, const char* blank_spaces) {
//        s.erase(0, s.find_first_not_of(blank_spaces));
//        return s;
//
//}
char *ltrim(char *str, const char *blank_spaces)
{
    size_t totrim;
    if (blank_spaces == NULL) {
        blank_spaces = "\t\n\v\f\r ";
    }
    totrim = strspn(str, blank_spaces);
    if (totrim > 0) {
        size_t len = strlen(str);
        if (totrim == len) {
            str[0] = '\0';
        }
        else {
            memmove(str, str + totrim, len + 1 - totrim);
        }
    }
    return str;
}
char *rtrim(char *str, const char *blank_spaces)
{
    int i;
    if (blank_spaces == NULL) {
        blank_spaces = "\t\n\v\f\r ";
    }
    i = strlen(str) - 1;
    while (i >= 0 && strchr(blank_spaces, str[i]) != NULL) {
        str[i] = '\0';
        i--;
    }
    return str;
}
/*
inline std::string& rtrim(std::string& s, const char* blank_spaces) {
        s.erase(s.find_last_not_of(blank_spaces) + 1);
        return s;
}

std::string& trim(std::string& s, const char* blank_spaces){
        return ltrim(rtrim(s),blank_spaces);
}
*/
/*
std::vector<std::string> split(const std::string& text, const std::string& delims)
{
        std::vector<std::string> tokens;
        size_t start = text.find_first_not_of(delims), end = 0;

        while((end = text.find_first_of(delims, start)) != std::string::npos)
        {
                tokens.push_back(text.substr(start, end - start));
                start = text.find_first_not_of(delims, end);
        }
        if(start != std::string::npos)
                tokens.push_back(text.substr(start));

        return tokens;
}
/*
std::string merge(const std::vector<std::string> &parts, std::string delim)
{
        return "";
}
*/

size_t countOccurrences(const std::string &text, char c)
{
    size_t count = 0;
    for (auto & _c: text) if(_c==c) count++;

    return count;
}

/*
void filter_to_text(std::string *str)
{
        //TODO
        str = nullptr; // delete me;
}*/


/*std::vector<std::string> rsplit(const std::string &text, const std::string &regex, bool full_match)
{

        //TODO
        return std::vector<std::string>();
}*/
/*
bool unescape(const std::string &src, std::string &dst)
{

        dst = src; // delete me
        return false;
}
*/
/*
std::wstring str2ws(const std::string &input)
{

}
*/

/*
std::string fillPlaceholders(const std::string &input, const std::vector<std::string> &args)
{
        return "";
}
*/
//std::string removeExtraSpaces(std::string input)
//{
//	std::string tmp = trim(input);
//	std::string out;
//	try {
//		std::regex bp = std::regex("\\ \\ +");
//		out = std::regex_replace(tmp, bp, " ");
//	} catch (std::exception &e) {
//		printf("Regex exception: %s", e.what());
//		return input;
//	}
//
//	return out;
//}


bool isset(const std::string &str)
{
    if(str.size())
        return true;

    return false;
}

