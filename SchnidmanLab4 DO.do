use "H:\Data Lab 4.dta", clear
capture log close
log using "H:\SchnidmanLab4.log", replace
set more off
gen percentrisk = (risky/(risky+safe+bond+retirement))
gen wealth2 = wealth^2
gen riskb=1 if risk>0
replace riskb=0 if riskb==.
d
sum age health married wealth college percentrisk riskb
reg percentrisk age health married c.wealth##c.wealth college, robust
reg riskb age health married c.wealth##c.wealth college, robust
predict lpmhat
sum lpmhat, d
probit riskb age health married c.wealth##c.wealth college, robust
margins, dydx (age health married wealth college)
