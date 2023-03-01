PRAGMA foreign_keys = ON;

DROP TABLE question_like;
DROP TABLE replies;
DROP TABLE questions_follows;
DROP TABLE questions;
DROP TABLE users;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_like (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    like_status BOOLEAN NOT NULL
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Brandon', 'Leung'),
    ('James', 'Smith'),
    ('Monta', 'Vista'),
    ('Vamshi', 'Rendu');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('sql', 'what is sql?', (SELECT id FROM users WHERE fname = 'Brandon'));

INSERT INTO 
    questions_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'sql'), (SELECT author_id FROM questions WHERE title = 'sql') );




