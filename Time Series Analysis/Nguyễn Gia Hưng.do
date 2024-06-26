gen t=_n
tsset t
gen return = ln( Price/ Price[_n-1])
dfuller return
corrgram return
arima return, ar(1) ma(1)
predict ut, resid
gen ut2 = ut^2
summarize Price return ut ut2
corrgram ut2
regress ut2
estat archlm, lag(1)
arch r, ar(1) ma(1) arch(1) garch(1)
predict VOS, variance