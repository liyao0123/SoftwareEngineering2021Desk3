CREATE TABLE fauna(
id INT PRIMARY KEY,
description VARCHAR(255)
);

INSERT INTO fauna VALUES(
1, 'diuahsdiu aishdiahsidhiasd asdiu haishd iahsidh asd asidh iahsdi haishdik aisdbas asdi haisdhiabsid baisbdiu asd iahsdibh iausbdi baisdbi abi
sdb a aisbhdbi baisdb iasbd ibaisdb iuassdas baisbd iabsid baisbdi absid baibsdiabsoidbasiudbciuasbdciou yabsiudbasoidxboia sbdiuasbdiu asd iba
sidb iasbdi basi db asihdio hasid iuashda iashdi haishd iashid aihdsiu hasilduh aishdi ahsiud iasdi hasidhb iasbhd ibasid biabsd 
ashd iahsdi baisdb iasbsdiu basiudbiauss iahsiudhaisdhi ahiuhdiuashdiabsid hasisdhb iuasdiu hisahdfiuahsdiuf isudhf iudhfi iudhf iushd if
asfd hioauhdfi hasodfh oasddhfo hsaodnf oinsaddofh oisdf.sdf./sd.df/ sdfiuh oiushdifh iusdahfi hasdohf ashdof joads f.//da,f/ adfh oisajhdofi hosdajf
ash doahfo hsaodfh oshdofh o;asdf;oh a;sodnfo nasdoifhnpaoiusd hfoiuasdhf iubasdiuydfhiauEHFDIP9UAHCOIUAH'
);

SELECT * FROM fauna;

diuahsdiu aishdiahsidhiasd asdiu haishd iahsidh asd asidh iahsdi haishdik aisdbas asdi haisdhiabsid baisbdiu asd iahsdibh iausbdi baisdbi abi
sdb a aisbhdbi baisdb iasbd ibaisdb iuassdas baisbd iabsid baisbdi absid baibsdiabsoidbasiudbciuasbdciou yabsiudb

ALTER TABLE fauna ADD des TEXT;

