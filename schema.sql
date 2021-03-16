DROP TABLE SALES;
DROP TABLE REVIEW;
DROP TABLE BESTSELLER_LIST;
DROP TABLE book;
DROP TABLE publisher;
DROP TABLE authors;

CREATE TABLE authors (
    "id" INT PRIMARY KEY  NOT NULL,
    "authors" VARCHAR   NOT NULL
);

CREATE TABLE publisher (
    "id" INT PRIMARY KEY  NOT NULL,
    "publisher_name" VARCHAR   NOT NULL
);

CREATE TABLE book (
    "isbn10" VARCHAR PRIMARY KEY  NOT NULL,
    "title" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "language" VARCHAR   NOT NULL,
    "published_date" DATE   NOT NULL,
    "publisher_id" INT NOT NULL,
	"num_pages" INT NOT NULL,
    "author_id" INT   NOT NULL,
	FOREIGN KEY (publisher_id) REFERENCES Publisher(id),
	FOREIGN KEY (author_id) REFERENCES public.Authors(id)
);

CREATE TABLE bestseller_list (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "isbn10" VARCHAR NOT NULL,
    "list_name" VARCHAR   NOT NULL,
    "rank" INT   NOT NULL,
    "weeks_on_list" INT   NOT NULL
);

CREATE TABLE sales (
    "id" SERIAL PRIMARY KEY  NOT NULL,
	"isbn10" VARCHAR NOT NULL,
    "price" DECIMAL(5,2)   NOT NULL,
    "amazon_product_url" VARCHAR   NOT NULL
);

CREATE TABLE review (
	"id" SERIAL PRIMARY KEY  NOT NULL,
    "isbn10" VARCHAR NOT NULL,
    "average_rating" DECIMAL(5,2)   NOT NULL,
    "ratings_count" INT   NOT NULL,
    "text_reviews_count" INT   NOT NULL
)
