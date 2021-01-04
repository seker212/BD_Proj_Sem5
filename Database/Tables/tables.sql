CREATE TABLE class
(
    id          INT          NOT NULL,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE orderType
(
    id          INT          NOT NULL,
    name        VARCHAR(255) NOT NULL,
    classId     INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (classId) REFERENCES class (id)
);
CREATE TABLE family
(
    id          INT          NOT NULL,
    name        VARCHAR(255) NOT NULL,
    orderId     INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (orderId) REFERENCES orderType (id)
);
CREATE TABLE subfamily
(
    id          INT          NOT NULL,
    name        VARCHAR(255) NOT NULL,
    familyId    INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (familyId) REFERENCES family (id)
);
CREATE TABLE genus
(
    id          INT          NOT NULL,
    name        VARCHAR(255) NOT NULL,
    familyId    INT,
    subfamilyId INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (familyId) REFERENCES family (id),
    FOREIGN KEY (subfamilyId) REFERENCES subfamily (id)
);
CREATE TABLE species
(
    id              INT                                                                                                  NOT NULL,
    name            VARCHAR(255)                                                                                         NOT NULL,
    genusId         INT,
    description     VARCHAR(255),
    endemism        BOOLEAN,
    size            ENUM ('microscopic', 'tiny', 'small', 'medium', 'big', 'huge', 'gargantuan')                         NOT NULL,
    food            ENUM ('herbivore', 'omnivore', 'carnivore', 'scavenger')                                             NOT NULL,
    locomotion      ENUM ('swimming', 'flying', 'jumping', 'climbing', 'running', 'arboreal', 'subterranean', 'passive') NOT NULL,
    reproduction    ENUM ('asexual', 'allogamy', 'autogamy', 'samesex')                                                  NOT NULL,
    averageWeight   REAL,
    averageLifespan REAL,
    population      INT,
    PRIMARY KEY (id),
    FOREIGN KEY (genusId) REFERENCES genus (id)
);
CREATE TABLE location
(
    id          INT                                                                                                                                                                                                                  NOT NULL,
    continent   ENUM ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Antarctica', 'Australia')                                                                                                                       NOT NULL,
    environment ENUM ('savanna', 'rain forest', 'desert', 'polar ice', 'mountain', 'coral reef', 'tundra', 'rotting log', 'wetlands', 'tide pool', 'coniferous forest', 'deciduous forest', 'temperate grassland', 'mediterrranean') NOT NULL,
    speciesId   INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (speciesId) REFERENCES species (id)
);
CREATE TABLE foodchain
(
    prayId   INT,
    hunterId INT,
    FOREIGN KEY (prayId) REFERENCES species (id),
    FOREIGN KEY (hunterId) REFERENCES species (id)
);
CREATE TABLE pictures
(
    hashcode  VARCHAR(255),
    content   BLOB,
    speciesId INT,
    FOREIGN KEY (speciesId) REFERENCES species (id)
)