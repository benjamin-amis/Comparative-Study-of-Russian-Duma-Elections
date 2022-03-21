* Benjamin Amis
cd "C:\Users\Ben Amis\Desktop\All Folder\School\Course Work\Fall 2020\PLSC 309 - Quantitative Analysis\Stata Workspace\FINAL"
import excel "Final assignment golosov and tkacheva data.xlsx", sheet("Лист1") firstrow
graph box ur2016, title ("United Russia Vote Share in 2016 Legislative Elections")/*
> */ ytitle ("Percent of Vote")
sum ur2016, detail
graph box primary, title ("United Russia Vote Share in 2016 Legislative Primary Elections")/*
> */ ytitle ("Percent of Vote")
sum primary, detail
graph box ur2011, title ("United Russia Vote Share in 2011 Elections")/*
> */ ytitle ("Percent of Vote")
sum ur2011, detail
graph twoway (scatter ur2016 primary) (lfit ur2016 primary), title("UR Voteshare 2016 General vs. Primary") ytitle("2016 General Voteshare") xtitle("2016 Primary Voteshare")
graph twoway (scatter ur2016 ur2011) (lfit ur2016 ur2011), title("UR Voteshare 2016 vs. 2011") ytitle("2016 Votshare") xtitle("2011 Voteshare")
eststo: regress ur2016 primary ur2011
esttab using final.rtf
ttest ur2011=0,0.95
ttest ur2016, by(ur2011)
display t(82,1.664)
display invt(82, 0.95)
lvr2plot, mlabel(ur2016) title("Leverage and Residual Plot 2016 Legislative Elections")
corr ur2016 ur2011 primary