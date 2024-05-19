BEGIN;

CREATE TABLE interview.race (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    speed INT NOT NULL,
    bonus_strength INT NOT NULL,
    bonus_dexterity INT NOT NULL,
    bonus_constitution INT NOT NULL,
    bonus_intelligence INT NOT NULL,
    bonus_wisdom INT NOT NULL,
    bonus_charisma INT NOT NULL
);

CREATE TABLE interview.class (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    hit_die VARCHAR(10) NOT NULL,
    primary_ability VARCHAR(100) NOT NULL,
    saves VARCHAR(100) NOT NULL
);

CREATE TABLE interview.character (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    race_id INT,
    class_id INT,
    level INT NOT NULL DEFAULT 1,
    hit_points INT NOT NULL,
    strength INT NOT NULL,
    dexterity INT NOT NULL,
    constitution INT NOT NULL,
    intelligence INT NOT NULL,
    wisdom INT NOT NULL,
    charisma INT NOT NULL,
    experience INT NOT NULL DEFAULT 0,
    FOREIGN KEY (race_id) REFERENCES race(id),
    FOREIGN KEY (class_id) REFERENCES class(id)
);


INSERT INTO interview.race (name, description, speed, bonus_strength, bonus_dexterity, bonus_constitution, bonus_intelligence, bonus_wisdom, bonus_charisma)
VALUES
('Human', 'Versatile and ambitious, humans are the most adaptable of all races.', 30, 1, 1, 1, 1, 1, 1),
('Elf', 'Graceful and wise, elves are known for their long lifespans and keen senses.', 35, 0, 2, 0, 1, 1, 0),
('Dwarf', 'Stout and sturdy, dwarves are known for their resilience and craftsmanship.', 25, 2, 0, 2, 0, 0, 0),
('Halfling', 'Small and nimble, halflings are known for their luck and agility.', 25, 0, 2, 0, 0, 0, 2),
('Dragonborn', 'Strong and charismatic, dragonborn are known for their draconic ancestry and breath weapons.', 30, 2, 0, 1, 0, 0, 1);


INSERT INTO interview.class (name, description, hit_die, primary_ability, saves)
VALUES
('Fighter', 'A master of martial combat, skilled with a variety of weapons and armor.', 'd10', 'Strength or Dexterity', 'Strength, Constitution'),
('Wizard', 'A scholarly magic-user capable of manipulating the structures of reality.', 'd6', 'Intelligence', 'Intelligence, Wisdom'),
('Rogue', 'A scoundrel who uses stealth and trickery to overcome obstacles and enemies.', 'd8', 'Dexterity', 'Dexterity, Intelligence'),
('Cleric', 'A priestly champion who wields divine magic in service of a higher power.', 'd8', 'Wisdom', 'Wisdom, Charisma'),
('Bard', 'An inspiring magician whose power echoes the music of creation. Bards use their magic to support and enhance their allies, as well as hinder their foes.', 'd8', 'Charisma', 'Dexterity, Charisma');

