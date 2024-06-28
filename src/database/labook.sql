-- Active: 1719192535568@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password, role) VALUES
('u001', 'fernando', 'fernando@email.com', 'dOWhwterh#!@wedtr!@/Tfaefwgh.aSFf3.C', 'NORMAL'),
('u002', 'lucia', 'lucia@email.com', 'gqewrgychq9Iwefwhr!?@enQL8ubebrgqewghte', 'NORMAL'),
('u003', 'marta', 'marta@email.com', 'hetgrrf$%@VHGVgegqmtebr@!.', 'ADMIN');

SELECT * FROM users;
DROP TABLE users;

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL, 
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO posts (id, creator_id, content) 
VALUES
('p001', 'u001', 'Mandatory stop at Graal'),
('p002', 'u002', 'Did yall see what Kanye did this time?'),
('p003', 'u003', 'No pain no gain');

SELECT * FROM posts;
DROP TABLE posts;

CREATE TABLE likes_dislikes (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts (id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

INSERT INTO likes_dislikes (user_id, post_id, like) 
VALUES
('u001', 'p002', 1),
('u002', 'p001', 1),
('u003', 'p002', 1),
('u003', 'p002', 0);

UPDATE posts SET likes = 2 WHERE id='p002';
UPDATE posts SET dislikes = 2 - 1 WHERE id='p002';
UPDATE posts SET likes = 1 WHERE id='p001';

SELECT * FROM likes_dislikes;
DROP TABLE likes_dislikes;