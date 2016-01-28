#Report

Nienke Pot <br>
Studentnummer: 10381015  <br>
Project titel: Work Out Program

##Korte Omschrijving

De Work Out Program applicatie geeft de gebruiker de mogelijkheid om zelf een work out samen te stellen en deze tijdens het sporten af te spelen. Op deze manier heeft de gebruiker een houvast tijdens het sporten en hoeft hij niet na te denken wat de volgende oefening wordt. 
De gebruiker kan zelf een programma maken door een oefening met een tijdsduur toe te voegen, totdat de work out compleet is. De gebruiker kan vervolgens uit een overzicht alle work outs zien en daaruit kiezen. Vervolgens krijgt de gebruiker een overzicht van de work out te zien en kan ervoor kiezen om een andere work out te bekijken of om deze te starten. Als de work out wordt afgespeeld, krijgt de gebruiker aan het einde van een oefening een geluid te horen en wordt de work out gepauzeerd. Vervolgens kan de gebruiker als hij klaar is voor het volgende oefening weer op play klikken. Als de work out klaar is kan de gebruiker naar het menu, een overzicht van de work outs gaan of de applicatie afsluiten. <br>

<b>Schetsen</b><br>
<img src="doc/sketchtotal.png" width="400">

##Design

###Framework Design
<img src="doc/Framework.png" width="400">

<b>Model</b><br>
De applicatie maakt gebruik van een lokale Sqlite Database. 
De applicatie heeft twee models; DBModel en WOPlay. DBModel bevat alle functies die de lokale database betreffen. Dit model selecteert, inserts en verwijdert informatie van de database. Het WOPlay model verwerkt informatie verkregen van DBModel over de work out zodat de work out kan worden afgespeeld. De oefeningen met tijdsduur worden geselecteerd uit de database door DBModel en in een dictionary gestopt. WOplay leest deze dictionary vervolgens weer uit. <br>

<b>View en controllers</b><br>
In het menu kan de gebruiker navigeren naar een nieuwe work out maken, het overzicht van de work outs zien of om meteen de vorige work out nog eens af te spelen. Dit kan alleen als er al iets in staat anders is deze optie verborgen. 
Bij het maken van een nieuwe work out kiest de gebruiker eerst een nieuwe naam voor de work out. Deze mag niet leeg zijn en moet ook uniek zijn. De gebruiker voert de naam in en NameNewWOP roept DBModel aan om een nieuwe work out aan te maken in de database. 
Vervolgens kan de gebruiker in NewWOP oefeningen toevoegen aan de work out. NewWOP roept vervolgens DBModel aan om dit toe te voegen in de database bij de nieuwe work out. 
In MYWOPView kan de gebruiker een overzicht zien van alle aangemaakte work outs. Ook kan de gebruiker een work out hier verwijderen. MYWOPView roept DBModel aan om de work outs uit de database te selecteren, om eventueel een work out te verwijderen. En als de gebruiker een work out wil zien in MYWOPOverviewView selecteert DBModel alle oefeningen van de work out. 
Als de gebruiker de work out start, dan wordt een voor een de oefening afgespeeld en de totate tijd van de work out. In WOPlay wordt de totale tijd van de work out uitgerekend en worden de oefeningen een voor een uit de dictionary gehaald. De dictionary met alle oefeningen van de work out wordt door DBModel uit de database geselecteerd. 
In WOView zit een timer functie die de work out start, vandaar haalt in in WOPlay de oefening op en speelt deze af totdat de tijd van de oefening erop zit. Dan pauzeert de timer en gaat als je op play klikt weer verder totdat de workout volledig is afgespeeld. Dan komt de gebruiker in het laatste scherm waar hij de optie heeft om nog verder te gaan in de applicatie of om de applicatie af te sluiten. Dit laatste is gedaan, omdat je ervan uitgaat dat de gebruiker na de work ou klaar is met het gebruiken van de applicatie. 

##Uitdagingen in het proces.
De eerste uitdaging was de keuze voor een database. Eerst wilde ik werken met een Cloudkit database. Echter moet je dan moet je ook altijd internet in de buurt hebben. Dat is niet handig als je buiten of in de sportschool wil sporten. Toen heb ik gekozen voor een SQLite database. Deze staat lokaal op je mobiel. Het installeren hiervan ging heel moeizaam. De stappen waren heel simpel maar het lukte maar niet de database op te zetten. Achteraf bleek het een foute download te zijn, waar veel bestanden in leeg waren. Na een nieuwe download van de SQLite files werkte de database heel goed. <br>
In WOView waarin de work out wordt afgespeeld staat redelijk lange code die je liever niet in je controller maar in het model wil hebben. Dit heb ik ook geprobeerd om in WOPlay te zetten. Echter deze timer zorgt voor een realtime update van een aantal labels. Als de timer functie dan in het model stopt, is dat een omweg om je label up te daten. Echter vind ik wel dat deze code erg lang is voor in een controller. <br>
In het eerste idee had ik niet nagedacht over dat de gebruiker tussen de oefeningen tijd nodig heeft om een andere postie aan te nemen of iets dergelijks. Toen zat ik te twijfelen om of een tussen tijd tussen de oefeningen te programmeren of dat de work out wordt gepauzeerd. Ik heb uiteindelijk voor het laatste gekozen, omdat je niet weet in wat voor situatie de gebruiker zit en het voor elke gebruiker anders kan zijn wat de beste tussen tijd is. <br>
Bij het toevoegen van de oefeningen aan de nieuwe work out, krijg je alleen een overzicht te zien van de totale tijd en niet van de voorgaande gekozen oefeningen. Deze kan je wel makkelijk op het scherm laten zien, alleen dan komt het scherm wel erg vol te staan. En zeker voor op een mobiel scherm zou het dan onduidelijk en rommelig worden. Daarom heb ik ervoor gekozen dit niet te laten zien. Wel wordt de totale tijd van de work out getoond, zodat het duidelijk is voor de gebruiker hoelang de work out in totaal gaat duren.<br>
Wat ik door een te korte tijd niet heb kunnen afmaken, maar wat de applicatie wel beter had gemaakt is dat lege work outs ook worden getoond in het overzicht en dat een work out achteraf niet meer kan worden aangepast. Dit is wel iets wat het voor de gebruiker een stuk vriendelijker had kunnen maken



 

