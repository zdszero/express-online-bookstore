-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: hello_book
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_Admin`
--

DROP TABLE IF EXISTS `t_Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Admin` (
  `Admin_num` int(11) NOT NULL AUTO_INCREMENT,
  `Admin_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Admin_pass` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Admin_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Admin_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Admin_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Admin`
--

LOCK TABLES `t_Admin` WRITE;
/*!40000 ALTER TABLE `t_Admin` DISABLE KEYS */;
INSERT INTO `t_Admin` VALUES (1,'admin','*5B312790EEDF656E2CBF43EE5C0229A4B3932494','admin','admin');
/*!40000 ALTER TABLE `t_Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Book`
--

DROP TABLE IF EXISTS `t_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Book` (
  `Book_num` int(11) NOT NULL AUTO_INCREMENT,
  `Store_num` int(11) DEFAULT NULL,
  `Book_Store` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_kind1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_kind2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Book_kind3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Book_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_writer` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_pub` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_pubnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_intro` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_price` double NOT NULL,
  `Book_picture` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Book_stock` int(11) NOT NULL,
  `Book_mark` double DEFAULT NULL,
  PRIMARY KEY (`Book_num`),
  KEY `FK_Relationship_13` (`Store_num`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`Store_num`) REFERENCES `t_Store` (`Store_num`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Book`
--

LOCK TABLES `t_Book` WRITE;
/*!40000 ALTER TABLE `t_Book` DISABLE KEYS */;
INSERT INTO `t_Book` VALUES (1,1,'StoreA','young adult','life','bodycare','Skincare: The ultimate no-nonsense guide','Caroline Hirons','HQ',' 0008375526','‘Skincare expert.’Vogue\n\n‘Skincare Queen’ ITV This Morning\n\n‘Hirons breaks down the world of skincare like no one else’ Red Magazine',17,'https://s1.ax1x.com/2020/07/07/UFLkfe.jpg',53,NULL),(2,2,'StoreB','young adult','life','bodycare','Skincare: The ultimate no-nonsense guide','Caroline Hirons','HQ',' 0008375526','‘Skincare expert.’Vogue\n\n‘Skincare Queen’ ITV This Morning\n\n‘Hirons breaks down the world of skincare like no one else’ Red Magazine',16.22,'https://s1.ax1x.com/2020/07/07/UFLkfe.jpg',50,NULL),(3,1,'StoreA','young adult','life','bodycare','Skincare: The ultimate no-nonsense guide','Caroline Hirons','HQ',' 0008375527','‘Skincare expert.’Vogue\n\n‘Skincare Queen’ ITV This Morning\n\n‘Hirons breaks down the world of skincare like no one else’ Red Magazine',16.22,'https://s1.ax1x.com/2020/07/07/UFLESH.jpg',23,NULL),(4,1,'StoreA','literature','fiction',NULL,'Turn Left at Orion','Guy J. Consolmagno',' Cambridge University Press','1108457568','This unique and best-selling guidebook to the night sky shows amateur astronomers how to observe a host of celestial wonders. Its distinct format of object-by-object spreads illustrates how deep-sky objects and planets will actually look in a small telescope, with large pages and spiral binding for ease of use outside.',50,'https://s1.ax1x.com/2020/07/07/UFLFYD.jpg',90,NULL),(5,1,'StoreA','science','fantasy',NULL,'Collins Stargazing: Beginners guide to astronomy','Tom Kerss','Collins ','0008196273','‘A perfect book for anyone looking to start a new hobby or simply have a better understanding of our Universe.’- Firetrench\n\n‘This accessible and well-presented book would make an ideal gift for any beginner to astronomy – recommended.’ Journal of the British Astronomical Association',16.38,'https://s1.ax1x.com/2020/07/07/UFLVld.jpg',91,NULL),(6,1,'StoreA','science','fantasy',NULL,'Stargazing For Dummies ','Steve Owens','John Wiley & Sons','1118411560','In my opinion Stargazing for Dummies should be treated as an essential handbook by anyone interested in the night sky and kept very close to your window, (BBC Sky At Night Magazine, June 2013)',21.42,'https://s1.ax1x.com/2020/07/07/UFLiFO.jpg',40,NULL),(7,1,'StoreA','education',NULL,NULL,'Draw With Rob','Rob Biddulph','HarperCollinsChildren\'sBooks','0008419116','“As close to perfection as you can get” The Times\n\n“Joyful and uplifting. Superb” Daily Mail',12,'https://s1.ax1x.com/2020/07/07/UFLu0P.jpg',74,NULL),(8,1,'StoreA','fiction','travel',NULL,'The Devil Rides Out','Paul O\'Grady',' Bantam Press','000593064240','\"If you only buy one celeb memoir this year, make it this one.\" (News of the World)\n\"Far and away the best writer of the lot ... his turn of phrase is a joy.\" (The Sunday Times)\n\"Even funnier and more touching than the million-selling first volume. I defy anyone not to enjoy this book.\" (Jilly Cooper Daily Telegraph',10,'https://s1.ax1x.com/2020/07/07/UFLZ6A.jpg',77,NULL),(9,1,'StoreA','pets','love',NULL,'Christmas at Battersea: True Stories of Miracles and Hope','Battersea Dogs & Cats Home ','Penguin','1405919701','Battersea Dogs & Cats Home is the UK\'s oldest and most famous home for dogs and cats. The Home aims never to turn away a dog or cat in need of help, reuniting lost dogs and cats with their owners or caring for them until new homes can be found. Battersea also works to educate the public about responsible pet ownership. Every year the Home cares for over 9,000 lost, abandoned and neglected dogs and cats, and in 2010 the home marked its 150th anniversary.',5.02,'https://s1.ax1x.com/2020/07/07/UFLeOI.jpg',89,NULL),(10,1,'StoreA','pets','love',NULL,'A Friend for Life','Battersea Dogs & Cats Home ','Penguin','1405925590','True stories of love and rescue from Battersea Dogs and Cats Home, where it is the pets, rather than the owners, who save and change lives . . ., from the publisher\'s description',13.1,'https://s1.ax1x.com/2020/07/07/UFLnmt.jpg',62,NULL),(11,1,'StoreA','life','love',NULL,'Five Minute Mum','Daisy Upton','Penguin','0241443628',' The book has 100s of the easiest best ideas! Honestly it\'s AMAZING. I think everyone should have this book., Liv Lewis, Ultimate Girl Gang.So many fab ideas in here! Love it., Rosie Ramsey\n',28.6,'https://s1.ax1x.com/2020/07/12/U8U8Xt.jpg',98,NULL),(12,1,'StoreA','life',NULL,NULL,'Feel Better In 5: Your Daily Plan to Feel Great for Life','Dr Rangan Chatterjee','Penguin Life','0241397804','Dr. Chatterjee is regarded as one of the most influential doctors in the UK and wants to change how medicine will be practiced for years to come. He hosts the biggest health podcast in Europe, ‘Feel Better, Live More’, #1 on Apple podcasts and announced as one of the most downloaded new podcasts of the past year. He is known for finding the root cause of people\'s health problems and he highlighted his methods in the ground-breaking BBC television show, Doctor in the House, which has been shown in over 70 countries around the world.',25.1,'https://s1.ax1x.com/2020/07/12/U8UJnP.jpg',66,NULL),(13,1,'StoreA','funny','science',NULL,'2,024 QI Facts To Stop You In Your Tracks','John Lloyd & James Harkin &  Anne Miller','Faber & Faber; Main edition','0571348963','A fantastic collection of pithy conversation-starting facts.\' --(Charlie Higson)\n\n\'Intriguing, hilarious and downright surprising little nuggets of information.\' --(Daily Mirror)\n\n\'Fascinating ... The answers to the questions you never even thought to ask.\' --(Daily Mail)',16.38,'https://s1.ax1x.com/2020/07/12/U8U36I.jpg',27,NULL),(14,1,'StoreA','science',NULL,NULL,'Breath: The New Science of a Lost Art','James Nestor','Penguin Life','0241289084','A fascinating scientific, cultural, spiritual and evolutionary history of the way humans breathe - and how we\'ve all been doing it wrong for a long, long time. I already feel calmer and healthier just in the last few days, from making a few simple changes in my breathing, based on what I\'ve read. Our breath is a beautiful, healing, mysterious gift, and so is this book',44.7,'https://s1.ax1x.com/2020/07/12/U8U11A.jpg',23,NULL),(15,1,'StoreA','life','education',NULL,'Into the Wild','Jon Krakauer','Pan; Main Market edition','0330351699','What would possess a gifted young man recently graduated from college to literally walk away from his life? Noted outdoor writer and mountaineer Jon Krakauer tackles that question in his reporting on Chris McCandless, whose emaciated body was found in an abandoned bus in the Alaskan wilderness in 1992.',15.1,'https://s1.ax1x.com/2020/07/12/U8Ulpd.jpg',18,NULL),(16,1,'StoreA','sports','life',NULL,'Eleven Rings','Phil Jackson','Virgin Books','0753556383','PHIL JACKSON is arguably the greatest coach in the history of the NBA. His reputation was established as head coach of the Chicago Bulls from 1989-1998; during his tenure, Chicago won six NBA titles. His next team, the Los Angeles Lakers, won five NBA titles, from 2000 to 2010. He holds the record for the most championships in NBA history as a player and a head coach.  In addition to Eleven Rings, he is also the author of Maverick,Sacred Hoops, and, with his friend Charley Rosen, More Than a Game.',21.99,'https://s1.ax1x.com/2020/07/12/U8Uc7T.jpg',3,NULL),(17,1,'StoreA','pets','life',NULL,'Max the Miracle Dog: The Heart-warming Tale of a Life-saving Friendship','Kerry Irving','HarperElement','0008353492','Kerry Irving lives and works in Keswick in the English Lake District with his wife Angela. A keen amateur photographer, Kerry has a passion for the outdoors, hill walking, camping and is a great lover of animals and the environment. After a road traffic accident left him with spinal injuries and chronic pain, Kerry s mental well-being suffered dramatically. Little did he know that a young dog called Max would transform his life forever. This is his story.',17.99,'https://s1.ax1x.com/2020/07/12/U8Uatg.jpg',95,NULL),(18,1,'StoreA','history','education','literature','Lost Japan','Alex Kerr','Penguin','0141979747','One of the finest books about Japan written in decades, Insight Japan --This text refers to the paperback edition.Alex Kerr is an American writer and Japanologist whose previous books include Lost Japan and Another Kyoto. He was the first foreigner to be awarded the Shincho Gakugei Literature Prize for the best work of non-fiction published in Japan.',14.64,'https://s1.ax1x.com/2020/07/12/U8UY0f.jpg',37,NULL),(19,1,'StoreA','adventure','life',NULL,'A Walk in the Woods','William Roberts','Black Swan','1784161446','In the company of his friend Stephen Katz (last seen in the bestselling Neither Here nor There), Bill Bryson set off to hike the Appalachian Trail, the longest continuous footpath in the world. Ahead lay almost 2,200 miles of remote mountain wilderness filled with bears, moose, bobcats, rattlesnakes, poisonous plants, disease-bearing tics, the occasional chuckling murderer and - perhaps most alarming of all - people whose favourite pastime is discussing the relative merits of the external-frame backpack.',15,'https://s1.ax1x.com/2020/07/12/U8Ut78.jpg',95,NULL),(20,1,'StoreA','sports',NULL,NULL,'Fringes: Life on the Edge of Professional Rugby','Ben Mercer','Independently published','1711795534','Sports books tend to detail extraordinary achievements, triumphs against the odds or commemorate World Cup winning captains.\nThis book does not do that.\nFor many, playing professional sport is the Dream Job. Few manage it, very few make it to the top and for the rest, life is very different. This is their story. In Fringes, Ben Mercer invites you to witness life at the outer edges of professional rugby.',20.22,'https://s1.ax1x.com/2020/07/12/U8UUAS.jpg',86,NULL),(21,2,'StoreB','sports','life',NULL,'Kettlebell Simple & Sinister: Revised and Updated Edition','Pavel Tsatsouline','StrongFirst','0989892433','This is Kettlebell Simple & Sinister: Revised & Updated Edition or simply S&S 2.0. Learn how to use the extreme hand-held gym from the man who started the kettlebell revolution.\nSimple & Sinister will physically prepare you for almost anything life could throw at you, from carrying a piano upstairs or holding your own in a street fight.',16.88,'https://s1.ax1x.com/2020/07/12/U8U0pj.jpg',33,NULL),(22,2,'StoreB','science','sports',NULL,'Into Thin Air ','Jon Krakauer & Philip Franklin','Pan; Main Market edition','1447200187','Jon Krakauer is a mountaineer and the author of Eiger Dreams, Into the Wild, (which was on the New York Times bestseller list for over a year and was made into a film starring Emile Hirsch and Kristen Stewart) Into Thin Air, Iceland, Under the Banner of Heaven and Where Men Win Glory. He is also the editor of the Modern Library Exploration series. He has received an Academy Award in Literature from the American Academy of Arts and Letters. ',10.68,'https://s1.ax1x.com/2020/07/12/U8UdhQ.jpg',98,NULL),(23,2,'StoreB','life','science',NULL,'100 Things You Can Do to Stay Fit and Healthy: Simple Steps to Better Your Body and Improve Your Mind','Scott Douglas','Skyhorse Publishing','1510712356','Scott Douglas is senior content editor for Runner’s World and the author or co-author of seven other books, including The Little Red Book of Running and the New York Times best seller Meb for Mortals. He has written for Slate, The Atlantic and the Washington Post, among others. Scott lives in South Portland, Maine.',19.99,'https://s1.ax1x.com/2020/07/12/U8Uyn0.jpg',78,NULL),(24,2,'StoreB','life','education',NULL,'Rewild Yourself: 23 Spellbinding Ways to Make Nature More Visible','Simon Barnes','Simon & Schuster UK','1471175421','Simon Barnes was the Chief Sports Writer for The Times until 2014, having worked for the paper for 30 years, during which time he covered seven Olympic Games and six World Cup finals. He is the author of several books, including the bestselling How to be a Bad Birdwatcher. He lives in Norfolk.',16.45,'https://s1.ax1x.com/2020/07/12/U8U2AU.jpg',82,NULL),(25,2,'StoreB','sports',NULL,NULL,'Golf is Not a Game of Perfect','Dr. Bob Rotella','Simon & Schuster UK','0743492471','Dr. Bob Rotella is a consultant to the PGA of America, the PGA Tour, and the LPGA Tour. He is the author of several bestselling golf books including GOLF IS NOT A GAME OF PERFECT.',9.99,'https://s1.ax1x.com/2020/07/12/U8UDcn.jpg',32,NULL),(26,2,'StoreB','pets','life',NULL,'H is for Hawk','Helen Macdonald','Vintage','0099575450','Helen Macdonald is an English writer, naturalist, and an Affiliated Research Scholar at the University of Cambridge Department of History and Philosophy of Science. She is best known as the author of H is for Hawk, which won the 2014 Samuel Johnson Prize and Costa Book Award.\nBio from Wikipedia, the free encyclopedia.',18.48,'https://s1.ax1x.com/2020/07/12/U8UrXq.jpg',49,NULL),(27,2,'StoreB','funny','fiction',NULL,'Mr Unbelievable','Chris Kamara','HarperSport','0007363176','Once feared as a football hard man and combative midfield enforcer, Kamara is now the affable, hugely popular SkySports presenter who hosts Goals on Sunday and, most famously, puts in excitable weekly shifts on Jeff Stelling\'s cult show Soccer Saturday. It is Kamara\'s trademark enthusiasm and idiosyncratic turn of phrase, delivered from various wind-swept gangplanks from up and down the country, that have firmly cemented his place in the nation\'s affections.',26.72,'https://s1.ax1x.com/2020/07/12/U8U6BV.jpg',94,NULL),(28,2,'StoreB','education','child','sports','The playHOORAY! Handbook: 100 Fun Activities for Busy Parents and Little Kids Who Want to Play','Claire Russell ','Seven Dials','1398700703','Claire Russell is the founder of playHOORAY! She lives in Nottingham with her energetic husband Ben, vehicle-loving, five-year-old son Mason and an extremely handsome flat-coated retriever Archie.',12.19,'https://s1.ax1x.com/2020/07/12/U8URNF.jpg',7,NULL),(29,2,'StoreB','fantasy','fiction',NULL,'FORTNITE Official: The Chronicle (Annual 2020) (Official Fortnite Books)','Epic Games','Wildfire','1472262144','Ever since it burst onto our screens in October 2017, Fortnite has been in a state of constant evolution. From meteor showers to pirates, the Cube to the Ice King, the narrative of the game is dynamic and ever-changing. Take a trip down memory lane and revisit Battle Royale\'s most momentous moments!',25.68,'https://s1.ax1x.com/2020/07/12/U8UWh4.jpg',58,NULL),(30,2,'StoreB','sports','life',NULL,'How to Build a Car: The Autobiography of the World\'s Greatest Formula 1 Designer ','Adrian Newey','HarperCollins','0008196806','Adrian Newey OBE is arguably the greatest car designer in the history of Formula One. Newey has worked in both Formula One and IndyCar racing as an immensely successful race engineer, aerodynamicist, designer and technical director. ',12.77,'https://s1.ax1x.com/2020/07/12/U8Uh9J.jpg',81,NULL),(31,2,'StoreB','pets',NULL,NULL,'Arthur: The dog who crossed the jungle to find a home','Mikael Lindnord ','Two Roads','1473625262','Lindnord draws readers into his story, confiding the many ways that Arthur touched and enriched his life . . . [a] story about the powerful connection that can develop between people and dogs.The epic true story of one man, his dog, and how they found each other.',18.13,'https://s1.ax1x.com/2020/07/12/U8U7B6.jpg',52,NULL),(32,2,'StoreB','life',NULL,NULL,'Woodwork: The Complete Step-by-step Manual','DK','DK ','0241412420','From humble beginnings in a London studio to a global reach today, DK\'s aims to inspire, educate and entertain have always remained the same. Now a world-leading illustrated reference publisher, DK is committed to delivering world-class information with unparalleled clarity, crafted with quality and authority you can trust.',21.16,'https://s1.ax1x.com/2020/07/12/U8U439.jpg',11,NULL),(33,2,'StoreB','child','education',NULL,'The Boy At the Back of the Class','Onjali Rauf','Orion Children\'s Books','1510105018','This book\'s greatest strength is how it conveys the motive nature of its main theme (the refugee crisis) in a way that opens up conversations instead of shutting them down. \'The Boy At The Back of The Class\' is not only a well-written book that begs the reader to keep reading, but also one that opens up a dialogue that we need to be having with our young people.',24.14,'https://s1.ax1x.com/2020/07/12/U8U5cR.jpg',90,NULL),(34,2,'StoreB','education','child',NULL,'Times Fables: Learn your times tables in as little as a week','J Wilson','CreateSpace Independent Publishing Platform','1979752796','Many children find it hard to learn their times tables. This book makes it really fun, by teaching the times tables through stories that have been specially developed with visual learners in mind. Recommended for ages 5+',12.74,'https://s1.ax1x.com/2020/07/12/U8UIj1.jpg',46,NULL),(35,2,'StoreB','history','life',NULL,'Putin’s People: How the KGB Took Back Russia and then Took on the West','Catherine Belton','William Collins','0007578792','Catherine Belton is the former long-serving Moscow Correspondent for the Financial Times. She has previously reported on Russia for Moscow Times and Business Week. In 2008, she was shortlisted for Business Journalist of the year at the British Press Awards. She lives in London.',42.11,'https://s1.ax1x.com/2020/07/12/U8UTnx.jpg',86,NULL),(36,2,'StoreB','history',NULL,NULL,'Why I’m No Longer Talking to White People About Race:','Reni Eddo-Lodge','Bloomsbury Publishing','1408870584','This is a book that was begging to be written. This is the kind of book that demands a future where we\'ll no longer need such a book. Essential, Marlon James, Man Booker Prize-Winner 2015.Set to blow apart the understanding of race relations in this country, Stylist',21.46,'https://s1.ax1x.com/2020/07/12/U8UHHK.jpg',21,NULL),(37,2,'StoreB','fiction','fantasy',NULL,'A Song of Ice and Fire, 7 Volumes','HarperCollins Publishers','HarperCollins Publishers','0007477155','Collins is also home to Collins bilingual dictionaries and language learning products, such as the Paul Noble audio courses, and the much-loved Gem phrasebooks. We also publish the official SCRABBLE dictionaries, a wide range of quiz books, and crossword books including both The Times and Bradford\'s crossword series.',67.19,'https://s1.ax1x.com/2020/07/12/U8UO4e.jpg',21,NULL),(38,2,'StoreB','fantasy','science',NULL,'A Game of Thrones ','George R.R. Martin ','HarperVoyager','0007548230','This book is really interesting, I can\'t take my eyes off it.It is written in simple language and the plot is easy to understand.I like the fact that all the important characters, their information has been clearly cited at the end of the book, in the appendix.I hope to read the next book of this series soon.',27.17,'https://s1.ax1x.com/2020/07/12/U8UqAO.jpg',38,NULL),(39,2,'StoreB','fantasy','fiction',NULL,'Fire and Blood: 300 Years Before A Game of Thrones','George R.R. Martin','HarperVoyager','0008307733','Set 300 years before the events in A Song of Ice and Fire, FIRE AND BLOOD is the definitive history of the Targaryens in Westeros as told by Archmaester Gyldayn, and chronicles the conquest that united the Seven Kingdoms under Targaryen rule through to the Dance of the Dragons: the Targaryen civil war that nearly ended their dynasty forever.',16.48,'https://s1.ax1x.com/2020/07/12/U8ULND.jpg',1,NULL),(40,2,'StoreB','history',NULL,NULL,'Too Much and Never Enough: How My Family Created the World\'s Most Dangerous Man','Mary L. Trump Ph.D.','Simon & Schuster UK','1471190137','Mary L. Trump holds a PhD from the Derner Institute of Advanced Psychological Studies and taught graduate courses in trauma, psychopathology and developmental psychology. She lives with her daughter in New York.',22.99,'https://s1.ax1x.com/2020/07/12/U8Uv3d.jpg',48,NULL),(41,3,'StoreC','Fantasy','science fiction','happy','Harry Potter Children\'s Collection','J.K. Rowling','Bloomsbury Children\'s Books','9781408856','I\'ve yet to meet a ten-year-old who hasn\'t been entranced by its witty, complex plot and the character of the eponymous Harry, Independent\nSpellbinding, enchanting, bewitching stuff, Mirror\nTeachers say a chapter can silence the most rowdy of classes, Guardian\nOne of the greatest literary adventures of modern times, Sunday Telegraph',70.88,'https://s1.ax1x.com/2020/07/12/UGier6.jpg',22,NULL),(42,3,'StoreC','young','Fantasy',NULL,'Noughts & Crosses ','Malorie Blackman',' Penguin','9780141378','Unforgettable, Independent Published On: 2008-02-07\n\nPacks some powerful political punches, Guardian',16.88,'https://s1.ax1x.com/2020/07/12/U8Uj9H.jpg',31,NULL),(43,3,'StoreC','young','science fiction','sad','The Constant Rabbit','Jasper Fforde','1','1444763628','Fforde\'s engaging writing has created a story that is a clever blend of the biting allegorical satire we expect from Orwell\'s greatest hits and the good-natured adventures of Michael Bond\'s naïve and kind-hearted Paddington Bear. , SciFi Now\nA born wordsmith of effervescent imagination, Independent\n\nForget all the rules of time, space and reality; just sit back and enjoy the adventure, Telegraph',28.77,'https://s1.ax1x.com/2020/07/12/UGimqK.jpg',29,NULL),(44,3,'StoreC','young','Fantasy',NULL,'The Three-Body Problem','Cixin Liu','Head of Zeus','178497157X','A marvellous mélange of awe-inspiring scientific concepts, clever plotting and quirky yet plausible characters, all conveyed in in a plain style capable of signalling hidden depths\' The Times.\'A milestone in Chinese science fiction\' New York Times.The best kind of science fiction\' Kim Stanley Robinson.Liu Cixin\'s impressive The Three Body Problem won the 2015 Hugo award for best novel, the first time a Chinese writer has taken that prize\' Guardian (2015 Books of the Year)',14.74,'https://s1.ax1x.com/2020/07/12/UGiZKx.jpg',47,NULL),(45,3,'StoreC','Fantasy','science fiction','horrific','Brave New World','Aldous Huxley ',' Vintage Classics','9780099518','ITH AN INTRODUCTION BY MARGARET ATWOOD. Far in the future, the World Controllers have created the ideal society. Through clever use of genetic engineering, brainwashing and recreational sex and drugs all its members are happy consumers. Bernard Marx seems alone harbouring an ill-defined longing to break free. ',13.83,'https://s1.ax1x.com/2020/07/12/UGiEx1.jpg',41,NULL),(46,3,'StoreC','young','Fantasy',NULL,'Circe: The International','Madeline Miller','Bloomsbury Publishing','1408890046','SHORTLISTED FOR THE WOMEN\'S PRIZE FOR FICTION 2019\n\nThe captivating Sunday Times top ten and New York Times number one bestseller by the Orange Prize-winning author of The Song of Achilles; \'spellbinding . a thrilling tour de force\' (Mail on Sunday)',14.68,'https://s1.ax1x.com/2020/07/12/UGiA2R.jpg',80,NULL),(47,3,'StoreC','Fantasy','science fiction','traditional','The Hobbit','J. R. R. Tolkien','HarperCollinsChildren\'sBooks','9780007458','J. R. R. Tolkien (1892-1973) was a distinguished academic, though he is best known for writing The Hobbit, The Lord of the Rings and The Silmarillion, plus other stories and essays. His books have been translated into over 50 languages and have sold many millions of copies worldwide.',13,'https://s1.ax1x.com/2020/07/12/UGi1Gd.jpg',59,NULL),(48,3,'StoreC','young','Fantasy',NULL,'Dune','Frank Herbert',' Hodder Paperbacks','0340960191','The bestselling science fiction novel of all time, with nearly ten million copies in print',17.04,'https://s1.ax1x.com/2020/07/12/UGiKaD.jpg',85,NULL),(49,3,'StoreC','young','science fiction','trendy','Knife Edge','Malorie Blackman','Penguin','0141378654','Devastatingly powerful, The Guardian\nMoving and thought-provoking, Observer\nBlackman\'s absorbing but alarming novel deals with themes of racism and prejudice...Unforgettable, Independent Published On: 2008-02-07\nStimulating and emotionally satisfying, Financial Times',9.88,'https://s1.ax1x.com/2020/07/12/UGiuVO.jpg',68,NULL),(50,3,'StoreC','Fantasy','science fiction',NULL,'Dragonology: The Complete Book of Dragons','Dugald Steer','Templar Publishing','1840115033','Dugald Steer was born in 1965 and grew up in Surrey, where his love of books and reading led him to study English Literature and Philosophy at Bristol. Several jobs later Dugald began working at Templar Publishing, where he worked his way up to Senior Editor, writing and editing many books in house. He has written more than 100 books for Templar and, after going freelance to concentrate on writing, he authored the first eight books in their hugely successful \'Ology series. ',29.22,'https://s1.ax1x.com/2020/07/12/UGiMIe.jpg',58,NULL),(51,3,'StoreC','young','Fantasy','tragedy','The Monsterology Handbook: A Practical Course in Monsters ','Ernest Drake','Candlewick Press (MA)','0763646229','Douglas Carrel, Chief Draughtsman: A native of Scotland, Douglas Carrel was clearly a dragonologist of some standing, and often accompanied Dr. Drake on some of his more fruitful expeditions. In a letter from Constantinople to the editor he says, \"It is with considerable sense of honour, and no small amount of pride, that I lend my hand to the compiling of this most worthy volume . . . Ultimately, I feel that all of us',20.82,'https://s1.ax1x.com/2020/07/12/UGilPH.jpg',44,NULL);
/*!40000 ALTER TABLE `t_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Comment`
--

DROP TABLE IF EXISTS `t_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Comment` (
  `Comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `User_num` int(11) DEFAULT NULL,
  `Store_num` int(11) DEFAULT NULL,
  `Order_num` int(11) DEFAULT NULL,
  `Comment_ID` int(11) NOT NULL,
  `Comment_detail` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Comment_mark` double NOT NULL,
  PRIMARY KEY (`Comment_num`),
  KEY `FK_Relationship_7` (`Store_num`),
  KEY `FK_Relationship_8` (`Order_num`),
  KEY `FK_Relationship_9` (`User_num`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`Store_num`) REFERENCES `t_Store` (`Store_num`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`Order_num`) REFERENCES `t_Order` (`Order_num`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`User_num`) REFERENCES `t_Users` (`User_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Comment`
--

LOCK TABLES `t_Comment` WRITE;
/*!40000 ALTER TABLE `t_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Order`
--

DROP TABLE IF EXISTS `t_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Order` (
  `Order_num` int(11) NOT NULL AUTO_INCREMENT,
  `Book_num` int(11) DEFAULT NULL,
  `User_num` int(11) DEFAULT NULL,
  `Order_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Users` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Store` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Price` float NOT NULL,
  `Order_Phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_addr` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Book` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Booknum` int(11) NOT NULL,
  `Order_Receiver` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Order_num`),
  KEY `FK_Relationship_14` (`User_num`),
  KEY `FK_Relationship_15` (`Book_num`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`User_num`) REFERENCES `t_Users` (`User_num`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`Book_num`) REFERENCES `t_Book` (`Book_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Order`
--

LOCK TABLES `t_Order` WRITE;
/*!40000 ALTER TABLE `t_Order` DISABLE KEYS */;
INSERT INTO `t_Order` VALUES (1,11,5,'2803359910','Pu Cao','StoreA',28.6,'18012345678','Hunan Zhangjiajie','waiting','Five Minute Mum',2,'Pu Cao'),(2,9,5,'7486365277','Pu Cao','StoreA',5.02,'18012345678','Hunan Zhangjiajie','waiting','Christmas at Battersea: True Stories of Miracles and Hope',1,'Pu Cao'),(3,2,5,'1330846373','Pu Cao','StoreB',16.22,'18012345678','Hunan Zhangjiajie','waiting','Skincare: The ultimate no-nonsense guide',2,'Pu Cao'),(4,5,5,'4311307612','Pu Cao','StoreA',16.38,'18012345678','Hunan Zhangjiajie','sending','Collins Stargazing: Beginners guide to astronomy',1,'Pu Cao'),(5,35,5,'7614405213','Pu Cao','StoreB',42.11,'18012345678','Hunan Zhangjiajie','paid','Putin’s People: How the KGB Took Back Russia and then Took on the West',1,'Pu Cao'),(6,22,5,'9210715123','Pu Cao','StoreB',10.68,'18012345678','Hunan Zhangjiajie','paid','Into Thin Air ',1,'Pu Cao'),(8,15,4,'7868534631','Zifeng Ding','StoreA',15.1,'18056629279','Xian Shanxi','sending','Into the Wild',3,'Zifeng Ding'),(9,29,4,'2421787189','Zifeng Ding','StoreB',25.68,'18056629279','Xian Shanxi','paid','FORTNITE Official: The Chronicle (Annual 2020) (Official Fortnite Books)',1,'Zifeng Ding'),(10,30,4,'0573309633','Zifeng Ding','StoreB',12.77,'18056629279','Xian Shanxi','waiting','How to Build a Car: The Autobiography of the World\'s Greatest Formula 1 Designer ',2,'Zifeng Ding'),(11,32,4,'1703645106','Zifeng Ding','StoreB',21.16,'18056629279','Xian Shanxi','paid','Woodwork: The Complete Step-by-step Manual',1,'Zifeng Ding'),(12,40,4,'8762552465','Zifeng Ding','StoreB',22.99,'18056629279','Xian Shanxi','waiting','Too Much and Never Enough: How My Family Created the World\'s Most Dangerous Man',1,'Zifeng Ding'),(13,46,4,'3321772361','Zifeng Ding','StoreC',14.68,'18056629279','Xian Shanxi','waiting','Circe: The International',1,'Zifeng Ding'),(14,51,4,'8471523392','Zifeng Ding','StoreC',20.82,'18056629279','Xian Shanxi','waiting','The Monsterology Handbook: A Practical Course in Monsters ',1,'Zifeng Ding'),(16,3,4,'4900997888','Zifeng Ding','StoreA',16.22,'18056629279','Xian Shanxi','waiting','Skincare: The ultimate no-nonsense guide',3,'Zifeng Ding');
/*!40000 ALTER TABLE `t_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Quest`
--

DROP TABLE IF EXISTS `t_Quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Quest` (
  `Quest_num` int(11) NOT NULL AUTO_INCREMENT,
  `Store_num` int(11) DEFAULT NULL,
  `User_num` int(11) DEFAULT NULL,
  `Quest_Users` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quest_kind` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quest_detail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quest_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quest_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`Quest_num`),
  KEY `FK_Relationship_1` (`User_num`),
  KEY `FK_Relationship_10` (`Store_num`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`User_num`) REFERENCES `t_Users` (`User_num`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`Store_num`) REFERENCES `t_Store` (`Store_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Quest`
--

LOCK TABLES `t_Quest` WRITE;
/*!40000 ALTER TABLE `t_Quest` DISABLE KEYS */;
INSERT INTO `t_Quest` VALUES (2,NULL,5,'Pu Cao','advice','I think the graphics interface should be more pretty.','handled',1),(3,NULL,5,'Pu Cao','change','Hello, My name is cp!','unhandled',1),(4,NULL,5,'Pu Cao','question','Why the sending service is so slow ?','unhandled',1),(5,NULL,4,'Zifeng Ding','advice','Can you show store\'s books in store\'s backend management ?','unhandled',1);
/*!40000 ALTER TABLE `t_Quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Store`
--

DROP TABLE IF EXISTS `t_Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Store` (
  `Store_num` int(11) NOT NULL AUTO_INCREMENT,
  `User_num` int(11) DEFAULT NULL,
  `Store_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Store_owner` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Store_mark` double NOT NULL,
  PRIMARY KEY (`Store_num`),
  KEY `FK_Relationship_3` (`User_num`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`User_num`) REFERENCES `t_Users` (`User_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Store`
--

LOCK TABLES `t_Store` WRITE;
/*!40000 ALTER TABLE `t_Store` DISABLE KEYS */;
INSERT INTO `t_Store` VALUES (1,4,'storeA','dzf',9),(2,5,'storeB','cp',7),(3,9,'storeC','scj',8),(5,10,'storeD','Yuxuan Yang',9);
/*!40000 ALTER TABLE `t_Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_Users`
--

DROP TABLE IF EXISTS `t_Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_Users` (
  `User_num` int(11) NOT NULL AUTO_INCREMENT,
  `Store_num` int(11) DEFAULT NULL,
  `User_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_pass` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_mail` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_addr` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`User_num`),
  KEY `FK_Relationship_2` (`Store_num`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`Store_num`) REFERENCES `t_Store` (`Store_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_Users`
--

LOCK TABLES `t_Users` WRITE;
/*!40000 ALTER TABLE `t_Users` DISABLE KEYS */;
INSERT INTO `t_Users` VALUES (2,NULL,'zds','*5B312790EEDF656E2CBF43EE5C0229A4B3932494','Maple','2017900082','18056629870','1335908147@qq.com','Xian','client'),(3,NULL,'abcd123','*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','John','8050849522','18056629279','3904304903@gmail.com','Anhui Hefei','client'),(4,1,'dzf','*5B312790EEDF656E2CBF43EE5C0229A4B3932494','Zifeng Ding','5777666971','18056629279','1335908147@qq.com','Xian Shanxi','merchant'),(5,2,'cp','*2A032F7C5BA932872F0F045E0CF6B53CF702F2C5','Pu Cao','9123272360','18012345678','534324432@qq.com','Hunan Zhangjiajie','merchant'),(8,NULL,'hyd','*5DB129976CAFDF5E6C91697C6E68213D7101BAC1','Yaodong Han','4686683243','19482932932','342324432@qq.com','Shanghai','client'),(9,NULL,'scj','*4C943D9B7E2F55066E8F7C13F8DCF8F67EEDC931','Chengjie Shi','5543739239','14282932932','353324432@qq.com','Hebei Xingtai','merchant'),(10,5,'yyx','*4C943D9B7E2F55066E8F7C13F8DCF8F67EEDC931','Yuxuan Yang','6706575582','17839248245','58494239@qq.com','Shandong Qindao','merchant');
/*!40000 ALTER TABLE `t_Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger encrypt_passwd
before insert on `t_Users` for each row
begin
  set new.User_pass = PASSWORD(new.User_pass);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 11:07:50
