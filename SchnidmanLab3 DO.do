use "H:\Data Lab3.DTA", clear
capture log close
log using "H:\SchnidmanLab3.log", replace
set more off
d
sum year school country morti GDP open popgrow
gen lngdp = ln(GDP)
gen lnopen = ln(open)
gen lnschool = ln(school)
gen opengdp = lngdp*lnopen
egen state=group(country)
tab year, gen(time)
tab country, gen(nation)
reg morti lngdp lnopen opengdp popgrow lnschool
reg morti lngdp lnopen opengdp popgrow lnschool, robust
test _b[lngdp]=_b[opengdp]=0
test _b[lnopen]=_b[opengdp]=0
xtset state year
xtreg morti lngdp lnopen opengdp popgrow lnschool, fe robust
test _b[lngdp]=_b[opengdp]=0
test _b[lnopen]=_b[opengdp]=0
xtreg morti lngdp lnopen opengdp popgrow lnschool time2-time6, fe robust
test _b[lngdp]=_b[opengdp]=0
test _b[lnopen]=_b[opengdp]=0
log close

