# ZED : DNS Enumeration
ZED is a lightweight and efficient DNS enumeration tool written in Bash. 
It combines the power of subfinder for discovering subdomains and dig for DNS resolution 
to find active and live subdomains for a given target.


FEATURES
--------
- Automated subdomain discovery using subfinder
- DNS resolution using dig and Cloudflare (1.1.1.1)
- Filters out dead or non-resolving domains
- Outputs clean results in sub -> IP/CNAME format
- Simple and portable – works on any Linux/Mac with Bash


REQUIREMENTS
------------
- subfinder (https://github.com/projectdiscovery/subfinder)
- dig (usually part of dnsutils or bind-utils)

Install them on Kali/Debian:

    sudo apt update
    sudo apt install dnsutils
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

Add Go binaries to your PATH:

    export PATH=$PATH:$(go env GOPATH)/bin


USAGE
-----
    chmod +x ZED_1.sh
    ./ ZED_1.sh

You’ll be prompted to enter:
- The target domain (e.g., example.com)
- The output file (e.g., results.txt)

The tool will:
1. Use subfinder to find subdomains of your target
2. Resolve them using dig
3. Save only live/active subdomains to the output file


OUTPUT EXAMPLE
--------------
    [FOUND] www.example.com -> www.example.com-v4.edgesuite.net.
    a1422.dscr.akamai.net.
    23.206.173.136
    23.206.173.130

Saved in results.txt as:

    www.example.com -> www.example.com-v4.edgesuite.net.
    a1422.dscr.akamai.net.
    23.206.173.136
    23.206.173.130


NOTES
-----
- Uses Cloudflare’s 1.1.1.1 DNS for reliability.
- Timeout errors and invalid domains are automatically filtered out.
- Make sure your internet is working and dig can reach external resolvers.


EXAMPLE RUN
-----------
    Target domain: example.com
    Output file name (e.g. results.txt): live_subs.txt
    [+] Running subfinder on example.com...
    [✓] Subfinder found 73 potential subdomains.
    [+] Resolving active subdomains using dig...
    [✓] Scan complete! Active subdomains saved to live_subs.txt


LICENSE
-------
MIT License


CREDITS
-------
- ProjectDiscovery for subfinder
- Cloudflare for the free 1.1.1.1 DNS resolver
- Inspired by community tools like dnsenum, amass, assetfinder


CONTRIBUTION
------------
Feel free to fork, improve, or open issues.
