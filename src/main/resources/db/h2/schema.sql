DROP TABLE users IF EXISTS;
DROP TABLE schedules IF EXISTS;

CREATE TABLE users (
  id    INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  created_at TIMESTAMP,
  modified_at TIMESTAMP,
  deleted_at TIMESTAMP,
  name  VARCHAR(30),
  email VARCHAR(80)
);
CREATE INDEX users_name ON users (name);


CREATE TABLE schedules (
  id    INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  created_at TIMESTAMP,
  modified_at TIMESTAMP,
  deleted_at TIMESTAMP,
  title VARCHAR(50),
  is_all_day CHAR(1), -- Boolean
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  tag INTEGER,
  is_outdated CHAR(1), -- Boolean
  user_id INTEGER
);
ALTER TABLE schedules ADD CONSTRAINT fk_schedules_users FOREIGN KEY (user_id) REFERENCES users (id);
CREATE INDEX created_date ON schedules (start_time);

