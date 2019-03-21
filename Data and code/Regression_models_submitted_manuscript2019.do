
log using "regression_rep.log", replace


cd "\Users\Denise Laroze P\Dropbox\CESS-Santiago\archive\OxfordProject\Replication material"
*************************************


use "BCCAP_long_Rs.dta", clear

// data management

egen mean_saw_growth = mean(saw_growth_), by(id)
egen mean_saw_inflation = mean(saw_inflation_), by(id)
egen mean_saw_unemp = mean(saw_unemp_), by(id)


label var saw_unemp_ "Saw unempl"
label  var saw_growth_ "Saw growth" 
label  var age "Age"
label  var female "Female"
label  var LR_Self_ "L-R self-placement"
label  var yearsE "Education (category)"

label var union_1 "Union member"    
label var pronat_ "Prosp. Nat. Econ."
label var retper_ "Prosp. Pers. Econ."
label var proper_ "Prosp. Pers. Econ."

replace LR_Self_ = . if LR_Self_==999

************
*** Table 2
************

tabulate unemp_was_ wave, col nofreq
tabulate growth_was_ wave, col nofreq

************
*** Table 3
************

tabulate retnat_ wave, col nofreq


************
*** Table 4
************

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==2

est store C2

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==3

est store C3

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==4

est store C4

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==5

est store C5


ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==6

est store C6

esttab C* using tables/individ_waves.tex, stats(N ll) se booktabs nonumbers title(Ordered logit model of retrospective evaluations of the economy  on having watched economic news \label{tbl:waves}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace
estimates clear



***********************
*** Appendix II Tables
***********************

*** Table A.1
tabulate saw_unemp_ wave, nofreq col
tabulate saw_growth_ wave, nofreq col
tabulate saw_inflation_ wave, nofreq col

*** Table A.2
tabulate retnat_ wave if  (saw_growth==1 | saw_unemp_==1),  col nofreq 

*** Table A.3
tabulate retnat_ wave if  (saw_growth==0 | saw_unemp_==0),  col nofreq 


***********************
*** Appendix III Tables
***********************
	
*** Table A.4


ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==2 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc2

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==3 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc3

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==4 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc4

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==5 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc5


ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==6 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc6

esttab cc* using tables/individ_waves_con_growth.tex, stats(N ll) se booktabs nonumbers title(Ordered logit model of retrospective evaluations of the economy  on having watched economic news by people people who were consistent growth news watchers/non-watchers \label{tbl:wavesConGrowth}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace

estimates clear



*** Table A.5

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_    if wave==2 &  (mean_saw_unemp==1 |mean_saw_unemp==0)

est store cc2

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   if wave==3 &  (mean_saw_unemp==1 |mean_saw_unemp==0)

est store cc3

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   if wave==4 &  (mean_saw_unemp==1 |mean_saw_unemp==0)

est store cc4

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   if wave==5 &  (mean_saw_unemp==1 |mean_saw_unemp==0)

est store cc5


ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_     if wave==6 &  (mean_saw_growth==1 | mean_saw_growth==0)

est store cc6

esttab cc* using tables/individ_waves_con_unemp.tex, stats(N ll) se booktabs nonumbers title(Ordered logit model of retrospective evaluations of the economy  on having watched economic news by people people who were consistent unemployment news watchers/non-watchers \label{tbl:wavesConUnemp}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace

	
estimates clear	
	

*** Table A.6

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_  union_1 i.pronat_ i.retper_ i.proper_   if wave==2

est store C2

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   union_1 i.pronat_ i.retper_ i.proper_  if wave==3

est store C3

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   union_1 i.pronat_ i.retper_ i.proper_  if wave==4

est store C4

ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_   union_1 i.pronat_ i.retper_ i.proper_  if wave==5

est store C5


ologit retnat_ saw_unemp_ saw_growth_ age i.i.yearsE female LR_Self_  union_1  if wave==6

est store C6

esttab C* using tables/individ_waves_control.tex, stats(N ll) se booktabs nonumbers title(Ordered logit model of retrospective evaluations of the economy  on having watched economic news including more controls \label{tbl:wavesControl}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace
estimates clear
	

	
/// Table A.7

ologit retnat_ saw_unemp_  age i.i.yearsE female LR_Self_    if wave==2

est store C2

ologit retnat_ saw_unemp_  age i.i.yearsE female LR_Self_    if wave==3

est store C3

ologit retnat_ saw_unemp_  age i.i.yearsE female LR_Self_    if wave==4

est store C4

ologit retnat_ saw_unemp_  age i.i.yearsE female LR_Self_    if wave==5

est store C5


ologit retnat_ saw_unemp_  age i.i.yearsE female LR_Self_    if wave==6

est store C6

esttab C* using tables/individ_waves_unemp.tex, stats(N ll) se booktabs nonumbers title(Ordered logit model of retrospective evaluations of the economy  on having watched unemployment news \label{tbl:wavesUnemp}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace
estimates clear


/// Table A.8


ologit retnat_  saw_growth_ age i.i.yearsE female LR_Self_    if wave==2

est store C2

ologit retnat_  saw_growth_ age i.i.yearsE female LR_Self_    if wave==3

est store C3

ologit retnat_  saw_growth_ age i.i.yearsE female LR_Self_    if wave==4

est store C4

ologit retnat_  saw_growth_ age i.i.yearsE female LR_Self_    if wave==5

est store C5


ologit retnat_  saw_growth_ age i.i.yearsE female LR_Self_    if wave==6

est store C6

esttab C* using tables/individ_waves_growth.tex, stats(N ll) se booktabs nonumbers title( Ordered logit model of retrospective evaluations of the economy  on having watched growth/decline news  \label{tbl:wavesGrowth}) ///
	label mtitles("Apr 2009" " Sept 2009" "Jan 2010" "Apr 2010" " Jun 2010") replace
estimates clear	
	
	
log close

