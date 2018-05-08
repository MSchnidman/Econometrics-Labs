use "H:\forecasting lab data.dta", clear
capture log close
log using "H:\MOPO Lab.log", replace
reg credit t t2 t3 t4
reg sandp sandp1
reg sandp t t2 st
reg vehicles t January February March April May June July September August October November vt2 vt3 vt4 tv tv2 tv3 tv4
log close
