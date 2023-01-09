
SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;
START TRANSACTION;
	DELETE FROM
	cancion
	WHERE
	id_cancion = 2;

	SELECT * FROM cancion    
	ROLLBACK;
    
    
   -- INSERT INTO cancion VALUES  (2,"Cold Heart (PNAU Remix)","https://www.deezer.com/track/1457025872",202,7);
    
    
START TRANSACTION;

	INSERT INTO cancion VALUES (null,"As It Was","https://www.deezer.com/track/1703487577",167,14),
	(null,"Bad Habits","https://www.deezer.com/track/1409072752",230,14),
	(null,"Watermelon Sugar","https://www.deezer.com/track/830336922",174,21),
	(null,"Shape of You","https://www.deezer.com/track/142986204",233,30);
SAVEPOINT lote_1;
	INSERT INTO cancion VALUES (null,"abcdefu","https://www.deezer.com/track/1437070342",168,22),
	(null,"Perfect","https://www.deezer.com/track/142986206",263,3),
	(null,"good 4 u","https://www.deezer.com/track/1378342622",178,10),
	(null,"Shivers","https://www.deezer.com/track/1484264492",207,16);

-- RELEASE lote_1;