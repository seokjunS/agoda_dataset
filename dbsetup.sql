USE agoda;

DROP TABLE IF EXISTS hotellist;
CREATE TABLE hotellist
(
        hotel_id INT NOT NULL,
        chain_id INT,
        chain_name VARCHAR(70),
        brand_id INT,
        brand_name VARCHAR(70),
        hotel_name VARCHAR(70),
        hotel_formerly_name VARCHAR(70),
        hotel_translated_name VARCHAR(70),
        addressline1 VARCHAR(50),
        addressline2 VARCHAR(50),
        zipcode VARCHAR(15),
        city VARCHAR(50),
        state VARCHAR(50),
        country VARCHAR(50),
        countryisocode VARCHAR(2),
        star_rating NUMERIC(2,1),
        longitude NUMERIC(9,6),
        latitude NUMERIC(9,6),
        url VARCHAR(150),
        checkin VARCHAR(10),
        checkout VARCHAR(10),
        numberrooms INT,
        numberfloors INT,
        yearopened INT,
        yearrenovated INT,
        photo1 VARCHAR(150),
        photo2 VARCHAR(150),
        photo3 VARCHAR(150),
        photo4 VARCHAR(150),
        photo5 VARCHAR(150),
        overview VARCHAR(400),
        rates_from INT,
        continent_id INT,
        continent_name VARCHAR(50),
        city_id INT,
        country_id INT,
        number_of_reviews INT,
        rating_average NUMERIC(3,1),
        rates_currency VARCHAR(3),
        TimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (hotel_id)
) CHARACTER SET utf8 COLLATE utf8_unicode_ci;



LOAD DATA LOCAL INFILE 'data.csv'
INTO TABLE hotellist CHARACTER SET utf8
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE INDEX hotellist_geoloc ON hotellist(latitude, longitude);
CREATE INDEX hotellist_name ON hotellist(hotel_translated_name);