INSERT INTO fauna VALUES(2,'tiger','diuahsdiu aishdiahsidhiasd asdiu haishd iahsidh asd asidh iahsdi haishdik aisdbas asdi haisdhiabsid baisbdiu asd iahsdibh iausbdi baisdbi abi
sdb a aisbhdbi baisdb iasbd ibaisdb iuassdas baisbd iabsid baisbdi absid baibsdiabsoidbasiudbciuasbdciou yabsiudbasoidxboia sbdiuasbdiu asd iba
sidb iasbdi basi db asihdio hasid iuashda iashdi haishd iashid aihdsiu hasilduh aishdi ahsiud iasdi hasidhb iasbhd ibasid biabsd 
ashd iahsdi baisdb iasbsdiu basiudbiauss iahsiudhaisdhi ahiuhdiuashdiabsid hasisdhb iuasdiu hisahdfiuahsdiuf isudhf iudhfi iudhf iushd if
asfd hioauhdfi hasodfh oasddhfo hsaodnf oinsaddofh oisdf.sdf./sd.df/ sdfiuh oiushdifh iusdahfi hasdohf ashdof joads f.//da,f/ adfh oisajhdofi hosdajf
ash doahfo hsaodfh oshdofh o;asdf;oh a;sodnfo nasdoifhnpaoiusd hfoiuasdhf iubasdiuydfhiauEHFDIP9UAHCOIUAH');



CREATE TABLE fauna(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
AREA VARCHAR(20) NOT NULL,
threat VARCHAR(255) DEFAULT NULL,
link VARCHAR(100) NOT NULL,
picture VARCHAR(50) DEFAULT '/', 
description TEXT DEFAULT NULL
);

INSERT INTO fauna VALUES
(NULL,'African penguin','Africa,Asia','Historical exploitation
Oil spills
Competition with fisheries','https://en.wikipedia.org/wiki/African_penguin','/images/African_penguin.jpg','60–70 cm tall and weigh between 2.2–3.5 kg 
They have a black stripe and black spots on the chest, 
The sweat glands above the eyes might be pink.
African penguins have a very recognisable appearance, with a thick band of black that in the shape of an upside-down horseshoe. 
They have black feet and black spots that vary in size and shape between individuals. Magellanic penguins share a similar bar marking that often confuses the two; Magellanics have a double bar on the throat and chest, whereas the African has a single bar.
These penguins have the nickname "jackass penguin", which comes from the loud noises they make.'),
(NULL,'Siberian tiger','Asia,Europe','Low genetic diversity
Geographic isolation
Poaching','https://en.wikipedia.org/wiki/Siberian_tiger','/images/Siberian_tiger.jpg','The tiger is reddish-rusty, or rusty-yellow in colour, with narrow black transverse stripes.
The body length is not less than 150 cm , condylobasal length of skull 250 mm, zygomatic width 180 mm, and length of upper carnassial tooth over 26 mm  long. It has an extended supple body standing on rather short legs with a fairly long tail.'),
(NULL,'Asian elephant','Asia,Africa','Loss, degradation and fragmentation of  habitats
Human hunting','https://en.wikipedia.org/wiki/Asian_elephant','/images/Asian_elephant.jpg','In general, the Asian elephant is smaller than the African bush elephant and has the highest body point on the head.
The back is convex or level. 
The ears are small with dorsal borders folded laterally. 
The feet have more nail-like structures than those of African elephants—five on each forefoot, and four on each hind foot. 
The forehead has two hemispherical bulges, unlike the flat front of the African elephant.'),
(NULL,'African wild dog','Africa,Europe','Habitat fragmentation
Herder’s hunting','https://en.wikipedia.org/wiki/African_wild_dog','/images/African_wild_dog.jpg','Compared to members of the genus Canis, the African wild dog is comparatively lean and tall, with outsized ears and lacking dewclaws. 
The middle two toepads are usually fused. 
The heel of the lower carnassial M1 is crested with a single, blade-like cusp, which enhances the shearing capacity of the teeth, thus the speed at which prey can be consumed. 
The fur of the African wild dog differs significantly from that of other canids, consisting entirely of stiff bristle-hairs with no underfur. It gradually loses its fur as it ages, with older individuals being almost naked.
Little variation in facial markings occurs, with the muzzle being black, gradually shading into brown on the cheeks and forehead. A black line extends up the forehead, turning blackish-brown on the back of the ears
The tail is usually white at the tip, black in the middle and brown at the base.'),
(NULL,'Giant otter','America,Asia','Poaching has long been a problem. 
Habitat destruction and degradation 
Conflict with fishermen','https://en.wikipedia.org/wiki/Giant_otter','/images/Giant_otter.jpg','It has the greatest body length of any species in the mustelid family, although the sea otter may be heavier.
The giant otter has the shortest fur of all otter species; it is typically chocolate brown, but may be reddish or fawn, and appears nearly black when wet. The fur is extremely dense, so much so that water cannot penetrate to the skin. 
Unique markings of white or cream fur color the throat and under the chin. They engage in a behavior known as "periscoping", displaying their throats and upper chests to each other.
Giant otter muzzles are short and sloping and give the head a ball-shaped appearance. The ears are small and rounded. 
The nose (or rhinarium) is completely covered in fur, with only the two slit-like nostrils visible.');


SELECT * FROM fauna;


UPDATE fauna SET AREA = 'America'
WHERE id = 5;

ALTER TABLE fauna ADD false_area VARCHAR(20) NOT NULL;

DESC fauna;

UPDATE fauna SET false_area = 'Asia'
WHERE id = 5;

UPDATE fauna SET threat = '1) Poaching has long been a problem. 2) Habitat destruction and degradation. 3) Conflict with fishermen.'
WHERE id = 5;

ALTER TABLE fauna ADD kind VARCHAR(30);

INSERT INTO fauna VALUES
(NULL,'Bonobo','Africa','1) Habitat loss. 2) Human hunting and war.','https://en.wikipedia.org/wiki/Bonobo','/images/Bonobo.jpg','The bonobo is commonly considered to be more gracile than the common chimpanzee. Adult female bonobos are somewhat smaller than adult males.
The bonobo''s head is relatively smaller than that of the common chimpanzee with less prominent brow ridges above the eyes. 
It has a black face with pink lips, small ears, wide nostrils, and long hair on its head that forms a parting. Females have slightly more prominent breasts, in contrast to the flat breasts of other female apes, although not so prominent as those of humans. 
The bonobo also has a slim upper body, narrow shoulders, thin neck, and long legs when compared to the common chimpanzee.','Asia','Hominidae'),
(NULL,'Bornean orangutan','Asia','1) Illegal logging, fire and the extensive development of palm oil plantations by human. 2) Climate change
','https://en.wikipedia.org/wiki/Bornean_orangutan','/images/Bornean_orangutan.jpg','The Bornean orangutan has a distinctive body shape with very long arms that may reach up to 1.5 metres in length. 
It has grey skin, a coarse, shaggy, reddish coat and prehensile, grasping hands and feet. It also has large, fatty cheek pads known as flanges as well as a pendulous throat sac.
Males have much larger cheek pads, or flanges, that are composed of muscle and large amounts of fat. In females, the flanges are mostly composed of muscle. Males have relatively larger canines and premolars. 
Males have a more pronounced beard and mustache. The throat sac in males is also considerably larger. There are two body types for sexually mature males: smaller or larger. Larger males are more dominant but smaller males still breed successfully. There is little sexual dimorphism at birth.','America','Hominidae'),
(NULL,'Chimpanzee','Africa','1) Habitat destruction. 2) Human poaching. 3) Infectious diseases ','https://en.wikipedia.org/wiki/Chimpanzee','/images/Chimpanzee.jpg','Adult chimpanzees have an average standing height of 150 cm. 
A chimp''s head is rounded with a prominent and prognathous face and a pronounced brow ridge. It has forward-facing eyes, a small nose, rounded non-lobed ears, a long mobile upper lip and, in adult males, sharp canine teeth. 
Chimps lack the prominent sagittal crest and associated head and neck musculature of gorillas.
Chimpanzee bodies are covered by coarse hair, except for the face, fingers, toes, palms of the hands, and soles of the feet. Chimps lose more hair as they age, and develop bald spots. 
As with bonobos and gorillas, chimps move quadrupedally by knuckle-walking, which probably evolved independently in Pan and Gorilla. The physical strength of chimps is around 1.5 times greater than humans
','Europe','Hominidae'),
(NULL,'Eastern lowland gorilla','Africa','1) Poaching. 2) Civil unrest. 3) Habitat destruction ','https://en.wikipedia.org/wiki/Eastern_lowland_gorilla','/images/Eastern_lowland_gorilla.jpg','It is the largest of the four gorilla subspecies. 
It has a jet black coat like the mountain gorilla (Gorilla beringei beringei), although the hair is shorter on the head and body. 
The male''s coat, like that of other gorillas, greys as the animal matures, resulting in the designation "silverback".','Asia','Hominidae');


