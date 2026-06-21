# Impianto di Automazione

All'interno dell'impianto sono presenti due diverse linee atte a gestire la fase finale della produzione di due prodotti distinti.

---

# Boxes

Sulla prima linea, a sinistra, arrivano scatole di cartone contenenti 40 bulloni M8. Le dimensioni dei bulloni variano tra le tre categorie `(40 x 22 x 20,00)`, `(65 x 22 x 29,55)` e `(120 x 22 x 50,52)`, secondo la convenzione riportata al seguente link:

https://trtechnology.eu/download/tabella-bulloni-testa-esagonale/

Il prodotto si presenta come il seguente:

https://www.amazon.it/Confezione-esagonali-completamente-filettate-esagonale/dp/B093PL3C2R

Il peso della scatola è di 200 grammi in tutti i casi, mentre il peso desiderato del contenuto è:

* `40 pz * 20 g` per la prima tipologia (A);
* `40 pz * 30 g` per la seconda tipologia (B);
* `40 pz * 50 g` per la terza tipologia (C).


Il peso totale desiderato delle scatole risulta quindi pari a:

* `1000 g` per la tipologia A;
* `1400 g` per la tipologia B;
* `2200 g` per la tipologia C.

La macchina che inserisce i bulloni può introdurre un errore massimo di `±4 bulloni`, portando il peso totale delle scatole nei seguenti range:

* `1000 ± 80 g`
* `1400 ± 120 g`
* `2200 ± 200 g`

La tipologia C, per ragioni pratiche, non viene generata sul matlab ma il codice a essa associato è già stato scritto. Per aggiungere l'ulteriore linea è sufficiente aggiungere le componenti grafiche dedicate e modificare l'apposita funzione di spawn.

Nella linea è presente in una prima fase un sensore di peso che compie due azioni distinte.

In primo luogo, dato che i due range di peso non si sovrappongono, il sensore è in grado di distinguere automaticamente le due tipologie di scatole (nel simulatore distinte tra A e B).

Contemporaneamente il valore letto dal sensore e comunicato al PLC permette di definire con precisione il numero di bulloni in eccesso o in difetto, valutando la differenza tra il peso della scatola e il peso nominale desiderato.

I prodotti vengono quindi separati su due linee distinte a seconda della loro tipologia e un attuatore inserisce o rimuove il numero di bulloni comunicato su un monitor.

Un ultimo strumento sigilla correttamente la scatola e conclude il processo operativo.

---

# Turbine

In base alle dimensioni delle pale della turbina e delle angolazioni viene effettuato un riconoscimento della tipologia di turbina e vengono effettuati controlli sulla qualità e correttezza della struttura. Se il primo controllo viene superato, la turbina sarà posta su un banco di prova e sottoposta ad un test di funzionamento così strutturato:
- controllo sensori;
- avviamento motore;
- salita a 1000 rpm;
- salita a 2000 rpm;
- salita a 3000 rpm;
- misura temperatura;
- misura vibrazioni;
- arresto

Data la pericolosità dell'operazione sono integrate alcune condizioni di allarme:
- temperatura elevata;
- eccessive vibrazioni;
- velocità fuori tolleranza

In caso di esito positivo, la turbina viene approvata e inviata verso l'esterno.
In caso di esito negativo, la turbina viene scaratata e inviata verso un centro riparazioni (non di nostra competenza).
