PRAGMA foreign_keys = ON;

-- DROP TABLE [IF EXISTS] users, questions, question_follows, replies, question_likes;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER, 

    FOREIGN KEY (author_id) REFERENCES users(id) 
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id) 
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL, 
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    parent_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id) 
    FOREIGN KEY (author_id) REFERENCES users(id)  
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL, 
    user_id INTEGER NOT NULL,  

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)  
);

INSERT INTO 
    users('fname', 'lname')
VALUES
    ('terry','chow'), ('joe', 'idk'), ('henry', 'ryu');

INSERT INTO 
    questions('title', 'body', 'author_id')
VALUES
    ('home location','where do you live',1), ('ownership','What do you have', 2), ('color','what is your favorite color', 2);

INSERT INTO 
    question_follows('user_id', 'question_id')
VALUES
    (1,1), (1,2), (2,3), (1,3);

INSERT INTO
    replies('question_id', 'title', 'body', 'author_id', 'parent_id')
VALUES
    ('1', 'home reply', 'Sunnyvale', '2', NULL), ('1', 'home reply', 'isn'' it Fremont?', '3', '1'), ('1', 'home reply', 'It is Fremont', '3', '2') ,('2', 'ownership reply', 'laptop', '3', NULL);

INSERT INTO 
    question_likes('question_id', 'user_id')
VALUES
    ('1', '1'), ('2', '2'), ('3', '2'), ('1', '2');



