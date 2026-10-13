CREATE TABLE users
(
    id        TEXT PRIMARY KEY,
    name      TEXT,
    email     TEXT,
    user_data JSONB NOT NULL
);

CREATE TABLE rights
(
    story_id            TEXT NOT NULL REFERENCES stories (id),
    user_id             TEXT NOT NULL REFERENCES users (id),
    can_read            BOOLEAN DEFAULT TRUE,
    can_write           BOOLEAN DEFAULT FALSE,
    can_delete          BOOLEAN DEFAULT FALSE,
    can_comment         BOOLEAN DEFAULT FALSE,
    can_change_settings BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (story_id, user_id)
);

CREATE TABLE stories
(
    id         TEXT PRIMARY KEY,
    created    DATE    DEFAULT CURRENT_TIMESTAMP,
    modified   DATE    DEFAULT CURRENT_TIMESTAMP,
    metadata   JSONB NOT NULL,
    provenance JSONB NOT NULL,
    published  BOOLEAN DEFAULT FALSE,
    owner      TEXT  NOT NULL REFERENCES users (id)
);

CREATE TABLE blocks
(
    id          TEXT PRIMARY KEY,
    sort        INTEGER NOT NULL,
    created     DATE DEFAULT CURRENT_TIMESTAMP,
    modified    DATE DEFAULT CURRENT_TIMESTAMP,
    story_id    TEXT    NOT NULL REFERENCES stories (id),
    resource_id TEXT    NOT NULL REFERENCES resources (id),
    kind        TEXT    NOT NULL,
    metadata    JSONB   NOT NULL,
    provenance  JSONB   NOT NULL,
    cues        JSONB   NOT NULL
);

CREATE TABLE runs
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    "when"      DATETIME DEFAULT CURRENT_TIMESTAMP,
    resource_id TEXT NOT NULL REFERENCES resources (id),
    story_id    TEXT REFERENCES stories (id),
    block_id    TEXT REFERENCES blocks (id)
);

CREATE TABLE comments
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    date     DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id  TEXT NOT NULL REFERENCES users (id),
    story_id TEXT REFERENCES stories (id),
    block_id TEXT REFERENCES blocks (id),
    comment  TEXT NOT NULL
);

CREATE TABLE resources
(
    id      TEXT PRIMARY KEY,
    mime    TEXT NOT NULL,
    href    TEXT,
    content TEXT
);

CREATE INDEX blocks_story_id ON blocks (story_id);
CREATE INDEX blocks_resource_id ON blocks (resource_id);
CREATE INDEX runs_resource_id ON runs (resource_id);
CREATE INDEX runs_story_id ON runs (story_id);
CREATE INDEX runs_block_id ON runs (block_id);
CREATE INDEX comments_user_id ON comments (user_id);
CREATE INDEX comments_story_id ON comments (story_id);
CREATE INDEX comments_block_id ON comments (block_id);