INSERT INTO interview.character (name, race_id, class_id, level, hit_points, strength, dexterity, constitution, intelligence, wisdom, charisma, experience)
VALUES
('Aelar', 2, 2, 3, 18, 8, 14, 10, 16, 14, 10, 500),
('Borin', 3, 1, 2, 24, 16, 10, 14, 8, 12, 8, 300),
('Calyssa', 1, 4, 1, 10, 10, 12, 14, 12, 16, 14, 100),
('Dorn', 3, 1, 4, 36, 18, 10, 16, 8, 12, 8, 900),
('Eldrin', 2, 2, 5, 22, 8, 16, 10, 18, 14, 10, 1200),
('Finn', 4, 3, 3, 20, 8, 18, 10, 12, 12, 16, 500),
('Gorim', 3, 1, 2, 26, 16, 8, 16, 8, 10, 10, 300),
('Halia', 1, 4, 3, 16, 8, 12, 14, 12, 18, 14, 500),
('Iris', 1, 2, 4, 20, 8, 14, 10, 18, 14, 10, 800),
('Jorin', 3, 1, 5, 40, 18, 10, 18, 8, 10, 8, 1300),
('Kara', 2, 4, 1, 12, 8, 14, 12, 10, 16, 16, 200),
('Lira', 4, 3, 2, 18, 8, 18, 10, 12, 12, 16, 400),
('Milo', 4, 3, 1, 14, 8, 18, 10, 12, 10, 16, 100),
('Nim', 2, 2, 3, 24, 8, 16, 10, 18, 14, 12, 500),
('Orin', 3, 1, 4, 34, 18, 8, 16, 8, 12, 8, 900),
('Pelor', 1, 4, 2, 14, 10, 12, 12, 12, 16, 16, 400),
('Quinn', 2, 2, 1, 16, 8, 14, 10, 18, 12, 12, 100),
('Rin', 4, 3, 3, 22, 8, 18, 10, 12, 12, 16, 500),
('Sara', 1, 4, 4, 18, 10, 12, 14, 12, 18, 14, 800),
('Taran', 3, 1, 5, 38, 18, 8, 18, 8, 10, 8, 1200),
('Ulric', 3, 1, 1, 20, 16, 10, 14, 8, 12, 8, 200),
('Vera', 1, 4, 2, 12, 10, 12, 12, 12, 16, 16, 400),
('Willow', 2, 2, 3, 26, 8, 14, 10, 18, 14, 10, 600),
('Xander', 1, 3, 2, 20, 10, 16, 12, 12, 12, 16, 400),
('Yara', 2, 4, 1, 14, 8, 14, 10, 16, 18, 12, 200),
('Zane', 1, 3, 3, 24, 8, 18, 12, 12, 12, 16, 600),
('Arin', 3, 1, 4, 32, 18, 10, 16, 8, 10, 8, 800),
('Bella', 4, 3, 1, 16, 8, 18, 10, 12, 10, 16, 200),
('Cade', 4, 3, 2, 22, 8, 18, 10, 12, 12, 16, 400),
('Dara', 2, 2, 3, 24, 8, 14, 10, 18, 12, 12, 600),
('Evan', 1, 4, 4, 16, 10, 12, 14, 12, 18, 14, 800),
('Fiona', 2, 2, 1, 14, 8, 14, 10, 18, 14, 12, 200),
('Garen', 3, 1, 5, 36, 18, 8, 18, 8, 10, 8, 1300),
('Hank', 1, 3, 2, 18, 10, 16, 12, 12, 12, 16, 400),
('Inara', 2, 4, 3, 20, 8, 14, 10, 16, 18, 12, 600),
('Jax', 1, 3, 4, 28, 8, 18, 12, 12, 12, 16, 800),
('Kira', 4, 3, 1, 12, 8, 18, 10, 12, 10, 16, 100),
('Liam', 3, 1, 2, 26, 16, 10, 14, 8, 10, 8, 300),
('Mira', 1, 4, 3, 18, 10, 12, 14, 12, 18, 14, 500),
('Nara', 2, 2, 4, 22, 8, 14, 10, 18, 12, 12, 800),
('Olin', 3, 1, 5, 34, 18, 8, 18, 8, 10, 8, 1200),
('Piper', 1, 4, 2, 12, 10, 12, 12, 12, 16, 16, 200),
('Quill', 2, 2, 3, 24, 8, 14, 10, 18, 12, 12, 500),
('Rina', 4, 3, 1, 16, 8, 18, 10, 12, 10, 16, 200),
('Sara', 1, 4, 4, 16, 10, 12, 14, 12, 18, 14, 800),
('Tara', 3, 1, 5, 36, 18, 8, 18, 8, 10, 8, 1200),
('Ulric', 1, 3, 1, 18, 10, 16, 12, 12, 12, 16, 200),
('Vera', 2, 4, 2, 14, 8, 14, 10, 16, 18, 12, 400),
('Willow', 1, 2, 3, 24, 8, 14, 10, 18, 14, 12, 600);

END;