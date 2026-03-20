#!/bin/bash

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Banner
banner() {
echo -e "${CYAN}"

echo "d88888D d88888b d8888b."
echo "YP  d8. 88.     88  .8D"
echo "   d8.  88ooooo 88   88"
echo "  d8.   88ooooo 88   88"
echo " d8. db 88.     88  .8D"
echo "d88888P Y88888P Y8888D."

echo
echo -e "${NC}DNS Enumeration Tool by ZED"
echo
}

# Check subfinder
check_subfinder() {
if ! command -v subfinder &> /dev/null; then
echo -e "${RED}[!] subfinder is not installed or not in PATH.${NC}"
echo -e "${CYAN}Install it: https://github.com/projectdiscovery/subfinder${NC}"
exit 1
fi
}

# Main logic
main() {
banner
check_subfinder

# Ask for domain
read -p "$(echo -e ${GREEN}Enter target domain:${NC} )" domain
if [ -z "$domain" ]; then
echo -e "${RED}[!] No domain entered. Exiting.${NC}"
exit 1
fi

# Ask for output file or use default
read -p "$(echo -e ${GREEN}Enter output file name [default: ${domain}_subs.txt]:${NC} )" output
if [ -z "$output" ]; then
output="${domain}_subs.txt"
fi

echo -e "${GREEN}[*] Running subfinder on: $domain${NC}"
echo -e "${GREEN}[*] Output will be saved to: $output${NC}"

subfinder -d "$domain" -silent -o "$output"

count=$(wc -l < "$output")
echo -e "${GREEN}[*] Enumeration complete. Found $count subdomains.${NC}"
echo -e "${GREEN}[*] Results saved in $output${NC}"
}

main