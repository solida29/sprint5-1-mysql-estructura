# Entrega 5.1: Estructura de dades MySQL

## Descripció

Modelarem diversos diagrames, entitat-relació.

## Nivell 1

### Exercici 1 - Òptica

Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients/es i vendes d'ulleres.

En primer lloc, l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. En concret vol saber de cada proveïdor: El nom, l'adreça (carrer, número, pis, porta, ciutat, codi postal i país), telèfon, fax, NIF.

La política de compres de l'òptica es basa que les ulleres d'una marca es compraran a un únic proveïdor (així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor. De les ulleres vol saber: La marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica), el color de la muntura, el color de cada vidre, el preu.

Dels clients/es vol emmagatzemar: El nom, l'adreça postal, el telèfon, el correu electrònic, la data de registre.
Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat l'establiment (sempre que algú li hagi recomanat).
El nostre sistema haurà d’indicar qui ha sigut l’empleat/da que ha venut cada ullera. Defineix un període de temps de vendes.

### Exercici 2 - Pizzeria

T’han contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.

Tingues en compte les següents indicacions per a modelar com seria la base de dades del projecte:
Per a cada client/a emmagatzemem un identificador únic: Nom, cognoms, adreça, codi postal, localitat, província, número de telèfon.
Una persona pot realitzar moltes comandes, però una única comanda només pot ser realitzat per una única persona. De cada comanda s'emmagatzema un identificador únic: Data/hora, si la comanda és per a repartiment a domicili o per a recollir en botiga, la quantitat de productes que s'han seleccionat de cada tipus, el preu total.

Una comanda pot constar d'un o diversos productes.

Els productes poden ser pizzes, hamburgueses i begudes. De cada producte s'emmagatzema un identificador únic: Nom, descripció, imatge, preu.

En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l'any. Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.

De cada categoria s'emmagatzema un identificador únic i un nom. Una comanda és gestionada per una única botiga i una botiga pot gestionar moltes comandes. De cada botiga s'emmagatzema un identificador únic: Adreça, codi postal, localitat, província.

En una botiga poden treballar molts empleats/des i un empleat/da només pot treballar en una botiga. De cada empleat/da, s'emmagatzema un identificador únic: Nom, cognoms, NIF, Telèfon.
Si treballa com a cuiner/a o repartidor/a. Per a les comandes de repartiment a domicili interessa guardar qui és el repartidor/a que fa el lliurament de la comanda i la data/hora del moment del lliurament.

### Requisits

Per a verificar que el teu disseny és correcte, efectua les següents consultes i comprova que retornen resultats correctes:

1. Òptica:

   - Llista el total de compres d’un client/a.
   - Llista les diferents ulleres que ha venut un empleat durant un any.
   - Llista els diferents proveïdors que han subministrat ulleres - venudes amb èxit per l'òptica.

1. Pizzeria:
   - Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.
   - Llista quantes comandes ha efectuat un determinat empleat/da.

<hr>

## Docker

Para usar el Docker:

```sh
docker compose up
```

### Ejercicio Optica

1. Para montar la estructura de la base de datos "optica", hay que ejecutar:

```bash
optica_script.sql
```

2. Para hacer la inserciones de datos hay que ejecutar el archivo:

```bash
optica_insert.sql
```

3. Estan las 3 consultas en el archivo siguientes ("Requisits"):

```bash
optica_consultas.sql
```

4. Se puede consultar el diagrama en el archivo optica_diagrama.png

### Ejercicio Pizzeria

1. Para montar la estructura de la base de datos "pizzeria", hay que ejecutar:

```bash
pizzeria_script.sql
```

2. Para hacer la inserciones de datos hay que ejecutar el archivo:

```bash
pizzeria_insert.sql
```

3. Estan las 2 consultas en el archivo siguientes:

```bash
pizzeria_consultas.sql
```

4. Se puede consultar el diagrama en el archivo pizzeria_diagrama.png

<hr>

## Nivell 2

### Exercici 1 - YouTube

Tractarem de fer un model senzill de com seria la base de dades per a una versió reduïda de YouTube.

De cada usuari/ària guardem un identificador únic: Email, password, nom d'usuari/ària, data de naixement, sexe, país, codi postal.

Un usuari/ària publica vídeos. De cada vídeo guardem un identificador únic: Un títol, una descripció, una grandària, el nom de l'arxiu de vídeo, durada del vídeo, un thumbnail, el nombre de reproduccions, el número de likes, el número de dislikes.

Un vídeo pot tenir tres estats diferents: públic, ocult i privat. Un vídeo pot tenir moltes etiquetes. Una etiqueta s'identifica per un identificador únic i un nom d'etiqueta. Interessa guardar qui és l'usuari/ària que publica el vídeo i en quina data/hora el fa.

Un usuari/ària pot crear un canal. Un canal té un identificador únic: Un nom, una descripció, una data de creació.

Un usuari/ària es pot subscriure als canals d'altres usuaris/es. Un usuari/ària pot donar-li un like o un dislike a un vídeo una única vegada. Caldrà portar un registre dels usuaris/es que li han donat like i dislike a un determinat vídeo i en quina data/hora ho van fer.

Un usuari/ària pot crear playlists amb els vídeos que li agraden. Cada playlist té un identificador únic: Un nom, una data de creació, un estat que indica que pot ser pública o privada.

Un usuari/ària pot escriure comentaris en un vídeo determinat. Cada comentari està identificat per un identificador únic: El text del comentari, la data/hora en la qual es va realitzar.

Un usuari/ària pot marcar un comentari com m'agrada o no m'agrada. Caldrà portar un registre dels usuaris/es que han marcat un comentari com m'agrada/no m'agrada, i en quina data/hora ho van fer.
