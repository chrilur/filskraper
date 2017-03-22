== FILSKRAPER ==

Et R-skript som i utgangspunktet er laget for å hente ned en rekke Svalbard-kart fra en gitt URL-trestruktur.

Men det kan lett modifiseres til å bli helt generisk.

I tre steg genereres url-ene som leder til filene. Deretter lastes de ned med download.file, 

i en funksjon som angir navn basert på plassering i trestrukturen.

