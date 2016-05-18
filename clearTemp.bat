del .bds\*.local
del .bds\*.tgs
del .bds\*.tgw
del .bds\*.identcache
del .bds\*.cfg

rd .bds\ModelSupport

del bin\*.bpl
del bin\*.exe
del bin\*.~*
del bin\dunit.ini

del dcp\*.dcp

del dcu\Moon_Utilities\*.dcu
del dcu\Moon_Components\*.dcu
del dcu\Moon_IOTA\*.dcu
del dcu\Moon_TestUnit\*.dcu
del dcu\Moon_TestApp\*.dcu

del files\test_out\*.tmp /q

pause
