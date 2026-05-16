# Impianto di Automazione

All'interno dell'impianto sono presenti due diverse linee atte a gestire la fase finale della produzione di due prodotti distinti.

---

# Boxes

Sulla prima linea, a sinistra, arrivano scatole di cartone contenenti 40 bulloni M8. Le dimensioni dei bulloni variano tra le due categorie `(40 x 22 x 20,00)` e `(65 x 22 x 29,55)`, secondo la convenzione riportata al seguente link:

https://trtechnology.eu/download/tabella-bulloni-testa-esagonale/

Il prodotto si presenta come il seguente:

https://www.amazon.it/Confezione-esagonali-completamente-filettate-esagonale/dp/B093PL3C2R

Il peso della scatola è di 200 grammi in entrambi i casi, mentre il peso desiderato del contenuto è:

* `40 pz * 20 g` per la prima tipologia;
* `40 pz * 30 g` per la seconda tipologia.

Il peso totale desiderato delle scatole risulta quindi pari a:

* `1000 g` per la tipologia A;
* `1400 g` per la tipologia B.

La macchina che inserisce i bulloni può introdurre un errore massimo di `±3 bulloni`, portando il peso totale delle scatole nei seguenti range:

* `1000 ± 60 g`
* `1400 ± 120 g`

Nella linea è presente in una prima fase un sensore di peso che compie due azioni distinte.

In primo luogo, dato che i due range di peso non si sovrappongono, il sensore è in grado di distinguere automaticamente le due tipologie di scatole (nel simulatore distinte tra A e B).

Contemporaneamente il valore letto dal sensore e comunicato al PLC permette di definire con precisione il numero di bulloni in eccesso o in difetto, valutando la differenza tra il peso della scatola e il peso nominale desiderato.

I prodotti vengono quindi separati su due linee distinte a seconda della loro tipologia e un attuatore inserisce o rimuove il numero di bulloni comunicato su un monitor.

Un ultimo strumento sigilla correttamente la scatola e conclude il processo operativo.

---

# Turbine

Da definire.
