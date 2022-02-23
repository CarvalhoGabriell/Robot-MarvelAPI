from faker import Faker
fake = Faker()


def create_characters():
    return {

        "name": fake.name(),
		"aliases": "Iron Man",
		"age": fake.unique.random_int(10,3000),
		"team": "Avengers",
		"active": False
    }

def create_heroe():

	return {
		"name": "Reed Richards",
		"aliases": "Sr Fantastico",
		"age": 45,
		"team": "Fantastic Four",
		"active": True
	}

def create_Tocha():
    	 
	return 	{
		"name": "Tocha Humana",
		"aliases": "Tocha",
		"age": 30,
		"team": "Quarteto Fantastico",
		"active": True
	}

def create_Viuva():
    	 
	return 	{
		"name": "Natasha Romanoff",
		"aliases": "Viuva Negra",
		"age": 39,
		"team": "Avengers",
		"active": False
	}