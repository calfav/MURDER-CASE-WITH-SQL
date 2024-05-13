/*A crime has taken place and the detective needs your help. 
The detective gave you the crime scene report, but you somehow lost it.
You vaguely remember that the crime was a murder that occured sometime on Jan.15, 2018 
and that it took place in SQL City. 
*/
-

Select * from crime_scene_report
WHERE date = 20180115 and city = 'SQL City'


/*Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/


Select * from person
where address_street_name = 'Northwestern Dr'
order by address_number desc

-- Our first Witness is Morty Schapiro with License ID 118009, Address Number 4919 on Northwestern Dr
-- with ssn 111564949 with ID 14887





-- The second witness, named Annabel, lives somewhere on "Franklin Ave".


Select * from person
WHERE address_street_name like '%Franklin Ave' AND name like 'Annabel%'

-- Our Second Witness is Annabel Miller with License ID 490173, Address Number 103 on Franklin Ave
-- with ssn 318771143 with ID 16371


SELECT * FROM Interview
WHERE Person_Id IN (14887, 16371)


/*	Witness One: Morty with ID 14887 said I heard a gunshot and then saw a man run out.
	He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z".
	Only gold members have those bags. The man got into a car with a plate that included "H42W".
	
	Witness Two: I saw the murder happen, and I recognized the killer from my gym when I was 
	working out last week on the 9th of January.
	

*/


	Select * from get_fit_now_member
	Where Id like '48Z%' AND Membership_status = 'gold'
	
	
--	Our suspects are Joe Germuska with Id 48z7a, person id 28819, membership start date 20160305, and gold membership
--	Our second suspect is Jeremy Bowers with Id 48z55, 67318, membership start date of 20160101 and gold status.


	Select * from get_fit_now_check_in
	Where check_in_date = 20180109 AND membership_Id IN ('48Z7A', '48Z55')
	
--	Both came to the gym on the 9th

	Select dl.age, dl.height, dl.gender, dl.hair_color, dl.plate_number, dl.car_make, dl.car_model,
			p.name, p.ssn, p.address_Street_name, p.id
	From drivers_license as dl
	Left Join person as p
	On dl.id = p.license_id
	Where plate_number like '%H42W%' or Plate_number like 'H42W%' Or Plate_number like '%H42W'
	
--	Our killer is Jeremy Bowers.
/* Congrats, you found the murderer! But wait, there's more....
If you think you are up for a challenge, try querying the interview transcript of the murderer to find the real
villian behind this crime. 
*/

	Select * from Interview
	Where person_id = 67318
	

/* Jeremy Bowers said I was hired by a woman with a lot of money.
I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017. */

CREATE TABLE our_suspects AS (SELECT * FROM Drivers_license
							 WHERE Height BETWEEN 65 AND 67
							 AND hair_color = 'red'
							 AND gender = 'female'
							 AND car_make = 'Tesla'
							 AND car_model = 'Model S')
							 
							 SELECT * FROM our_suspects

SELECT * FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND Date BETWEEN 20171201 AND 20171231


SELECT s.id, s.age, s.height, p.id, AS person_id, p.name, p.address_street_name, p.ssn
FROM our_suspect AS s
RIGHT JOIN Person AS p
ON s.id = p.license_id

/* our three suspect have the person id 99716, 90700, 78881

the culprit who sent powers has person id 99716 */

SELECT * FROM Person
WHERE id = 99716


	
	
	
	
	
	


















