#Process book

##Dag 1
- Maken proposal en schetsen.

##Dag 2
- Maken van een prototype. Verschillende views gebouwd. 

##Dag 3
- Prototype afgemaakt. Lay out in orde gemaakt en al een aantal segues toegevoegd. 
- Een button werkte niet in een bepaalde landscape, door constraints te resetten werkte het weer. 

##Dag 4
- Maken design document.

##Dag 5
- Zoeken naar een database. Cloudkit lijkt toch niet geschikt, wilt niet aangevinkt worden bij capabilities. Vermoedelijk komt het doordat ik geen apple developer account heb?

##Dag 6
- Timer gemaakt voor tijdens de Work Out. 
- Dingen opzoeken voor beste database.
- CLoudkit is voor mij niet handig/mogelijk, daarom ga ik gebruik maken van SQLlite Database. Het idee van een public database, laat ik daarbij even gaan. 

##Dag 7
- SQLite geinstalleerd, kostte veel moeite, waarschijnlijk was er een foute download. 
SQLite install manual: https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#cocoapods

##Dag 8
- Database werkte slecht. Veel mee bezig geweest om hem aan het praten te krijgen.

##Dag 9 
- Database werkt. Met dank aan Tim Baard. Nu ook wat functionaliteiten ermee kunnen installeren. 

##Dag 10
- Inleveren alpha version.
- Veel nog bezig geweest met database, maar lukte niet echt.

##Dag 11
- Database insert zoals het hoort en selecteert inmiddels de de data die nodig is.
daarvoor heb ik wel de inhoud van de database aangepast. Ook een aantal keer opniew de tabellen aangemaakt enz. Veel op papier eerst de tabellen getekend en 'logisch' na proberen te denken over wat en hoe ik de data ging inserten en ophalen. 
- Informatie opgezocht over geluid afspelen in swift. 

##Dag 12
- De app speelt de Work out nu goed af. 
- De timer en geluid functies staan in de view class en niet in het model. Dit is gedaan omdat de de timer rechtstreeks een label waar de tijd op wordt afgebeeld aanpast. Anders zou je het met een onwijze omweg moeten doen. 
- De insertion bij het aanmaken van een nieuwe work out, blijkt toch niet goed te werken, dus daar ga ik morgen mee aan de slag. 

##Dag 13
- Verder gewerkt aan de insertion en selection in de database model. 

##Dag 14
- De work out wordt nu afgespeeld zonder pauzes, maar in het echt dan ga je vaak niet meteen door. Daarom wordt de wordt de workout na een oefening gepauzeerd. Veel getest met de app om te kijken waar er nog dingen misten en wat nog fout ging. Zoals een dubbele selectie bij het work out overzicht. Dit weekend moet ik nog meer gaan testen met de app. 

##Dag 15
-Final beta-versie. Nog wat bugs eruit gehaald. 

##Dag 16
- Code netter gemaakt. 
- Lay-out nog netter gemaakt. 
- Gekozen om een work out niet meer achter te kunnen aanpassen. Eerst dacht ik dat het niet veel meer werk zou zijn, maar moet de hele structuur aanpassen omdat ik iets in een list stop en niet in een array of dict. 

##Dag 17
- Applicatie gecheckt of het werkt vanaf github nieuwe download.
- Applicatie getest op bugs. 

##Dag 18
- Code review van Julian. Van daaruit nog wat dingen aangepast. Waaronder het aanroepen van de model classes. 
- Werken aan report.
- Nieuw Framework tekenen. 

##Dag 19
- Report afmaken.
- Checken van de code en op mobiel runnen.

##Dag 20
- Final presentation.

