-- Таблиця "Users"
CREATE TABLE "Users" (
    user_id INT PRIMARY KEY,
    mood VARCHAR(50) NOT NULL,
    CHECK (mood ~ '^[a-zA-Z]+$')
);

-- Таблиця "Psychologist"
CREATE TABLE "Psychologist" (
    psychologist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    experience_years INT CHECK (experience_years >= 0),
    CHECK (name ~ '^[A-Z][a-zA-Z\s\-]*$')
);

-- Таблиця "Emotion_State"
CREATE TABLE "Emotion_State" (
    emotion_id INT PRIMARY KEY,
    emotion_type VARCHAR(50),
    intensity INT CHECK (intensity >= 0 AND intensity <= 100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "Users"(user_id)
);

-- Таблиця "Recommendation"
CREATE TABLE "Recommendation" (
    recommendation_id INT PRIMARY KEY,
    content VARCHAR(200),
    emotion_id INT,
    FOREIGN KEY (emotion_id) REFERENCES "Emotion_State"(emotion_id)
);

-- Таблиця "Track"
CREATE TABLE "Track" (
    track_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration INT CHECK (duration >= 0),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "Users"(user_id)
);

-- Таблиця "Report"
CREATE TABLE "Report" (
    report_id INT PRIMARY KEY,
    summary VARCHAR(500),
    report_date DATE,
    user_id INT,
    psychologist_id INT,
    FOREIGN KEY (user_id) REFERENCES "Users"(user_id),
    FOREIGN KEY (psychologist_id) REFERENCES "Psychologist"(psychologist_id)
);

-- Вставка данных в таблицю "Users"
INSERT INTO "Users" (user_id, mood) VALUES
(1, 'Happy'),
(2, 'Sad'),
(3, 'Excited'),
(4, 'Angry');

-- Вставка данных в таблицю "Psychologist"
INSERT INTO "Psychologist" (psychologist_id, name, experience_years) VALUES
(1, 'Dr. Smith', 5),
(2, 'Dr. Johnson', 10),
(3, 'Dr. Lee', 3);

-- Вставка данных в таблицю "Emotion_State"
INSERT INTO "Emotion_State" (emotion_id, emotion_type, intensity, user_id) VALUES
(1, 'Joy', 90, 1),
(2, 'Sadness', 70, 2),
(3, 'Excitement', 85, 3),
(4, 'Anger', 95, 4);

-- Вставка данных в таблицю "Recommendation"
INSERT INTO "Recommendation" (recommendation_id, content, emotion_id) VALUES
(1, 'Take a walk to relax.', 1),
(2, 'Listen to calming music.', 2),
(3, 'Engage in a fun activity.', 3),
(4, 'Practice deep breathing exercises.', 4);

-- Вставка данных в таблицю "Track"
INSERT INTO "Track" (track_id, title, genre, duration, user_id) VALUES
(1, 'Happy Song', 'Pop', 210, 1),
(2, 'Sad Song', 'Blues', 180, 2),
(3, 'Exciting Tune', 'Rock', 200, 3),
(4, 'Angry Anthem', 'Metal', 240, 4);

-- Вставка данных в таблицю "Report"
INSERT INTO "Report" (report_id, summary, report_date, user_id, psychologist_id) VALUES
(1, 'User reported feeling extremely happy and energized.', '2024-11-27', 1, 1),
(2, 'User mentioned ongoing sadness and low energy levels.', '2024-11-27', 2, 2),
(3, 'User expressed excitement about upcoming events.', '2024-11-27', 3, 3),
(4, 'User described a high level of anger and frustration.', '2024-11-27', 4, 1);

