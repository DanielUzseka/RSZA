## Maj 2

+ jo helyen van a memoria a ket modul kozott? vagy inkabb vezerlojelek amba -> i2c
  + regiszterek es NEM memoria!
  + ossz 1 db 32 bites regiszter!
  + regiszter inkabb I2C modulban (inout)

+ PU? hogyan szimulaljuk az olvasast?
  + a `pullup()` okes 
  + butan beirjuk az ACK jeleket kezzel

+ cimtartomany? a sajat memoriankat hova rakjuk a 32bithez kepest?
    + mondjuk 0x80000000 on van a periferia kezdocime, onnan rekeszek 4byteonkent
    + regiszterek 32bitesek!!

+ szinkron reset!

+ teszteles? kell kulon-kulon, vagy egybe mukodes?
  + eleg egybe

+ doksi kimerte, reszletessege
  + max 20 oldal, AMBA, I2C bevezetes

+ szintetizalhatosag nem szempont, csak szimulacioban legyen ok!
