default:all

all: draft-moura-dnsop-negative-cache-loop.txt

%.xml: %.mkd
	kramdown-rfc2629  $< > $@

%.txt: %.xml
	xml2rfc $< -o $@ --text

%.html: %.xml
	xml2rfc $< -o $@ --html

%.pdf: %.txt
	enscript --margins 76::76: -B -q -p - $^ | ps2pdf - $@
